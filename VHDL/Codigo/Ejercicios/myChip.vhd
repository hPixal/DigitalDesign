library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arith.all;
---use ieee.std_logic_unsigned.all;

entity myChip is
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
end myChip;

architecture Behavioral of myChip is
    begin
        p <= (a4 and (not (a3)) and(not(a2)) and(a1)) 
          or (a4 and (not (a3)) and (a1) and (a0)) 
          or (a4 and (not (a3)) and (a1) and (a0))
          or (a4 and (a3) and (a2) and (a0)) 
          or (not (a3) and (a2) and (a1) and (a0))
          or (not (a4) and (a3) and (not (a2)) and (a1) and (a0))
          or (not (a4) and (not (a3)) and (not (a2)) and (a1));
        
        d2 <= not (a0);

        d3 <= ((not a4) and(not a3) and(not a2) and(not a1) and(not a0))
           or ((not a4) and(not a3) and( not a2) and(a1) and(a0))
           or ((not a4) and a3 and (not a2) and (not a1) and a0)
           or ((not a4) and a3 and (not a2) and (not a1) and a0)
           or ((not a4) and a3 and a2 and (not a1) and (not a0))
           or ((not a4) and a3 and a2 and a1 and a0)
           or ((a4 and (not a3) and (not a2) and a1 and (not a0)))
           or ((a4 and (not a3) and (not a2) and (not a1) and a0))
           or (a4 and (not a3) and a2 and ( not a1) and a0)
           or (a4 and a3 and (not a2) and a1 and a0)
           or (a4 and a3 and a2 and a1 and (not a0));
        
    end Behavioral;