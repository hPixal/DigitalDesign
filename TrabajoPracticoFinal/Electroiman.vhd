library ieee;
use ieee.std_logic_1164.all;

entity Electroiman is
port(
    act_electroiman : in std_logic;
    led_electroiman : out std_logic
);
end entity;

architecture sens of Electroiman is
begin
    led_electroiman <= act_electroiman;
end architecture;