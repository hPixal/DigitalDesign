library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity tipoJK is
    port(
      RST : in std_logic;
      D : in std_logic;
      Q : out std_logic;
      noQ : out std_logic;
      CLK : in std_logic
    );
end tipoJK;

architecture Behavioral of tipoJK is
    signal internalQ : std_logic;
    begin
        process (CLK)
        begin
            if CLK'event and CLK='1' then
                if(RST='1'AND D = '1') then
                    internalQ <= (NOT internalQ);
                    else if(RST = '1') then
                        internalQ <= '0';
                        else
                        internalQ <= D;
                    end if;
                end if;
            end if;
            end process;
        Q <= internalQ;
        noQ <= (NOT internalQ);
    end Behavioral;