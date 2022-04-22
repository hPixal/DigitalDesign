--------------------------------------------------------------------------------
--- Entidad: univCounter_tb_falEdge3b7Mod.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un contador binario universal de 3 bits y
--               módulo 7 que se activa por flanco descendente de clock,
--               tiene entradas sincrónicas de habilitación de conteo,
--               habilitación y datos para carga paralela, configuración de
--               sentido de cuenta y posee una línea asincrónica de habilitación
--               de salida y otra de reset. El contador cuenta los pulsos en su
--               entrada de clock, la cual se pone en 10 MHz para esta prueba.
--- Propósito: Este testbench prueba de forma bastante completa al contador,
--             considerando situaciones de importancia que permiten verificar
--             su correcto funcionamiento. Estas situaciones son: conteo
--             ascendente y descendente, secuencia de cuenta completa, reseteo,
--             verificación del correcto funcionamiento de la salida
--             "terminalCount_out", carga paralela y conteo a partir de allí,
--             pausa de la cuenta que también afecta al estado de
--             "terminalCount_out", autocorrección de la cuenta, habilitación de
--             la salida y jerarquía de las entradas.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquetes std_logic_1164.all y ieee.numeric_std.all de la
--                biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;     --Paquete para unsigned y signed.

--Entidad del testbench.
entity univCounter_tb_falEdge3b7Mod is
end entity univCounter_tb_falEdge3b7Mod;

--Arquitectura del testbench.
architecture univCounter_tb_falEdge3b7Mod_arch of univCounter_tb_falEdge3b7Mod is
    --Declaración del contador a probar.
    component univCounter is
        generic (
            nBits           : integer := 8;
            modulus         : integer := 256;
            risingEdgeClock : BOOLEAN := TRUE
        );
        port (
            d_in              : in  std_logic_vector(nBits-1 downto 0);
            clock_in          : in  std_logic;
            outEnable_in      : in  std_logic;
            reset_in          : in  std_logic;
            counterEnable_in  : in  std_logic;
            load_in           : in  std_logic;
            countUp_in        : in  std_logic;
            q_out             : out std_logic_vector(nBits-1 downto 0);
            terminalCount_out : out std_logic
        );
    end component;

    --Declaración de constantes.
    constant TESTED_NBITS   : integer := 3;
    constant TESTED_MODULUS : integer := 7;
    constant PERIOD         : time    := 100 ns;

    --Declaración de estímulos y señales de monitoreo.
    --Entradas al contador.
    signal test_d_cnt_s         : std_logic_vector(TESTED_NBITS-1 downto 0);
    signal test_clock_s         : std_logic;
    signal test_outEnable_s     : std_logic;
    signal test_reset_s         : std_logic;
    signal test_counterEnable_s	: std_logic;
    signal test_load_s          : std_logic;
    signal test_countUp_s      	: std_logic;

    --Salidas al contador.
    signal test_q_cnt_s         : std_logic_vector(TESTED_NBITS-1 downto 0);
    signal test_terminalCount_s : std_logic;

    --Señal auxiliar para detener la simulación (por defecto es FALSE).
    signal stopSimulation_s : BOOLEAN := FALSE;

    --Declaración de constantes como estímulos de entrada para precargar el
    --contador en cinco o en TESTED_MODULUS.
    constant DATA_IN_COUNTER : std_logic_vector := "101";
    constant FORBIDDEN_COUNT : std_logic_vector :=
        std_logic_vector(to_unsigned(TESTED_MODULUS, TESTED_NBITS));

