library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_unsigned.all;

entity comparasion_tb is
end entity;

architecture comparasion_tb of comparasion_tb is
    component comparasion
    port (
        A : in std_logic_vector (3 downto 0);
        B : in std_logic_vector (3 downto 0);

        equals : out std_logic;
        minor : out std_logic;
        greater : out std_logic
    );
    end component;

    signal A : std_logic_vector (3 downto 0);
    signal B : std_logic_vector (3 downto 0);
    signal equals :  std_logic;
    signal minor :  std_logic;
    signal  greater :std_logic;
    
begin
    uut: comparasion
    port map(
        A => A,
        B => B,
        equals => equals,
        minor => minor,
        greater => greater
    );

    process
    begin
    wait for 10 ns;
    A(0) <= '0'; A(1) <= '0'; A(2) <= '0'; A(3) <= '0'; 
    B(0) <= '0'; B(1) <= '0'; B(2) <= '0'; B(3) <= '0'; 

    wait for 10 ns;
    A(0) <= '1'; A(1) <= '0'; A(2) <= '0'; A(3) <= '0'; 
    B(0) <= '0'; B(1) <= '0'; B(2) <= '0'; B(3) <= '0'; 

    wait for 10 ns;
    A(0) <= '0'; A(1) <= '1'; A(2) <= '0'; A(3) <= '0'; 
    B(0) <= '1'; B(1) <= '0'; B(2) <= '0'; B(3) <= '0'; 

    wait for 10 ns;
    A(0) <= '0'; A(1) <= '0'; A(2) <= '0'; A(3) <= '1'; 
    B(0) <= '1'; B(1) <= '0'; B(2) <= '0'; B(3) <= '0'; 

    wait for 10 ns;
    A(0) <= '1'; A(1) <= '1'; A(2) <= '1'; A(3) <= '1'; 
    B(0) <= '1'; B(1) <= '0'; B(2) <= '0'; B(3) <= '1'; 

    wait for 10 ns;
    wait;
    end process;
end architecture;
