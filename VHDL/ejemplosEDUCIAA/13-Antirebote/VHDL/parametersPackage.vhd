library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

package parametersPackage is
    constant F_CLOCK_MHZ : real := 2.0;
    constant DEBOUNCE_TIME : time := 7 ms;
end parametersPackage;
