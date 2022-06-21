library ieee;
use ieee.std_logic_1164.all;

entity mXor is
port(
    a, b : in std_logic;
    x : out std_logic
);
end entity;

architecture arch_mXor of mXor is

begin

x <= a xor b;
-- x <= a and (mot b) or (not a) and b;
end architecture;