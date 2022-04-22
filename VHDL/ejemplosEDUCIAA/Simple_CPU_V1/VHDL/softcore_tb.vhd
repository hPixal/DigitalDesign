--- Entidad: softcore_toplevel_tb.
--- Descripción: Este testbench permite probar el Simple CPU V1
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 6/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.
--Entidad del testbench
entity softcore_tb is
end entity softcore_tb;
--Arquitectura
architecture softcore_tb_arch of  softcore_tb is
  --declaracion del componente
  component softcore is
    generic(
      cpu_data_word_length : integer := 8
    );
    port (
    clock_in : in std_logic  ;
    clr_in   : in std_logic  ;
    cpu_out  : out std_logic_vector(cpu_data_word_length-1 downto 0);
    chip_en  : in  std_logic ;
    serial_we: out std_logic
    );
  end component;

  --declaracion de constantes
  constant PERIOD    : time    := 84 ns;
  constant WORD_LENGTH : integer := 8;
  --declaracion de estimulos
  signal test_clock_s     :  std_logic  ;
  signal test_clr_in_s    :  std_logic  ;
  signal test_serial_out  :  std_logic_vector(WORD_LENGTH-1 downto 0)  ;
  signal test_chip_en_s   :  std_logic  ;
  signal test_serial_we   :  std_logic  ;
  --auxiliar para detener la simulacion
  signal stop_simulation_s : boolean ;

begin

  -- dut
  softcore_0 : softcore
             generic map (
             cpu_data_word_length => WORD_LENGTH
             )
             port map
             (
             clock_in => test_clock_s  ,
             clr_in  => test_clr_in_s  ,
             cpu_out => test_serial_out,
             chip_en => test_chip_en_s ,
             serial_we => test_serial_we
             );
  --generacion del clock
  clock_generation : process
  begin
       test_clock_s <= '1';
       wait for PERIOD/2;
       test_clock_s <= '0';
       wait for PERIOD/2;
      if (stop_simulation_s = TRUE) then
           wait;
       end if;
 end process clock_generation;

 --aplicacion de estimulos
 test_process : process
 begin
   test_clr_in_s <= '0' ;
   wait for PERIOD *2 ;
   test_clr_in_s <= '1' ;
   wait for 30 ms;
   stop_simulation_s <= TRUE;
   wait ;
 end process;

end architecture;
