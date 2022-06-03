library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity tipoT_tb is
end entity;

architecture tipoT_tb of tipoT_tb is
    component tipoT
    port(
        RST : in std_logic;
        D : in std_logic;
        Q : out std_logic;
        CLK : in std_logic
      );
    end component;
    
    signal RST : std_logic;
    signal D : std_logic;
    signal Q : std_logic;
    signal CLK : std_logic;
    
    begin
        uut: tipoT
        port map(
            RST => RST,
            D => D,
            Q => Q,
            CLK => CLK
        );
    process 
    begin
    wait for 10 ns;
    CLK <= '1'; D <= '1';
    wait for 10 ns;
    CLK <= '0'; D <= '0';
    wait for 10 ns;
    CLK <= '1'; D <= '1';
    wait for 10 ns;
    CLK <= '0'; D <= '0';
    wait for 10 ns;
    CLK <= '1'; RST <= '1';
    wait for 30 ns;
    wait;
    end process;
end architecture; 

    
