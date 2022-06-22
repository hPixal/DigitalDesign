library ieee;
use ieee.std_logic_1164.all;

entity logic is
    end entity;
    
    architecture sim of logic is
        signal signal1 : std_logic := '0';
    begin
        process is 
        begin
            wait for 10 ns;
            signal1 <= not signal1;
        end process;
    end architecture;