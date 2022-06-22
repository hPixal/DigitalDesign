library ieee;
use ieee.std_logic_1164.all;

entity vectors is
    end entity;
    
    architecture sim of vectors is
        signal vector1 : std_logic_vector(7 downto 0); -- 1 byte
        signal vector2 : std_logic_vector(7 downto 0) := (others => '0'); 
        signal vector3 : std_logic_vector(7 downto 0) := (others => '0'); 
        signal vector4 : std_logic_vector(7 downto 0) := (others => '0'); 
    begin
        process is 
        begin

            wait for 10 ns;
        end process;
    end architecture;