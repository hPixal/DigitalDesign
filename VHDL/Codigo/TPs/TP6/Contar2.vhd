library ieee;
use ieee.std_logic_1164.all;

entity Contar2 is
port(
    COUNT  : out std_logic_vector(2 downto 0) := "000";
    UP_LOW : in std_logic := '1'; --FALLING_EDGE IS 0, RISING_EDGE IS 1 | DEFAULT & RESET = '1'
    RST    : in std_logic := '0';
    CLK    : in std_logic := '0'
);
end entity;

architecture sens of Contar2 is

    signal INTERNAL_COUNT : std_logic_vector(2 downto 0) := "000";

    --Maquina de Estados

    signal CRNT_STATE : std_logic_vector(3 downto 0);
    signal NEXT_STATE : std_logic_vector(3 downto 0);

    --Estados

    Constant IDLE  : std_logic_vector(3 downto 0) := "0001";
    Constant CHECK : std_logic_vector(3 downto 0) := "0010";
    Constant SUM   : std_logic_vector(3 downto 0) := "0100";
    Constant RESET : std_logic_vector(3 downto 0) := "1000";

    begin

    STATE_MACHINE:process(NEXT_STATE)
    begin                            
        if NEXT_STATE'event then
            CRNT_STATE <= NEXT_STATE;
        end if;
    end process;

    MAIN_PROCESS:process(CLK)
        begin
        if (falling_edge(CLK) and UP_LOW = '0') or (rising_edge(CLK) and UP_LOW = '1') then
            case CRNT_STATE is
                when IDLE =>
                    if RST = '1' then
                        NEXT_STATE <= RESET;
                    else
                        NEXT_STATE <= SUM;
                    end if;
                when SUM =>
                    if INTERNAL_COUNT = "000" and RST = '0' then
                        INTERNAL_COUNT <= "010" ;
                        COUNT <= "010";
                        NEXT_STATE <= SUM;
                    elsif INTERNAL_COUNT = "010" and RST = '0' then
                        INTERNAL_COUNT <= "100" ;
                        COUNT <= "100";
                        NEXT_STATE <= SUM;
                    elsif INTERNAL_COUNT = "100" and RST = '0' then
                        INTERNAL_COUNT <= "110" ;
                        COUNT <= "110";
                        NEXT_STATE <= SUM;
                    elsif INTERNAL_COUNT = "110" and RST = '0' then
                        INTERNAL_COUNT <= "000" ;
                        COUNT <= "000";
                        NEXT_STATE <= SUM;
                    elsif RST = '1' then
                        NEXT_STATE <= RESET;
                    end if;
                when RESET =>
                    INTERNAL_COUNT <= "000" ;
                    COUNT <= "000";
                    NEXT_STATE <= IDLE;
                when others =>
                    NEXT_STATE <= RESET;
                end case;
            end if;
        end process;
end architecture;