--------------------------------------------------------------------------------
--- Entidad: decoder_toplevel.
--- Descripción: Esta entidad es el decoder completo que va dentro del
---              del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 4/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------

-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

--Entidad.
entity decoder_toplevel is
  ---El nombre HALF_IR_LENGTH hace referencia a que al decoder entran los 8
  ---bits mas significativos del instruction register
  generic (HALF_IR_LENGTH : integer := 8 );
  port (
  clk_in   : in std_logic ;
  clockEnable_in : in std_logic ;
  clr_in     : in std_logic ;
  carry_in   : in std_logic ;
  zero_in    : in std_logic ;
  ir_in      : in std_logic_vector(HALF_IR_LENGTH-1 downto 0);
  ram_out    : out std_logic;
  alu_s0_out : out std_logic;
  alu_s1_out : out std_logic;
  alu_s2_out : out std_logic;
  alu_s3_out : out std_logic;
  alu_s4_out : out std_logic;
  mux_a_out  : out std_logic;
  mux_b_out  : out std_logic;
  mux_c_out  : out std_logic;
  ir_clockEnable_out : out std_logic;
  pc_clockEnable_out : out std_logic;
  da_clockEnable_out : out std_logic
  );

end entity decoder_toplevel;

--Arquitectura.
architecture decoder_toplevel_arch of decoder_toplevel is

  --declaracion de los componentes

  component sequence_generator is
    port (
    clk_in         : in  std_logic ;
    clockEnable_in : in  std_logic ;
    rst_in         : in  std_logic ;
    fetch     : out std_logic ;
    decode    : out std_logic ;
    execute   : out std_logic ;
    increment : out std_logic
    );
  end component sequence_generator ;

  component register_PIPO is
    generic (
            N_BITS          : integer := 2    ;
            risingEdgeClock : BOOLEAN := TRUE);
    port (
    clk_in : in std_logic ;
    clockEnable_in : in std_logic ;
    rst_in : in  std_logic ;
    d_in   : in  std_logic_vector(N_BITS-1 downto 0);
    d_out  : out std_logic_vector(N_BITS-1 downto 0)
    );
  end component register_PIPO;

  component ffd is
    generic (risingEdgeClock : BOOLEAN := TRUE);
    port (
    clk_in : in std_logic ;
    rst_in : in std_logic ;
    clk_ena: in std_logic ;
    d_in   : in std_logic ;
    d_out  : out std_logic
    );
  end component ffd;

  component instruction_decoder is
    generic( N_BITS : integer := 8 );
    port (
        a_in        : in  std_logic_vector(N_BITS-1 downto 0);
        add         : out std_logic ;
        load        : out std_logic ;
        output_out  : out std_logic ;
        input_out   : out std_logic ;
        jumpz       : out std_logic ;
        jump        : out std_logic ;
        jumpnz      : out std_logic ;
        jumpc       : out std_logic ;
        jumpnc      : out std_logic ;
        sub         : out std_logic ;
        bitand      : out std_logic
    );
end component instruction_decoder;
  --Seccion declarativa de señales internas al decoder
  --constantes para legibilidad del codigo
  constant REG_LEN : integer := 2 ;
  constant NUM_BITS : integer := 8 ;

  --señales para las salidas del instruction decoder antes de la and
  --de verificacion de decode o execute
  signal add_s    : std_logic ;
  signal load_s   : std_logic ;
  signal output_s : std_logic ;
  signal input_s  : std_logic ;
  signal jump_s   : std_logic ;
  signal jumpz_s  : std_logic ;
  signal jumpnz_s : std_logic ;
  signal jumpc_s  : std_logic ;
  signal jumpnc_s : std_logic ;
  signal sub_s    : std_logic ;
  signal bitand_s : std_logic ;

  --señales para las salidas del instruction decoder despues de la and
  --de verificacion de decode o execute por eso el prefijo ver_
  signal ver_add_s    : std_logic ;
  signal ver_load_s   : std_logic ;
  signal ver_output_s : std_logic ;
  signal ver_input_s  : std_logic ;
  signal ver_jump_s   : std_logic ;
  signal ver_jumpz_s  : std_logic ;
  signal ver_jumpnz_s : std_logic ;
  signal ver_jumpc_s  : std_logic ;
  signal ver_jumpnc_s : std_logic ;
  signal ver_sub_s    : std_logic ;
  signal ver_bitand_s : std_logic ;

  --señales para las salidas del generador de secuencia
  signal fetch_s     : std_logic ;
  signal decode_s    : std_logic ;
  signal execute_s   : std_logic ;
  signal increment_s : std_logic ;

  --señales para el registro de almacenamiento del carry la condicion de cero
  -- zero_carry_reg_s (0) almacena la condicion de carry
  -- zero_carry_reg_s (1) almacena la condicion de cero
  signal zero_carry_reg_s : std_logic_vector (REG_LEN-1 downto 0) ;
  signal register_ena_s: std_logic  ;

  --señales para el flip flop de generacion de la condicion de salto no dado
  signal jump_not_taken_s : std_logic ;
  signal jump_not_taken_in_s : std_logic ;
  signal jump_not_taken_in_s_n : std_logic ;
  signal ffd_ena_s : std_logic ;

  --señales internas del decoder
  signal clk_s : std_logic ;
  signal clr_s : std_logic ;
  signal clk_ena_s : std_logic ;
  signal zero_carry_s : std_logic_vector (REG_LEN-1 downto 0) ;
  signal ir_in_s : std_logic_vector (NUM_BITS-1 downto 0) ;

