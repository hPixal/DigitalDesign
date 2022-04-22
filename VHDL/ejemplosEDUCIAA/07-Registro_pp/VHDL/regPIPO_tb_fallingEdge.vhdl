--------------------------------------------------------------------------------
--- Entidad: regPIPO_tb_fallingEdge.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un registro PIPO de 4 bits que se activa por
--               flanco descendente de clock y posee una línea sincrónica de
--               habilitación de clock y otras dos asincrónicas: una de
--               habilitación de salida y otra de reset.
--- Propósito: Este testbench prueba de forma exhaustiva al registro. Se aplica
--             la misma secuencia de 16 estímulos 4 veces, presentando las
--             siguientes particularidades: la primera es con el reset
--             desactivado y el clock y la salida habilitados; la segunda es con
--             el reset activado y el clock y la salida habilitados (para probar
--             el reset); la tercera es con el reset desactivado, el clock
--             habilitado y la salida deshabilitada (para probar esta
--             habilitación); y la cuarta es con el reset desactivado, la salida
--             habilitada y el clock deshabilitado (para probar esta
--             habilitación);
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquetes std_logic_1164.all y ieee.numeric_std.all de la
--                biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;    --Paquete para unsigned y signed.

--Entidad del testbench.
entity regPIPO_tb_fallingEdge is
end entity regPIPO_tb_fallingEdge;

--Arquitectura del testbench.
architecture regPIPO_tb_fallingEdge_arch of regPIPO_tb_fallingEdge is
    --Declaración del registro a probar.
    component regPIPO is
        generic (
            nBits           : integer := 8;
            risingEdgeClock : BOOLEAN := TRUE
        );
        port (
            d_in           : in  std_logic_vector(nBits-1 downto 0);
            reset_in       : in  std_logic;
            outEnable_in   : in  std_logic;
            clock_in       : in  std_logic;
            clockEnable_in : in  std_logic;
            q_out          : out std_logic_vector(nBits-1 downto 0)
        );
    end component;

    --Declaración de constantes.
    constant TESTED_NBITS : integer := 4;
    constant PERIOD       : time    := 100 ns;

    --Declaración de estímulos y señal de monitoreo.
    --Entradas al registro.
    signal test_d_reg_s       : std_logic_vector(TESTED_NBITS-1 downto 0);
    signal test_reset_s       : std_logic;
    signal test_outEnable_s   : std_logic;
    signal test_clock_s       : std_logic;
    signal test_clockEnable_s : std_logic;

    --Salidas al registro.
    signal test_q_reg_s	: std_logic_vector(TESTED_NBITS-1 downto 0);

    --Señal auxiliar para detener la simulación (por defecto es FALSE).
    signal stopSimulation_s : BOOLEAN := FALSE;

    --Procedimiento para cargar en la entrada del registro los estímulos.
    procedure LoadRegisterData_proc(
        signal   test_d_reg_proc_s : out std_logic_vector;
        constant NBITS_PROC        : in  integer;
        constant PERIOD_PROC       : in  time
    ) is
    begin
        applyInputData: for i in 0 to ((2**NBITS_PROC) - 1) loop
            test_d_reg_proc_s <= std_logic_vector(to_unsigned(i, NBITS_PROC));
            wait for PERIOD_PROC;
        end loop applyInputData;
    end procedure LoadRegisterData_proc;

begin
    --Instanciación del DUT (Device Under Test).
    regPIPO_0 : regPIPO
        generic map (nBits => TESTED_NBITS, risingEdgeClock => FALSE)
        port map ( d_in           => test_d_reg_s,
                   reset_in       => test_reset_s,
                   outEnable_in   => test_outEnable_s,
                   clock_in       => test_clock_s,
                   clockEnable_in => test_clockEnable_s,
                   q_out          => test_q_reg_s );

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
        --Estado inicial: dato de entrada todo en 0 y salida y clock
        --habilitados.
        test_d_reg_s       <= (others => '0');
        test_outEnable_s   <= '1';
        test_clockEnable_s <= '1';
        stopSimulation_s   <= FALSE;

        --Reset inicial.
        test_reset_s <= '1';
        wait for 2*PERIOD; --El reset dura dos periodos de clock.
        test_reset_s <= '0';

        --Se agrega un desfasaje temporal inicial.
        wait for PERIOD/2;

        --Se aplican los estímulos en la entrada de datos del registro. Luego
        --se espera un período para poder apreciar facilmente en la simulación
        --el último dato de salida.
        LoadRegisterData_proc(test_d_reg_s, TESTED_NBITS, PERIOD);
        wait for PERIOD;

        --Se hace un reset para poner la salida en cero y luego se reaplican los
        --estímulos en la entrada de datos. Aquí se prueba el funcionamiento,
        --asincronía y mayor jerarquía de la entrada de reset.
        test_reset_s <= '1';
        LoadRegisterData_proc(test_d_reg_s, TESTED_NBITS, PERIOD);
        test_reset_s <= '0';

        --Se deshabilita la salida del registro y luego se reaplican los
        --estímulos en la entrada de datos. Aquí se prueba el funcionamiento, la
        --asincronía y más alta jerarquía de la entrada de habilitación de la
        --salida.
        test_outEnable_s <= '0';
        LoadRegisterData_proc(test_d_reg_s, TESTED_NBITS, PERIOD);
        test_outEnable_s <= '1';

        --Se deshabilita el clock del registro y luego se reaplican los
        --estímulos en la entrada de datos. Aquí se prueba el funcionamiento de
        --dicha entrada de control.
        test_clockEnable_s <= '0';
        LoadRegisterData_proc(test_d_reg_s, TESTED_NBITS, PERIOD);

        --Se detiene la simulación.
        stopSimulation_s <= TRUE;
        wait;
    end process applyStimulus;
end architecture regPIPO_tb_fallingEdge_arch;
