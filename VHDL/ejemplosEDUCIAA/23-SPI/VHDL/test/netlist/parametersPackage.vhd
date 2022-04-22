library IEEE;
use IEEE.std_logic_1164.all;

package parametersPackage is
    constant DATABITS : integer := 8;
    constant CPOL : std_logic := '1';
    constant CPHA : std_logic := '1';
    constant CSPOL : std_logic := '0';
    constant PER2 : time := (100 ns /2);
end parametersPackage;