begin

  --asignacion de señales internas del decoder
  clk_s <= clk_in ;
  clr_s <= clr_in ;
  clk_ena_s <= clockEnable_in ;
  zero_carry_s  <= carry_in & zero_in ;
  register_ena_s  <= add_s or sub_s or bitand_s ;
  ir_in_s <= ir_in ;
  ffd_ena_s <= '1' ;
  --Instanciación de los componentes usados

  -- generador de secuencia
  sequence_generator_0 : sequence_generator
                         port map (clk_in => clk_s,
                                   clockEnable_in => clk_ena_s,
                                   rst_in    => clr_s,
                                   fetch     => fetch_s,
                                   decode    => decode_s,
                                   execute   => execute_s,
                                   increment => increment_s);

  -- registro de dos bit para el cero y el carry
  register_2bit_0 : register_PIPO
                    generic map (N_BITS => REG_LEN ,
                                 risingEdgeClock => TRUE)
                    port map    (clk_in => clk_s,
                                 clockEnable_in => register_ena_s,
                                 rst_in => clr_s,
                                 d_in   => zero_carry_s,
                                 d_out  => zero_carry_reg_s
                                 );

  -- instruction decoder
  instruction_decoder_0 : instruction_decoder
                        generic map (N_BITS => NUM_BITS)
                        port    map (a_in   => ir_in_s,
                                     add    => add_s  ,
                                     load   => load_s ,
                                     output_out => output_s,
                                     input_out  => input_s ,
                                     jump   => jump_s  ,
                                     jumpz  => jumpz_s ,
                                     jumpnz => jumpnz_s,
                                     jumpc  => jumpc_s ,
                                     jumpnc => jumpnc_s,
                                     sub    => sub_s   ,
                                     bitand => bitand_s);

  -- asignacion de los valores de las salidas del instruction_decoder
  -- una vez verificada la fase de decode o execute, notese que en
  -- increment o fetch estas dan 0 ya que decode_s = execute_s = '0'

  ver_add_s    <= add_s    and (decode_s or execute_s);
  ver_load_s   <= load_s   and (decode_s or execute_s);
  ver_output_s <= output_s and (decode_s or execute_s);
  ver_input_s  <= input_s  and (decode_s or execute_s);
  ver_jump_s   <= jump_s   and (decode_s or execute_s);
  ver_jumpz_s  <= jumpz_s  and (decode_s or execute_s);
  ver_jumpnz_s <= jumpnz_s and (decode_s or execute_s);
  ver_jumpc_s  <= jumpc_s  and (decode_s or execute_s);
  ver_jumpnc_s <= jumpnc_s and (decode_s or execute_s);
  ver_sub_s    <= sub_s    and (decode_s or execute_s);
  ver_bitand_s <= bitand_s and (decode_s or execute_s);

  --flip flop D  de la genracion de jump not taken
  fdc : ffd
        generic map (risingEdgeClock => TRUE)
        port map    (clk_in => clk_s,
                     rst_in => clr_s,
                     clk_ena => ffd_ena_s,
                     d_in   => jump_not_taken_in_s,
                     d_out  => jump_not_taken_s) ;

  -- proceso combinacional de determinacion de la condicion de no salto
  jump_not_taken_in_s_n <= (jumpz_s  and zero_carry_reg_s(1))        or
                           (jumpnz_s and (not zero_carry_reg_s (1))) or
                           (jumpc_s  and zero_carry_reg_s(0))        or
                           (jumpnc_s and (not zero_carry_reg_s (0))) or
                           jump_s;

  jump_not_taken_in_s <= not  jump_not_taken_in_s_n ;

  --procesos combinacionales de determinacion de la salidas de control

  --salida de habilitacion de escritura de la RAM
  ram_out <= execute_s and ver_output_s ;

  --lineas de control de la ALU
  alu_s0_out <= ver_bitand_s or ver_input_s or ver_load_s   or
                ver_jump_s   or ver_jumpz_s or ver_jumpnz_s or
                ver_jumpc_s  or ver_jumpnc_s ;

  alu_s1_out <= ver_load_s   or ver_input_s or ver_output_s or
                ver_jump_s   or ver_jumpz_s or ver_jumpnz_s or
                ver_jumpc_s  or ver_jumpnc_s ;

  alu_s2_out <= increment_s or ver_sub_s ;
  alu_s3_out <= ver_sub_s ;
  alu_s4_out <= increment_s ;

  --lineas de control de los esquemas de multiplexacion del Simple CPU V1.
  mux_a_out <= increment_s ;
  mux_b_out <= ver_load_s or ver_add_s or ver_bitand_s or ver_sub_s ;
  mux_c_out <= ver_input_s or ver_output_s ;

  --habilitaciones de los distintos registros del Simple CPU V1.
  ir_clockEnable_out <= fetch_s ; --Instruction Register
  da_clockEnable_out <= (ver_load_s or ver_add_s or ver_bitand_s or ver_sub_s
                         or ver_input_s) and execute_s ; --acumulador
  pc_clockEnable_out <= ((increment_s and jump_not_taken_s) or
                        (jump_not_taken_in_s_n and execute_s)) and clockEnable_in
                        ;--program counter

end architecture;
