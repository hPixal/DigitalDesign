entity myWhile is
    end myWhile;

architecture sim of myWhile is
    begin
        process is
            variable i : integer := 0;
            begin
                while i < 10 loop
                    report "i equals " & integer'image(i);
                    i:= i+4 ;
                end loop ; 
            wait;
        end process;
end architecture;