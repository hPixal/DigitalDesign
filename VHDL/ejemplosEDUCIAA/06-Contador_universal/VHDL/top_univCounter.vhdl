--------------------------------------------------------------------------------
--- Entidad: top_univCounter.
--- Descripción: Esta entidad es la implementación de un contador universal de 3
--               bits hecha especialmente para la EDU-CIAA-FPGA. El contador se
--               compone de un contador universal "univCounter" interno de 3
--               bits y módulo 8, otro "univCounter" utilizado como prescaler
--               para reducir los 12 MHz de la placa a 1 Hz y un decodificador
--               BCD a 7 segmentos para visualizar la cuenta en un display de 7
--               segmentos. Para que el contador pueda dividir la frecuencia
--               necesita un módulo de 12 000 000, por lo que se lo instancia
--               con 24 bits.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 11/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity top_univCounter is
    generic(
        nBits           : integer := 3;
        modulus         : integer := 8;
        risingEdgeClock : BOOLEAN := TRUE);
    port(
        d_in                : in  std_logic_vector(nBits-1 downto 0);
        clock_in            : in  std_logic;
        outEnable_in        : in  std_logic;
        reset_in            : in  std_logic;
        counterEnable_in    : in  std_logic;
        load_in             : in  std_logic;
        countUp_in          : in  std_logic;
        seg7_out            : out std_logic_vector(6 downto 0);
        terminalCount_out   : out std_logic;
        enableReference_out : out std_logic);
end entity top_univCounter;

--Declaración de la arquitectura.
architecture top_univCounter_arch of top_univCounter is
    --Declaración del contador interno que se usa como prescaler y contador.
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

    --Declaración del decodificador BCD a 7 segmentos interno.
    component BCDTo7seg is
        generic (
            commonAnode : BOOLEAN := TRUE
        );
        port (
            BCD_in   : in  std_logic_vector(3 downto 0);
            ena_in   : in  std_logic;
            seg7_out : out std_logic_vector(6 downto 0)
        );
    end component;

    --Declaración de constantes para guardar el valor de los generics nBits,
    --modulus y risingEdgeClock del top-level.
    constant TOP_NBITS             : integer := nBits;
    constant TOP_MODULUS           : integer := modulus;
    constant TOP_RISING_EDGE_CLOCK : BOOLEAN := risingEdgeClock;

    --Declaración de constantes para el prescaler interno.
    constant PRESCALER_NBITS   : integer := 24;
    constant PRESCALER_MODULUS : integer := 12000000;

    --Declaración de constante para el decodificador interno.
    constant DECODER_COMMON_ANODE : BOOLEAN := FALSE;

    --Declaración de señales internas para conexiones del prescaler interno.
    signal prescalerInputData_s     : std_logic_vector(PRESCALER_NBITS-1 downto 0)
                                      := (others => '0');
    signal prescalerLoad_ena        : std_logic := '0';
    signal prescalerUpCount_ena     : std_logic := '1';
    signal prescaler_clk            : std_logic;
    signal prescalerClock_ena       : std_logic;
    signal prescalerOut_ena         : std_logic;
    signal prescaler_rst            : std_logic;
    signal prescalerTerminalCount_s : std_logic;

    --Declaración de señales internas para conexiones del contador interno.
    signal counterInputData_s     : std_logic_vector(TOP_NBITS-1 downto 0)
                                    := (others => '0');
    signal counterLoad_ena        : std_logic;
    signal counterUpCount_ena     : std_logic;
    signal counterTerminalCount_s : std_logic;
    signal counterOutputData_s    : std_logic_vector(TOP_NBITS-1 downto 0);

    --Declaración de señales internas para conexiones del decodificador interno.
    signal decoderInputData	 : std_logic_vector(3 downto 0);
    signal decoderOutputData : std_logic_vector(6 downto 0);

    --Declaración de señal de 1 bit que cambia cada vez que el contador interno
    --está habilitado y recibe un flanco de clock que activa su funcionamiento.
    signal counterEnableReference_s : std_logic := '0';

