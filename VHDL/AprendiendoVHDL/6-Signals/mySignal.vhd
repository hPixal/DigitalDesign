entity mySignals is
    end entity;

architecture sim of mySignals is
    signal mySignal : integer := 0;

begin
    process is
        variable myVariable : integer := 0;
        begin
            myVariable := myVariable + 1;
            mySignal <= mySignal + 1;
            
            report "Var = " & integer'image(myVariable) &
                " ,Singnal = " & integer'image(mySignal);
            wait for 10 ns;
    end process;
end architecture;