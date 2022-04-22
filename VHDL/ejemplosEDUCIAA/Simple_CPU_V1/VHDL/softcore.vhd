--- Entidad: softcore.
--- Descripción: Esta entidad es el toplevel del Simple CPU V1
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
use IEEE.numeric_std.all;


--Entidad.
entity softcore is
  generic(
    cpu_data_word_length : integer := 8
  );
  port (
  clock_in   : in  std_logic ;
  clr_in     : in  std_logic ;
  cpu_out    : out std_logic_vector(cpu_data_word_length-1 downto 0);
  chip_en    : in  std_logic ;
  serial_we  : out std_logic
  );
end entity;

--Arquitectura
architecture softcore_arch of softcore is

  --declaracion de los componentes utilizados
  --ALU
  component ALU
      generic (
          N_BITS : integer := 8
      );
      port (
          a_in    : in  std_logic_vector(N_BITS-1 downto 0);
          b_in    : in  std_logic_vector(N_BITS-1 downto 0);
          s0_in   : in  std_logic;
          s1_in   : in  std_logic;
          s2_in   : in  std_logic;
          s3_in   : in  std_logic;
          s4_in   : in  std_logic;
          z_out   : out std_logic_vector(N_BITS-1 downto 0);
          Car_out : out std_logic
      );
  end component ALU;

  --decoder
  component decoder_toplevel is
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
  end component decoder_toplevel;

  --registros PIPO
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

  --flip flops D
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

  --memoria RAM
  component RAM256x16
      generic (
          WORD_LENGTH : integer := 16;
          ADDR_LENGTH : integer := 8
      );
      port (
          clk_in     : in  std_logic;
          writeEn_in : in  std_logic;
          address_in : in  std_logic_vector(ADDR_LENGTH-1 downto 0);
          data_in    : in  std_logic_vector(WORD_LENGTH-1 downto 0);
          data_out   : out std_logic_vector(WORD_LENGTH-1 downto 0)
      );
  end component RAM256x16;

  --declaracion de constantes
  constant NUM_BITS   : integer := 8  ;
  constant ADDR_LEN   : integer := 8  ;
  constant RAM_WORD   : integer := 16 ;
  constant IR_REG_LEN : integer := 16 ;

  --declaracion de las señales internas al softcore segun el modelo Simple CPU V1
  signal chip_en_s  : std_logic ;
  signal clear_s    : std_logic ; -- clear de todo el sistema
  signal vcc_s      : std_logic ;
  signal cpu_di_s : std_logic_vector (RAM_WORD-1 downto 0); --la salida de la ram
  signal cpu_do_s : std_logic_vector (RAM_WORD-1 downto 0); --la entrada a la ram
  signal ram_we_s : std_logic ; -- habilitacion de escritura de la ram
  signal ram_ad_s : std_logic_vector (NUM_BITS-1 downto 0); --entrada de la direccion de la ram, en caso de estar WE en alto esta provee la direccion donde escribir y sino de donde sale el dato
  signal clock_s  : std_logic ; -- clock de todos los componentes secuenciales
  signal nclock_s : std_logic ; -- clock de la ram ya que esta va negado
  signal acc_out_s: std_logic_vector (NUM_BITS-1 downto 0); --la salida del acumulador
  signal en_da_s  : std_logic ; -- habilita el clock del acumulador
  signal alu_out_s: std_logic_vector (NUM_BITS-1 downto 0); --el resultado de la ALU
  signal zero_s   : std_logic ; -- condicion de zero generada desde el resultado de la ALU
  signal carry_s  : std_logic ; -- condicion de carry generada desde la ALU
  signal alu_a_s  : std_logic_vector (NUM_BITS-1 downto 0); --primer sumando de la ALU
  signal alu_b_s  : std_logic_vector (NUM_BITS-1 downto 0); --segundo sumando de la ALU

  --inicio lineas de control de la ALU
  signal alu_s0_s : std_logic ;
  signal alu_s1_s : std_logic ;
  signal alu_s2_s : std_logic ;
  signal alu_s3_s : std_logic ;
  signal alu_s4_s : std_logic ;
  --fin lineas de control de la ALU

  signal pc_out_s : std_logic_vector (NUM_BITS-1 downto 0); -- salida del Program Counter
  signal muxa_s   : std_logic ; -- linea selectora del mux que selecciona el primer sumando de la ALU
  signal cpu_di_low_s : std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits menos significativos de la salida de la RAM
  signal ir_out_high_s: std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits mas significativos que salen de la IR
  signal muxb_s   : std_logic ; -- linea selectora del mux que selecciona el segundo sumando de la ALU
  signal muxc_s   : std_logic ; -- linea selectora del mux que selecciona el valor de la entrada addres de la ram
  signal en_pc_s  : std_logic ; -- linea de habilitacion del clock del program counter
  signal en_ir_s  : std_logic ; -- linea de habilitacion del clock del instrution register
  signal ir_out_low_s :std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits menos significativos de la salida del Instruction register
  signal ir_out_s : std_logic_vector(RAM_WORD-1 downto 0); -- la tira completa de bits que salen del ir
  signal fd_in  : std_logic ; -- entrada del flip flop FD de generacion de clear
  signal ground : std_logic ; -- señal que vale '0'

