--------------------------------------------------------------------------------
--- Entidad: top_regPIPO.
--- Descripción: Esta entidad es la implementación de un registro PIPO de 4 bits
--               hecha especialmente para la EDU-CIAA-FPGA. El registro se
--               compone de un registro PIPO interno de entidad "regPIPO" de 4
--               bits más un contador universal "univCounter" utilizado como
--               prescaler para reducir los 12 MHz de la placa a 1 Hz. Para
--               que el contador pueda dividir la frecuencia necesita un
--               módulo de 12 000 000, por lo que se lo instancia con 24 bits.
--
--               Se aclara que las entradas d_in y reset_in son negadas
--               internamente para contrarrestar el efecto de los resistores
--               pull-up conectados a los pulsadores de la placa y los
--               pulsadores externos. Además, se incorpora la salida
--               enableReference_out, la cual cambia cada vez que el registro
--               PIPO interno está habilitado y recibe un flanco de clock que
--               activa su funcionamiento.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 16/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity top_regPIPO is
    generic(
            nBits           : integer := 4;
            risingEdgeClock : BOOLEAN := TRUE);
    port(
        d_in                : in  std_logic_vector(nBits-1 downto 0);
        reset_in            : in  std_logic;
        outEnable_in        : in  std_logic;
        clock_in            : in  std_logic;
        clockEnable_in      : in  std_logic;
        q_out               : out std_logic_vector(nBits-1 downto 0);
        enableReference_out : out std_logic);
end entity top_regPIPO;

--Declaración de la arquitectura.
architecture top_regPIPO_arch of top_regPIPO is
    --Declaración del registro PIPO interno.
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

    --Declaración del contador interno que se usa como prescaler.
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

    --Declaración de constantes para guardar el valor de los generics nBits y
    --risingEdgeClock del top-level.
    constant TOP_NBITS             : integer := nBits;
    constant TOP_RISING_EDGE_CLOCK : BOOLEAN := risingEdgeClock;

    --Declaración de constantes para el contador interno.
    constant COUNTER_NBITS   : integer := 24;
    constant COUNTER_MODULUS : integer := 12000000;

    --Declaración de señales internas para conexiones del registro PIPO interno.
    signal register_rst         : std_logic;
    signal register_clk         : std_logic;
    signal registerInputData_s  : std_logic_vector(nBits-1 downto 0);
    signal registerOutputData_s : std_logic_vector(nBits-1 downto 0);
    signal registerOut_ena      : std_logic;

    --Declaración de señales internas para conexiones del contador interno.
    signal counterInputData_s     : std_logic_vector(COUNTER_NBITS-1 downto 0)
                                    := (others => '0');
    signal counterLoad_ena        : std_logic := '0';
    signal counterUpCount_ena     : std_logic := '1';
    signal counterClock_ena       : std_logic;
    signal counterTerminalCount_s : std_logic;

    --Declaración de señal de 1 bit que cambia cada vez que el registro PIPO
    --interno está habilitado y recibe un flanco de clock que activa su
    --funcionamiento.
    signal registerEnableReference_s : std_logic := '0';

begin
    --Instanciación del registro PIPO interno.
    regPIPO_0 : regPIPO
        generic map ( nBits           => TOP_NBITS,
                      risingEdgeClock => TOP_RISING_EDGE_CLOCK)
        port map ( d_in           => registerInputData_s,
                   reset_in       => register_rst,
                   outEnable_in   => registerOut_ena,
                   clock_in       => register_clk,
                   clockEnable_in => counterTerminalCount_s,
                   q_out          => registerOutputData_s);

    --Instanciación del contador interno que se usa como prescaler. La entrada
    --d_in se conecta a 0 por medio de la señal counterInputData_s ya que no
    --la usa. La salida q_out se deja abierta porque no se la utilza tampoco.
    univCounter_0 : univCounter
        generic map ( nBits           => COUNTER_NBITS,
                      modulus         => COUNTER_MODULUS,
                      risingEdgeClock => TOP_RISING_EDGE_CLOCK)
        port map ( d_in              => counterInputData_s,
                   clock_in          => register_clk,
                   outEnable_in      => registerOut_ena,
                   reset_in          => register_rst,
                   counterEnable_in  => counterClock_ena,
                   load_in           => counterLoad_ena,
                   countUp_in        => counterUpCount_ena,
                   q_out             => open,
                   terminalCount_out => counterTerminalCount_s);

    --Se hacen las conexiones internas.
    registerInputData_s <= not d_in;
    register_clk        <= clock_in;
    register_rst        <= not reset_in;
    registerOut_ena     <= outEnable_in;
    counterClock_ena    <= clockEnable_in;
    q_out               <= registerOutputData_s;
    enableReference_out <= registerEnableReference_s;

    --Generación de Flip Flop T según el flanco de activación configurado. Tanto
    --el proceso getEnableReferenceRisingEdge como getEnableReferenceFallingEdge
    --permiten cambiar el estado de la señal registerEnableReference_s cuando
    --el registro PIPO interno está habilitado y recibe un flanco de clock que
    --activa su funcionamiento. La señal se comporta como la salida de un
    --Flip Flop T.
    risingEdgeFlipFlopT : if (risingEdgeClock = TRUE) generate
        getEnableReferenceRisingEdge : process (clock_in)
        begin
            if( (rising_edge(clock_in)) and
                (counterTerminalCount_s = '1')) then
                registerEnableReference_s <= not registerEnableReference_s;
            end if;
        end process getEnableReferenceRisingEdge;
    end generate risingEdgeFlipFlopT;

    fallingEdgeFlipFlopT : if (risingEdgeClock = FALSE) generate
        getEnableReferenceFallingEdge : process (clock_in)
        begin
            if( (falling_edge(clock_in)) and
                (counterTerminalCount_s = '1')) then
                registerEnableReference_s <= not registerEnableReference_s;
            end if;
        end process getEnableReferenceFallingEdge;
    end generate fallingEdgeFlipFlopT;
end architecture top_regPIPO_arch;
