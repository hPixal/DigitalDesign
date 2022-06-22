entity sensitivity is
    end entity;

architecture sim of sensitivity is
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
            if countUp > countDown then
                report "mayor";
            elsif countUp = countDown then
                report "iguales";
            else 
                report "menor";
            end if;
            wait on countUp, countDown;
        end process;

        process(countUp,countDown) is
            begin
            if countUp > countDown then
                report "mayor";
            elsif countUp = countDown then
                report "iguales";
            else 
                report "menor";
            end if;
        end process;

        process is
        begin
            wait on countUp, countDown;
            report "Cuenta arriba = " & integer'image(countUp) &
                   "Cuenta abajo  = " & integer'image(countDown);
        end process;
end architecture;
        