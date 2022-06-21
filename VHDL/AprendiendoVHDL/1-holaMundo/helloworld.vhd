entity helloworld is
end entity;

architecture sim of helloworld is
    begin
        process is
            begin
                report "Hello World";
                wait;
        end process;            
end architecture;
                