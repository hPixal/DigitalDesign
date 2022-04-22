--------------------------------------------------------------------------------
--- Entidad: ffd_tb.
--- Descripción: Este testbench permite probar un Flip Flop D
--- Ultima revisión: 3/04/2021.
--- Autor: Matias Nicolas Costa.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------

-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

-- Entidad del testbench
entity ffd_tb is
end entity ffd_tb;

architecture ffd_tb_arch of ffd_tb is

  -- declaracion del flip flop a probar
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

  --declaracion de constantes
  constant PERIOD : time := 100 ns ;

  --declaracion de los estimulos a utilizar
  signal test_clk_in_s :  std_logic ;
  signal test_rst_in_s :  std_logic ;
  signal test_d_in_s   :  std_logic ;
  signal test_d_out_s  :  std_logic ;
  signal test_clk_ena_s:  std_logic ;
  --señal auxiliar para detener la simulacion
  signal stopSimulation_s : BOOLEAN := FALSE ;

begin
  -- Instanciación e interconexion de la DUT
  dut : ffd generic map (risingEdgeClock => TRUE)
            port    map (clk_in => test_clk_in_s,
                         rst_in => test_rst_in_s,
                         d_in   => test_d_in_s  ,
                         d_out  => test_d_out_s ,
                         clk_ena=> test_clk_ena_s);

  -- process para la generacion del clock
  clock_generation : process
  begin
      test_clk_in_s <= '1';
      wait for PERIOD/2;
      test_clk_in_s <= '0';
      wait for PERIOD/2;
      if (stopSimulation_s = TRUE) then
          wait;
      end if;
  end process clock_generation;

  -- aplicacion de los estimulos
  processPrueba : process
   begin
     test_d_in_s   <= '1' ;
     test_rst_in_s <= '1' ;
     test_clk_ena_s <= '1';
     wait for PERIOD/2 ;
     test_rst_in_s <= '0' ;
     wait for PERIOD/2 ;
     test_d_in_s   <= '0' ;
     wait for PERIOD/2 ;
     test_d_in_s   <= '1' ;
     wait for PERIOD ;
     test_clk_ena_s   <= '0' ;
     wait for PERIOD ;
     test_d_in_s   <= '0' ;
     wait for PERIOD   ;
     stopSimulation_s <= TRUE ;
     wait;
   end process;
end architecture;
