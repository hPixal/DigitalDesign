--------------------------------------------------------------------------------
--- Entidad: arbiter
--- Descripción: Esta entidad ejemplifica una FSM mediante el diseño de un
--              arbiter, un bloque cuya función es administrar el acceso a un
--              recurso compartido por varios dispositivos.
--- Autor/es: Hernán Pablo Mendes Gouveia.
--- Ultima revisión: 06/09/2020.
--- Dependencias: Paq_outuete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--Entidad
entity arbiter is
    port(
        -- Entradas
        req1_in : in std_logic;
        req2_in : in std_logic;

        -- Reset
        rst_in : in std_logic;

        -- Clock
        clk_in : in std_logic;

        -- Salidas
        gnt1_out : out std_logic;
        gnt2_out : out std_logic
    );
end entity arbiter;

architecture arbiter_arq of arbiter is

    -- Bits de representacion de estado
    constant N_BITS_STATE : integer := 2;

    -- Estado actual
    signal state_s : std_logic_vector(N_BITS_STATE-1 downto 0);

    -- Proximo estado
    signal nextState_s : std_logic_vector(N_BITS_STATE-1 downto 0);

    -- Estados del sistema
    constant IDLE : std_logic_vector(N_BITS_STATE-1 downto 0) := "00";
    constant GNT1: std_logic_vector(N_BITS_STATE-1 downto 0) := "01";
    constant GNT2: std_logic_vector(N_BITS_STATE-1 downto 0) := "10";

 -- Normalmente en ASIC se configura 1 bit por estado posible para simplificar la lógica de estado siguiente.
-- (Es decir, ahorrar compuertas). Esta es la regla que se uso para codificar los estados de este ejemplo.
-- Sin embargo, en FPGA no es necesario seguir este formato (ya que siempre se usara una LUT),
-- y pueden usarse n bits para codificar 2^n estados.
-- Lo importante es que el estado IDLE siempre este definido. Sera el estado por default o de arranque de la FSM.

begin

--Definicion combinacional del proximo estado
NextStateLogic: process (req1_in,req2_in) begin

    case state_s is
        when IDLE =>
            if (req1_in='1' and req2_in='0') then
                nextState_s <= GNT1;
            elsif (req1_in='0' and req2_in='1') then
                nextState_s <= GNT2;
            else
                nextState_s <= IDLE;
            end if;

        when GNT1 =>
            if (req1_in='1') then
                nextState_s <= GNT1;
            else
                nextState_s <= IDLE;
            end if;

        when GNT2 =>
            if (req2_in='1') then
                nextState_s <= GNT2;
            else
                nextState_s <= IDLE;
            end if;

        when others => nextState_s <= IDLE;

    end case;

end process;

-- Actualizacion sincronica del estado (bloque constante para todas las FSM)
UpdateState: process(rst_in, clk_in) begin
    if (rst_in='1') then
        state_s <= IDLE;
    elsif (rising_edge(clk_in)) then
        state_s <= nextState_s;
    end if;
end process;

--Definicion combinacional de las salidas segun el estado actual (Maquina de Moore)
OutputLogic: process(state_s) begin

    case state_s is
        when IDLE =>
            gnt1_out <= '0';
            gnt2_out <= '0';

        when GNT1 =>
            gnt1_out <= '1';
            gnt2_out <= '0';

        when GNT2 =>
            gnt1_out <= '0';
            gnt2_out <= '1';

        when others =>
            gnt1_out <= '0';
            gnt2_out <= '0';
    end case;
end process;

end architecture arbiter_arq;
