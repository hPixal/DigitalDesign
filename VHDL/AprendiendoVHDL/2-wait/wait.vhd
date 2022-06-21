entity wa is
    end entity;
    
    architecture sim of wa is
        begin
            process is
                begin
                    report "Peekaboo!";
                    wait for 2000000000 ns;
            end process;            
    end architecture;
                    