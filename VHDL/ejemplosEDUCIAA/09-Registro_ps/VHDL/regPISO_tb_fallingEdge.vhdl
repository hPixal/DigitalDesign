--------------------------------------------------------------------------------
--- Entidad: regPISO_tb_fallingEdge.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un registro PISO de 4 bits que se activa por
--               flanco descendente de clock, tiene una entrada sincrónica de
--               habilitación de clock y otra de habilitación de carga paralela
--               de datos, y posee una línea asincrónica de habilitación de
--               salida y otra de reset.
--- Propósito: Este testbench prueba de forma exhaustiva al registro. Se aplica
--             el mismo estímulo de 4 bits cuatro veces, presentando las
--             siguientes particularidades: la primera es con el reset
--             desactivado y la salida y clock habilitados, la segunda prueba la
--             habilitación del clock, la tercera el reset y la cuarta la
--             habilitación de la salida.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Entidad del testbench.
entity regPISO_tb_fallingEdge is
end entity regPISO_tb_fallingEdge;

--Arquitectura del testbench.
architecture regPISO_tb_fallingEdge_arch of regPISO_tb_fallingEdge is
    --Declaración del registro a probar.
    component regPISO is
        generic (
            nBits           : integer := 8;
            risingEdgeClock : BOOLEAN := TRUE
        );
        port (
            d_in           : in  std_logic_vector(nBits-1 downto 0);
            load_in        : in  std_logic;
            reset_in       : in  std_logic;
            outEnable_in   : in  std_logic;
            clock_in       : in  std_logic;
            clockEnable_in : in  std_logic;
            q_out          : out std_logic
        );
    end component;

    --Declaración de constantes.
    constant TESTED_NBITS : integer := 4;
    constant PERIOD       : time    := 100 ns;

    --Declaración de estímulos y señal de monitoreo.
    --Entradas al registro.
    signal test_d_reg_s       : std_logic_vector(TESTED_NBITS-1 downto 0);
    signal test_load_s        : std_logic;
    signal test_reset_s       : std_logic;
    signal test_outEnable_s   : std_logic;
    signal test_clock_s       : std_logic;
    signal test_clockEnable_s : std_logic;

    --Salidas al registro.
    signal test_q_reg_s	: std_logic;

    --Señal auxiliar para detener la simulación (por defecto es FALSE).
    signal stopSimulation_s : BOOLEAN := FALSE;

    --Declaración de una constante como estímulo de entrada.
    constant IN_REGISTER : std_logic_vector := "1010";

    --Procedimiento para cargar en la entrada del registro un dato en forma
    --paralela y luego dejar pasar SHIFTS_QUANTITY_PROC períodos para expulsar
    --bit a bit dicho dato en forma serial por su salida.
    procedure LoadAndShiftRegister_proc(
        signal   test_load_proc_s     : out std_logic;
        signal   test_d_reg_proc_s    : out std_logic_vector;
        constant IN_REGISTER_PROC     : in  std_logic_vector;
        constant SHIFTS_QUANTITY_PROC : in  integer;
        constant PERIOD_PROC          : in  time
    ) is
    begin
        test_load_proc_s  <= '1';
        test_d_reg_proc_s <= IN_REGISTER_PROC;
        wait for PERIOD_PROC; --Para cargar efectivamente los datos paralelamente.
        test_load_proc_s  <= '0';
        wait for (SHIFTS_QUANTITY_PROC * PERIOD_PROC);
    end procedure LoadAndShiftRegister_proc;

begin
    --Instanciación del DUT (Device Under Test).
    regPISO_0 : regPISO
        generic map (nBits => TESTED_NBITS, risingEdgeClock => FALSE)
        port map ( d_in           => test_d_reg_s,
                   load_in        => test_load_s,
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
        --Estado inicial: dato de entrada todo en 0, carga paralela
        --deshabilitada y clock y salida habilitados.
        test_d_reg_s       <= (others=> '0');
        test_outEnable_s   <= '1';
        test_clockEnable_s <= '1';
        test_load_s        <= '0';
        stopSimulation_s   <= FALSE;

        --Reset inicial.
        test_reset_s <= '1';
        wait for (2.5*PERIOD);	--El reset dura dos períodos y medio de clock.
        test_reset_s <= '0';

        --Se aplica el estímulo en la entrada de datos del registro. Luego se
        --esperan TESTED_NBITS períodos para expulsar el dato en forma serial.
        LoadAndShiftRegister_proc(test_load_s, test_d_reg_s, IN_REGISTER,
                                  TESTED_NBITS, PERIOD);

        --Se reaplica el estímulo para probar la deshabilitación del clock.
        --Luego de esto se rehabilita el clock.
        test_clockEnable_s <= '0';
        LoadAndShiftRegister_proc(test_load_s, test_d_reg_s, IN_REGISTER,
                                  TESTED_NBITS, PERIOD);
        test_clockEnable_s <= '1';

        --Se hace un reset para poner la salida y el dato serie interno en cero
        --y luego se reaplica el estímulo en la entrada de datos. Aquí se prueba
        --la asincronía y mayor jerarquía de la entrada de reset. Luego de esto,
        --se desactiva el reset.
        test_reset_s <= '1';
        LoadAndShiftRegister_proc(test_load_s, test_d_reg_s, IN_REGISTER,
                                  TESTED_NBITS, PERIOD);
        test_reset_s <= '0';

        --Se deshabilita la salida del registro y luego se reaplica el estímulo
        --en la entrada de datos. Aquí se prueba la asincronía y más alta
        --jerarquía de la entrada de habilitación de la salida.
        test_outEnable_s <= '0';
        LoadAndShiftRegister_proc(test_load_s, test_d_reg_s, IN_REGISTER,
                                  TESTED_NBITS, PERIOD);

        --Se detiene la simulación.
        stopSimulation_s <= TRUE;
        wait;
    end process applyStimulus;
end architecture regPISO_tb_fallingEdge_arch;
