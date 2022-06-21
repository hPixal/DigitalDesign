entity myForLoop is
    end myForLoop;

architecture sim of myForLoop is
    begin
        process is
            begin
                for i in 0 to 10 loop
                    report "i equals " & integer'image(i);
                end loop ; 
            wait;
        end process;
end architecture;