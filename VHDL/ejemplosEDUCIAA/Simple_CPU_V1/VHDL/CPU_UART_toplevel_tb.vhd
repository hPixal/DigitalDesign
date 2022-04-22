--- Entidad: CPU_UART_toplevel_tb.
--- Descripción: Este testbench permite probar el Simple CPU V1
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 15/05/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.


--Entidad del testbench
entity CPU_UART_toplevel_tb is
end entity CPU_UART_toplevel_tb;


--Arquitectura
architecture CPU_UART_toplevel_tb_arch of  CPU_UART_toplevel_tb is

  --declaracion del componente
  component CPU_UART_toplevel is
    generic (
       brDivisor : positive := 26 --Divisor para elegir baudrate 26 ~= 12MHz/(4*115200)
    );
    port (
        clock_in   : in  std_logic ;
        clr_in     : in  std_logic ;
        serial_out : out std_logic
    );
  end component;

  --declaracion de constantes
  constant PERIOD    : time    := 84 ns;
  --declaracion de estimulos
  signal test_clock_s     :  std_logic  ;
  signal test_clr_in_s    :  std_logic  ;
  signal test_serial_out  :  std_logic  ;
  signal test_chip_en_s   :  std_logic  ;
  --auxiliar para detener la simulacion
  signal stop_simulation_s : boolean ;

  begin

  -- dut
  softcore_final : CPU_UART_toplevel
   port map
   (
   clock_in   => test_clock_s  ,
   clr_in     => test_clr_in_s  ,
   serial_out => test_serial_out
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
