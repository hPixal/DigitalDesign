library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity tipoT is
    port(
      RST : in std_logic;
      D : in std_logic;
      Q : out std_logic;
      CLK : in std_logic
    );
end tipoT;

architecture Behavioral of tipoT is
    signal internalQ : std_logi
    begin
        process (CLK)
        begin
            if CLK'event and CLK='1' then
                if(RST='1') then
                    internalQ <= '0';
                    else
                    internalQ <= D;
                    end if;
                end if;
            end process;
        Q <= internalQ;
    end Behavioral;