begin
    --Instanciación del contador interno que se usa como prescaler.
    univCounter_0 : univCounter
        generic map ( nBits           => PRESCALER_NBITS,
                      modulus         => PRESCALER_MODULUS,
                      risingEdgeClock => TOP_RISING_EDGE_CLOCK)
        port map ( d_in              => prescalerInputData_s,
                   clock_in          => prescaler_clk,
                   outEnable_in      => prescalerOut_ena,
                   reset_in          => prescaler_rst,
                   counterEnable_in  => prescalerClock_ena,
                   load_in           => prescalerLoad_ena,
                   countUp_in        => prescalerUpCount_ena,
                   q_out             => open,
                   terminalCount_out => prescalerTerminalCount_s);

    --Instanciación del contador interno que se usa como contador.
    univCounter_1 : univCounter
        generic map ( nBits           => TOP_NBITS,
                      modulus         => TOP_MODULUS,
                      risingEdgeClock => TOP_RISING_EDGE_CLOCK)
        port map ( d_in              => counterInputData_s,
                   clock_in          => prescaler_clk,
                   outEnable_in      => prescalerOut_ena,
                   reset_in          => prescaler_rst,
                   counterEnable_in  => prescalerTerminalCount_s,
                   load_in           => counterLoad_ena,
                   countUp_in        => counterUpCount_ena,
                   q_out             => counterOutputData_s,
                   terminalCount_out => counterTerminalCount_s);

    --Instanciación del decodificador BCD a 7 segmentos interno. Se conecta
    --ena_in con prescalerOut_ena para poder ver el dígito en el display si el
    --contador se deshabilita pero se mantiene su salida habilitada.
    BCDTo7seg_0 : BCDTo7seg
        generic map (commonAnode => DECODER_COMMON_ANODE)
        port map ( BCD_in   => decoderInputData,
                   ena_in   => prescalerOut_ena,
                   seg7_out => decoderOutputData);

    --Se hacen conexiones internas del contador interior.
    counterInputData_s  <= not d_in;
    counterLoad_ena     <= not load_in;
    counterUpCount_ena  <= countUp_in;
    enableReference_out <= counterEnableReference_s;
    terminalCount_out   <= counterTerminalCount_s;

    --Se hacen conexiones internas del prescaler.
    prescaler_clk      <= clock_in;
    prescaler_rst      <= not reset_in;
    prescalerOut_ena   <= outEnable_in;
    prescalerClock_ena <= counterEnable_in;

    --Se hacen conexiones internas del decodificador.
    decoderInputData <= '0' & counterOutputData_s;
    seg7_out         <= decoderOutputData;

    --Generación de Flip Flop T según el flanco de activación configurado. Tanto
    --el proceso getEnableReferenceRisingEdge como getEnableReferenceFallingEdge
    --permiten cambiar el estado de la señal counterEnableReference_s cuando
    --el contador interno está habilitado y recibe un flanco de clock que
    --activa su funcionamiento. La señal se comporta como la salida de un
    --Flip Flop T.
    risingEdgeFlipFlopT : if (risingEdgeClock = TRUE) generate
        getEnableReferenceRisingEdge : process (clock_in)
        begin
            if( (rising_edge(clock_in)) and
                (prescalerTerminalCount_s = '1')) then
                counterEnableReference_s <= not counterEnableReference_s;
            end if;
        end process getEnableReferenceRisingEdge;
    end generate risingEdgeFlipFlopT;

    fallingEdgeFlipFlopT : if (risingEdgeClock = FALSE) generate
        getEnableReferenceFallingEdge : process (clock_in)
        begin
            if( (falling_edge(clock_in)) and
                (prescalerTerminalCount_s = '1')) then
                counterEnableReference_s <= not counterEnableReference_s;
            end if;
        end process getEnableReferenceFallingEdge;
    end generate fallingEdgeFlipFlopT;
end architecture top_univCounter_arch;
