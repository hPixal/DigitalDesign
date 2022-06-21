library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity myChip_tb is
end entity;

architecture myChip_tb of myChip_tb is
    component myChip
    port (
        a4 : in std_logic;
        a3 : in std_logic;
        a2 : in std_logic;
        a1 : in std_logic;
        a0 : in std_logic;
        p : out std_logic;
        d2 : out std_logic;
        d3 : out std_logic
    );
    end component;

    signal a4 : std_logic;
    signal a3 : std_logic;
    signal a2 : std_logic;
    signal a1 : std_logic;
    signal a0 : std_logic;
    signal p : std_logic;
    signal d2 : std_logic;
    signal d3 : std_logic;
    
begin
    uut: myChip
    port map(
            a4 => a4,
            a3 => a3,
            a2 => a2,
            a1 => a1,
            a0 => a0,
            p => p,
            d2 => d2,
            d3 => d3
    );

    process
    begin
    wait for 10 ns;
    a4 <= '1'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '0'; 
    --- 10100 = 20 
    wait for 10 ns;
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '1'; 
    --- 00001 = 1
    wait for 10 ns;
    a4 <= '1'; a3 <= '0'; a2 <= '1'; a1 <= '1'; a0 <= '0'; 
    --- 10110 = 22
    wait for 10 ns;
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; 
    -- 00011 = 3
    wait for 10 ns;
    a4 <= '1'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0'; 
    --- 11000 = 24
    wait for 10 ns;
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '1'; 
    --- 01001 = 9
    wait for 10 ns;
    a4 <= '1'; a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '0'; 
    --- 11110 = 30
    wait for 10 ns;
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '1'; 
    --- 01011 = 11
    wait for 10 ns;
    wait;
    end process;
end architecture;