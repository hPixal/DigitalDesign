library ieee;
use ieee.std_logic_1164.all;

entity Contar2_tb is
end entity;

architecture tb of Contar2_tb is
    component Contar2
    port(
        COUNT  : out std_logic_vector(2 downto 0) := "000";
        UP_LOW : in std_logic := '1'; --FALLING_EDGE IS 0, RISING_EDGE IS 1 | DEFAULT & RESET = '1'
        RST    : in std_logic := '0';
        CLK    : in std_logic := '0'
    );
    end component;

    signal COUNT  : std_logic_vector(2 downto 0) := "000";
    signal UP_LOW : std_logic := '1'; --FALLING_EDGE IS 0, RISING_EDGE IS 1 | DEFAULT & RESET = '1'
    signal RST    : std_logic := '0';
    signal CLK    : std_logic := '0';

    constant clk_period : time := 1 ns;

begin

    uut: Contar2
    port map(
        COUNT   => COUNT,
        UP_LOW  => UP_LOW,
        RST     => RST,
        CLK     => CLK
    );

    clk_process :process
        variable contadorTB : integer range 0 to 50 := 0;
        begin
        contadorTB := contadorTB + 1;
        if contadorTB < 49 then 
            CLK <= '0';
            wait for clk_period/2;  --for 0.5 ns signal is '0'.
            CLK <= '1';
            wait for clk_period/2;  --for next 0.5 ns signal is '1'.
        else
        wait;
        end if;
   end process;

   tb_process :process
        --VARS AND SIGNALS:

        begin
            wait for 5 ns;
            UP_LOW <= '0';
            wait for 5 ns;
            RST <= '1';
            wait for 2 ns;
            RST <= '0';

            wait for 5 ns;
            UP_LOW <= '1';
            wait for 5 ns;
            RST <= '1';
            wait for 2 ns;
            RST <= '0';

            wait for 30 ns;
            RST <= '1';
            wait for 2 ns;
            RST <= '0';
        wait;
    end process;
        
end architecture;