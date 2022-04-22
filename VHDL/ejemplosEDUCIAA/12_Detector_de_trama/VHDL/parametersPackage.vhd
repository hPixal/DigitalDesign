library IEEE;
use IEEE.std_logic_1164.all;

package parametersPackage is
    constant OCCURRENCES : integer :=  2;
    constant NBITS : integer :=  8;
    constant SEQUENCE : std_logic_vector(NBITS-1 downto 0) := "10011100";
end parametersPackage;
