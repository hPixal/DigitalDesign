library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_unsigned.all;

entity comparasion is
    port (
        A : in std_logic_vector (3 downto 0);
        B : in std_logic_vector (3 downto 0);

        equals : out std_logic;
        minor : out std_logic;
        greater : out std_logic
    );
end comparasion;

architecture Behavioral of comparasion is
    begin
      equals <= '1' when A = B else '0';
      greater <= '1' when A > B else '0';
      minor <= '1' when A < B else '0';
end Behavioral;