library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign is
    end entity;
    
    architecture sim of sign is
        signal vector1 : unsigned(7 downto 0); -- 1 byte
        signal vector2 : unsigned(7 downto 0); 
        signal vector3 : signed(7 downto 0); 
        signal vector4 : signed(7 downto 0); 
    begin
        process is 
        begin

            wait for 10 ns;
        end process;
    end architecture;