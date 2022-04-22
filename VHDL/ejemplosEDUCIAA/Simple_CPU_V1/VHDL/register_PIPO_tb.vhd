--------------------------------------------------------------------------------
--- Entidad: register_PIPO.
--- Descripción: Este testbench permite probar un registro PIPO, en este caso
---              activo por flanco ascendente y con 2 bits de longitud
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 3/04/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

--entidad del testbench
entity register_PIPO_tb is
end entity register_PIPO_tb;

--Arquitectura del testbench

architecture register_PIPO_tb_arch of register_PIPO_tb is
    --decalaracion del registro a probar
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

    --declaracion de las constantes.
    constant PERIOD : time := 100 ns ;
    constant REG_LEN: integer := 2   ;

    --declaracion de los estimulos
     signal test_clk_in_s : std_logic ;
     signal test_clockEnable_in_s : std_logic ;
     signal test_rst_in_s : std_logic ;
     signal test_d_in_s   : std_logic_vector(REG_LEN-1 downto 0) ;
     signal test_d_out_s  : std_logic_vector(REG_LEN-1 downto 0) ;

     --señal auxiliar para detener la simulacion
     signal stopSimulation_s : BOOLEAN := FALSE ;
     
begin

    -- Instanciación e interconexion de la DUT
    dut : register_PIPO generic map (N_BITS => REG_LEN ,
                                     risingEdgeClock => TRUE)
                        port map (clk_in => test_clk_in_s,
                                  clockEnable_in => test_clockEnable_in_s,
                                  rst_in => test_rst_in_s,
                                  d_in   => test_d_in_s  ,
                                  d_out  => test_d_out_s
                                  );

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

    --Proceso de generación de la entrada
    appluStimulus : process
    begin
      testLoop : for i in 0 to (2**REG_LEN)-1 loop
        test_d_in_s <= std_logic_vector(to_unsigned(i,REG_LEN));
        wait for PERIOD ;
      end loop;
      if stopSimulation_s then
        wait;
      end if;
    end process;

    --process para la aplicacion de las entradas asincronicas
    asincProcess : process
    begin
      test_rst_in_s <= '1' ; -- verificar que las salidas sean 0 todas
      test_clockEnable_in_s <= '1';
      wait for PERIOD*2 ;  -- durante 2 periodos
      test_rst_in_s <= '0' ;
      enableLoop : for i in 0 to (2**REG_LEN)-1 loop
        wait for PERIOD *5 ; --cada 5 periodos detenemos el clock para verificar
        test_clockEnable_in_s <= '0'; --la permanencia de los valores
        wait for PERIOD *2 ; -- verificamos que se mantengan durante 2 periodos
        test_clockEnable_in_s <= '1'; -- volvemos a habilitar
      end loop;
      stopSimulation_s <= TRUE;
      wait ; --detenmos el process
    end process;


end architecture;
