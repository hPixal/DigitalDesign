--------------------------------------------------------------------------------
--- Entidad: decoder_toplevel_tb.
--- Descripción: Este testbench permite probar el decoder completo
---              que va dentro del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 4/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos


--Entidad del testbench.
entity decoder_toplevel_tb is
end entity decoder_toplevel_tb;

--Arquitectura del testbench.
architecture decoder_toplevel_tb_arch of decoder_toplevel_tb is
    --declaracion del decoder
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



    --declaracion de constantes a usar
    constant PERIOD   : time    := 400 ns;
    constant N_BITS   : integer := 8 ;
    constant N_INST   : integer := 11;
    constant CANT_VAR : integer := 4 ;

    --declaracion de los array utilizados para la generacion de estimulos
    type STIM_VEC is array (0 to (N_INST-1)) of std_logic_vector(N_BITS-1 downto 0);
    
    --declaracion de los estimulos
    signal test_clk_in_s   :  std_logic ;
    signal test_clockEnable_in_s :  std_logic ;
    signal test_clr_in_s     :  std_logic ;
    signal test_carry_in_s   :  std_logic ;
    signal test_zero_in_s    :  std_logic ;
    signal test_ir_in_s      :  std_logic_vector(N_BITS-1 downto 0);
    signal test_ram_out_s    :  std_logic;
    signal test_alu_s0_out_s :  std_logic;
    signal test_alu_s1_out_s :  std_logic;
    signal test_alu_s2_out_s :  std_logic;
    signal test_alu_s3_out_s :  std_logic;
    signal test_alu_s4_out_s :  std_logic;
    signal test_mux_a_out_s  :  std_logic;
    signal test_mux_b_out_s  :  std_logic;
    signal test_mux_c_out_s  :  std_logic;
    signal test_ir_clockEnable_out_s :  std_logic;
    signal test_pc_clockEnable_out_s :  std_logic;
    signal test_da_clockEnable_out_s :  std_logic;

    signal test_stim_vec_s : STIM_VEC := (
		x"00",
		x"40",
		x"10",
		x"60",
		x"a0",
		x"e0",
		x"80",
		x"90",
		x"94",
		x"98",
		x"9C"
	);
  
	signal test_ctr_vec_s : std_logic_vector(CANT_VAR-1 downto 0);


  --señal auxiliar para detener la simulacion
  signal stopSimulation_s : BOOLEAN ;

begin
  --Instanciación de la DUT:
  decoder_0 : decoder_toplevel
                 generic map (HALF_IR_LENGTH => N_BITS)
                 port map (clk_in  => test_clk_in_s  ,
                           clockEnable_in =>test_clockEnable_in_s,
                           clr_in  => test_clr_in_s  ,
                           carry_in=> test_carry_in_s,
                           zero_in => test_zero_in_s ,
                           ir_in   => test_ir_in_s   ,
                           ram_out => test_ram_out_s ,
                           alu_s0_out => test_alu_s0_out_s,
                           alu_s1_out => test_alu_s1_out_s,
                           alu_s2_out => test_alu_s2_out_s,
                           alu_s3_out => test_alu_s3_out_s,
                           alu_s4_out => test_alu_s4_out_s,
                           mux_a_out  => test_mux_a_out_s ,
                           mux_b_out  => test_mux_b_out_s ,
                           mux_c_out  => test_mux_c_out_s,
                           ir_clockEnable_out =>test_ir_clockEnable_out_s,
                           pc_clockEnable_out =>test_pc_clockEnable_out_s,
                           da_clockEnable_out =>test_da_clockEnable_out_s);

  --Proceso de generación de clock.
  clockGeneration : process
  begin
      test_clk_in_s <= '0';
      wait for PERIOD/2;
      test_clk_in_s <= '1';
      wait for PERIOD/2;
      if (stopSimulation_s = TRUE) then
          wait;
      end if;
  end process clockGeneration;

  --aplicacion de estimulos para verificar que todas las salidas
  --respondan como deberian.
  test_process : process

  begin
	test_clockEnable_in_s <= '0';
	test_clr_in_s <= '0';
	test_carry_in_s <= '0';
	test_zero_in_s <= '0';
	wait for 25 ns;
	instLoop : for j in 0 to N_INST-1 loop
		test_ir_in_s <= test_stim_vec_s(j);
		  testLoop : for i in 0 to (2**CANT_VAR)-1 loop
			test_ctr_vec_s <= std_logic_vector(to_unsigned(i,CANT_VAR));
			test_clockEnable_in_s <= test_ctr_vec_s(0);
			test_clr_in_s   <= test_ctr_vec_s(1);
			test_carry_in_s <= test_ctr_vec_s(2);
			test_zero_in_s  <= test_ctr_vec_s(3);
			wait for 1000 ns;
        end loop ; -- instLoop
    end loop ; -- testLoop
    stopSimulation_s <= TRUE;
    wait;
  end process;
end architecture;
