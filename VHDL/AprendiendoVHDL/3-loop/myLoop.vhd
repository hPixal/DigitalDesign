entity myLoop is
end myLoop;

architecture sim of myLoop is
begin
    process is
    begin
        report "Not looping yet";
        
        loop
            report "loOOoping";
            exit;
        end loop;

        report "Not looping anymore";
        wait;
    end process ; 

end sim ; -- sim