begin
  --asignacion de las señales internas
  chip_en_s <= chip_en ;
  clock_s <= clock_in      ;
  nclock_s <= not clock_in ;
  fd_in  <= not clr_in     ;
  ground <= '0' ;
  vcc_s  <= '1' ;
  cpu_out <= acc_out_s ;
  serial_we <= en_pc_s when cpu_di_s = x"E0FF" else '0';
  --componentes
  -----------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  --como en el diseño este flip flop no tiene ni clock enable ni reset se
  --conectan de forma que puedan ignorarse osea clk_ena en 1 y rst_in en 0
  FD : ffd
      generic map (risingEdgeClock => TRUE)
      port map (clk_in => clock_s,
                d_in   => fd_in  ,
                clk_ena=> vcc_s  ,
                rst_in => ground ,
                d_out  => clear_s
                );
  ------------------------------------------------------------------------------
  -- registros PC (16 bits) ACC e IR (8 bits)
  --program Counter
  program_counter : register_PIPO
                  generic map (N_BITS => NUM_BITS,
                               risingEdgeClock => TRUE)
                  port map (clk_in => clock_s,
                            clockEnable_in => en_pc_s,
                            rst_in => clear_s ,
                            d_in   => alu_out_s,
                            d_out  => pc_out_s
                            );
  --istruction register
  instruction_register : register_PIPO
                        generic map (N_BITS => IR_REG_LEN,
                                     risingEdgeClock => TRUE)
                        port map  (clk_in => clock_s,
                                   clockEnable_in => en_ir_s,
                                   rst_in => clear_s ,
                                   d_in   => cpu_di_s,
                                   d_out  => ir_out_s
                                   );
  --acumulador
  accumulator : register_PIPO
              generic map (N_BITS => NUM_BITS,
                           risingEdgeClock => TRUE)
              port map  (clk_in => clock_s,
                         clockEnable_in => en_da_s,
                         rst_in => clear_s  ,
                         d_in   => alu_out_s,
                         d_out  => acc_out_s
                         );
  ------------------------------------------------------------------------------
  --division de las tiras de bit que salen del IR y de la ram
  ir_out_high_s <= ir_out_s (IR_REG_LEN-1     downto IR_REG_LEN/2);
  ir_out_low_s  <= ir_out_s ((IR_REG_LEN/2)-1 downto  0);
  cpu_di_low_s  <= cpu_di_s ((RAM_WORD/2)-1   downto  0);
  --union de la tira de bits que entra a la RAM
  cpu_do_s  <= x"00" & acc_out_s ;
  ------------------------------------------------------------------------------
  -- inicio de los esquemas de multiplexacion
  -- multipexor del primer sumando de la alu
  with muxa_s select
      alu_a_s <= acc_out_s when '0',
                 pc_out_s  when others ;
  -- multipexor del segundo sumando de la alu
  with muxb_s select
       alu_b_s <= cpu_di_low_s when '0',
                  ir_out_low_s when others ;
  -- multiplexor para la siguiente direccion de la RAM
  with muxc_s select
       ram_ad_s <= pc_out_s when '0',
                   ir_out_low_s when others ;
  ------------------------------------------------------------------------------
  --generacion de la condicion de cero en la salida de la ALU
  zero_s <= '1' when alu_out_s = "00000000" else '0';
  ------------------------------------------------------------------------------
  --memoria RAM
  RAM256x16_0 : RAM256x16
      generic map (
            WORD_LENGTH => RAM_WORD,
            ADDR_LENGTH => ADDR_LEN
      )
      port map (
            clk_in     => nclock_s,
            writeEn_in => ram_we_s,
            address_in => ram_ad_s,
            data_in    => cpu_do_s,
            data_out   => cpu_di_s
      );

  ------------------------------------------------------------------------------
  --decoder
  decoder_0 : decoder_toplevel
      generic map (HALF_IR_LENGTH => IR_REG_LEN/2)
      port map (clk_in  => clock_s         ,
                clockEnable_in => chip_en_s   ,
                clr_in  => clear_s  ,
                carry_in=> carry_s  ,
                zero_in => zero_s   ,
                ir_in   => ir_out_high_s  ,
                ram_out => ram_we_s       ,
                alu_s0_out => alu_s0_s ,
                alu_s1_out => alu_s1_s ,
                alu_s2_out => alu_s2_s ,
                alu_s3_out => alu_s3_s ,
                alu_s4_out => alu_s4_s ,
                mux_a_out  => muxa_s ,
                mux_b_out  => muxb_s ,
                mux_c_out  => muxc_s ,
                ir_clockEnable_out =>en_ir_s,
                pc_clockEnable_out =>en_pc_s,
                da_clockEnable_out =>en_da_s);
  ------------------------------------------------------------------------------
  --ALU
  ALU_0 : ALU
      generic map (
          N_BITS => NUM_BITS
      )
      port map (
          a_in    => alu_a_s,
          b_in    => alu_b_s,
          s0_in   => alu_s0_s,
          s1_in   => alu_s1_s,
          s2_in   => alu_s2_s,
          s3_in   => alu_s3_s,
          s4_in   => alu_s4_s,
          z_out   => alu_out_s,
          Car_out => carry_s
      );
  ------------------------------------------------------------------------------
end architecture;
