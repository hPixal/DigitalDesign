entity waituntil is
end entity;

architecture sim of waituntil is
    signal countUp    : integer := 0;
    signal countDown  : integer := 10;
    
begin

    process is 
    begin
        countUp <= countUp + 1;
        countDown <= countDown - 1;
        wait for 10 ns;
    end process;
    
    process is
    begin
        wait on countUp, countDown;
        report "Cuenta arriba = " & integer'image(countUp) &
               "Cuenta abajo  = " & integer'image(countDown);
    end process;
end architecture;