begin
    --Instanciación del DUT (Device Under Test).
    univCounter_0 : univCounter
        generic map ( nBits           => TESTED_NBITS,
                      modulus         => TESTED_MODULUS,
                      risingEdgeClock => FALSE)
        port map ( d_in              => test_d_cnt_s,
                   clock_in          => test_clock_s,
                   outEnable_in      => test_outEnable_s,
                   reset_in          => test_reset_s,
                   counterEnable_in  => test_counterEnable_s,
                   load_in           => test_load_s,
                   countUp_in        => test_countUp_s,
                   q_out             => test_q_cnt_s,
                   terminalCount_out => test_terminalCount_s);

    --Proceso de generación de clock.
    clockGeneration : process
    begin
        test_clock_s <= '0';
        wait for PERIOD/2;
        test_clock_s <= '1';
        wait for PERIOD/2;
        if (stopSimulation_s = TRUE) then
            wait;
        end if;
    end process clockGeneration;

    --Proceso de aplicación de estímulos.
    applyStimulus : process
    begin
        --Estado inicial: dato de entrada en 5 ("101"), carga paralela
        --deshabilitada, conteo ascendente y contador y salida habilitados.
        test_load_s          <= '0';
        test_d_cnt_s         <= DATA_IN_COUNTER;
        test_countUp_s       <= '1';
        test_outEnable_s     <= '1';
        test_counterEnable_s <= '1';
        stopSimulation_s     <= FALSE;

        --Reset inicial que dura dos periodos y medio de clock. Se agrega el
        --medio período como desfasaje temporal inicial.
        test_reset_s <= '1';
        wait for (2.5)*PERIOD;
        test_reset_s <= '0';

        --Se cuenta ascendentemente un ciclo completo hasta reiniciarse en 0. Se
        --verifica que "test_terminalCount_s" se pone en alto.
        wait for PERIOD*(TESTED_MODULUS + 1);

        --Se carga el contador con el valor DATA_IN_COUNTER y luego se cuenta
        --regresivamente hasta que de 0 pasa al (módulo - 1). Cuanto está en 0
        --se deshabilita el contador por un período. Así se verifica que la
        --"test_terminalCount_s" se pone en alto y solo cuando el contador
        --está habilitado. Se verifica también la pausa de la cuenta.
        test_load_s    <= '1';
        test_countUp_s <= '0';
        wait for PERIOD;
        test_load_s    <= '0';

        wait for PERIOD * to_integer(unsigned(DATA_IN_COUNTER));

        test_counterEnable_s <= '0';
        wait for PERIOD;
        test_counterEnable_s <= '1';
        wait for PERIOD;

        --Se pretende cargar el contador cuando este está deshabilitado, lo cual
        --no se permite.
        test_counterEnable_s <= '0';
        test_load_s          <= '1';
        wait for PERIOD;
        test_load_s          <= '0';
        test_counterEnable_s <= '1';

        --Se continua contando algunos pulsos más en forma decreciente para ver
        --que cuente correctamente.
        wait for PERIOD*4;

        --Se hace un reset para poner la salida y la cuenta interna en cero.
        --Además, se habilita la carga paralela y se deshabilita el contador.
        --Esto permite verificar la asincrónía y mayor jerarquía de la entrada
        --de reset. Se deja pasar un período y luego se desactiva el reset, la
        --carga paralela y también se vuelve a habilitar el contador en conteo
        --descendente.
        test_reset_s         <= '1';
        test_load_s          <= '1';
        test_counterEnable_s <= '0';
        wait for PERIOD;
        test_reset_s         <= '0';
        test_load_s          <= '0';
        test_counterEnable_s <= '1';

        --Se cambia el conteo a ascendente y se cuentan algunos pulsos para ver
        --que funcione correctamente.
        test_countUp_s <= '1';
        wait for PERIOD*4;

        --Se pone en cuenta decreciente, se carga el valor "modulus" y se
        --verifica que se autocorrige a "modulus-1".
        test_countUp_s <= '0';
        test_d_cnt_s   <= FORBIDDEN_COUNT;
        test_load_s    <= '1';
        wait for PERIOD;
        test_load_s    <= '0';
        wait for 2*PERIOD;

        --Se pone en cuenta ascendente, se carga el valor "modulus" y se
        --verifica que se autocorrige a 0.
        test_countUp_s <= '1';
        test_load_s    <= '1';
        wait for PERIOD;
        test_load_s    <= '0';
        wait for 2*PERIOD;

        --Se deshabilita la salida del contador y se dejan pasar algunos pulsos
        --de clock. Aquí se prueba la asincronía y más alta jerarquía de la
        --entrada de habilitación de la salida, y que el contador sigue
        --trabajando internamente.
        test_outEnable_s <= '0';
        wait for PERIOD*(TESTED_MODULUS + 1);

        --Se detiene la simulación.
        stopSimulation_s <= TRUE;
        wait;
    end process applyStimulus;
end architecture univCounter_tb_falEdge3b7Mod_arch;
