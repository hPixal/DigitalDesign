library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity tipoJK_tb is
end entity;

architecture tipoJK_tb of tipoJK_tb is
    component tipoJK
    port(
        RST : in std_logic;
        D : in std_logic;
        Q : out std_logic;
        noQ : out std_logic;
        CLK : in std_logic
      );
    end component;
    
    signal RST : std_logic;
    signal D : std_logic;
    signal Q : std_logic;
    signal noQ : std_logic;
    signal CLK : std_logic;
    
    begin
        uut: tipoJK
        port map(
            RST => RST,
            D => D,
            Q => Q,
            noQ => noQ,
            CLK => CLK
        );
    process 
    begin
    wait for 10 ns;
    CLK <= '1'; D <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '0'; D <= '0';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1'; D <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '0'; D <= '0';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1'; RST <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1'; D <= '1'; RST <= '1';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1'; D <= '1'; RST <= '0';
    wait for 10 ns;
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1'; D <= '0'; RST <= '0';
    wait for 10 ns;
    wait;
    end process;
end architecture; 