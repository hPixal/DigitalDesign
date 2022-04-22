--------------------------------------------------------------------------------
--- Entidad: sequence_generator_tb.
--- Descripción: Este testbench permite probar el generador de secuencia que
---              va dentro del decoder del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 3/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

--entidad del testbench
entity sequence_generator_tb is
end sequence_generator_tb;

--Arquitectura del testbench

architecture sequence_generator_tb_arch of sequence_generator_tb is
  --Declaración del sequence generator a probar
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
  --Declaración de las constantes.
  constant PERIOD    : time    := 100 ns;

  --Declaracion de los estimulos a aplicar

  --entradas del sequence generator
  signal test_clk_in         :   std_logic ;
  signal test_clockEnable_in :   std_logic ;
  signal test_rst_in         :   std_logic ;
  --salidas del sequence generator
  signal test_fetch          :   std_logic ;
  signal test_decode         :   std_logic ;
  signal test_execute        :   std_logic ;
  signal test_increment      :   std_logic ;

  --señal para detener la simulacion
  signal stop_simulation_s : boolean := FALSE ;

begin
  -- Instanciación e interconexion de la DUT
  dut : sequence_generator port map (clk_in => test_clk_in,
                                     clockEnable_in => test_clockEnable_in,
                                     rst_in    => test_rst_in,
                                     fetch     => test_fetch ,
                                     decode    => test_decode,
                                     execute   => test_execute,
                                     increment => test_increment
                                     );
   -- process para la generacion del clock para la aplicacion de estimulos
   clock_generation : process
   begin
       test_clk_in <= '1';
       wait for PERIOD/2;
       test_clk_in <= '0';
       wait for PERIOD/2;
       if (stop_simulation_s = TRUE) then
           wait;
       end if;
   end process clock_generation;

   -- aplicacion de los estimulos
   applyStimulus : process
   begin
     --se activa el clock y se resetea el generador
     test_clockEnable_in <= '1' ;
     test_rst_in<= '1' ;
     wait for PERIOD*3;
     --se suelta el reset para dar inicio a la generacion de secuencia
     test_rst_in<= '0' ;
     --se testean que todas las salidas se pongan en 1 segun el clock
     wait for PERIOD*4;

     -- se tooglea el clock enable para ver que se quede en cada estado segun deberia
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en fetch
     test_clockEnable_in <= '1' ;
     wait for PERIOD;  -- cambia a decode
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en decode
     test_clockEnable_in <= '1' ;
     wait for PERIOD; -- cambia a execute
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en execute
     test_clockEnable_in <= '1' ;
     wait for PERIOD; -- cambia a increment
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en increment
     test_clockEnable_in <= '1' ;
     wait for PERIOD; -- cambia a fetch
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en fetch
     test_clockEnable_in <= '1' ;
     wait for PERIOD;  -- cambia a decode
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en decode

     --reseteamos desde el decode para verificar que vuelva bien a fetch
     test_rst_in<= '1' ;
     wait for PERIOD ;
     test_clockEnable_in <= '0' ;
     wait for PERIOD*2; -- se queda en fetch

     -- se detiene la simulacion
     stop_simulation_s <= TRUE ;

     wait;
   end process;

end architecture;
