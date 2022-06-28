library ieee;
use ieee.std_logic_1164.all;

entity Lavarropas_tb is
end entity;

architecture sens of Lavarropas_tb is
    component Lavarropas
    port(
        perilla          : in std_logic_vector(2 downto 0);
        inicio           : in std_logic;
        clk              : in std_logic;
        led_tapa         : out std_logic;
        led_lavado       : out std_logic;
        led_centrifugado : out std_logic;
        led_enjuague     : out std_logic;
      --VARIABLES SOLO PRESENTES EN EL TESTBENCH
        sal_sensor0      : in std_logic := '0';
        sal_sensor1      : in std_logic := '0';
        sal_sensor2      : in std_logic := '0';
        sal_sensor3      : in std_logic := '0';
        sal_sensor4      : in std_logic := '0'
    );
    end component;

    component Sensor
    port(
        sal_sensor : out std_logic
    );
    end component;
    

    
    signal perilla          :  std_logic_vector(2 downto 0) := (others =>  '0');
    signal inicio           :  std_logic;
    signal clk              :  std_logic := '0';
    signal led_tapa         :  std_logic;
    signal led_lavado       :  std_logic;
    signal led_centrifugado :  std_logic;
    signal led_enjuague     :  std_logic;

    signal sal_sensor0 : std_logic := '0';
    signal sal_sensor1 : std_logic := '0';
    signal sal_sensor2 : std_logic := '0';
    signal sal_sensor3 : std_logic := '0';
    signal sal_sensor4 : std_logic := '0';


    constant clk_period : time := 1 ns;
begin
    uut: Lavarropas
    port map(
        perilla          => perilla,          
        inicio           => inicio,           
        clk              => clk,              
        led_tapa         => led_tapa,         
        led_lavado       => led_lavado,       
        led_centrifugado => led_centrifugado, 
        led_enjuague     => led_enjuague,
        sal_sensor0 => sal_sensor0, 
        sal_sensor1 => sal_sensor1, 
        sal_sensor2 => sal_sensor2, 
        sal_sensor3 => sal_sensor3, 
        sal_sensor4 => sal_sensor4    
    );

    clk_process :process
        variable contadorTB : integer range 0 to 10000 := 0;
        begin
        contadorTB := contadorTB + 1;
        if contadorTB < 9999 then 
            clk <= '0';
            wait for clk_period/2;  --for 0.5 ns signal is '0'.
            clk <= '1';
            wait for clk_period/2;  --for next 0.5 ns signal is '1'.
        else
        wait;
        end if;
   end process;

   tb_process :process
        variable contador : integer := 0;
        begin
            --perilla <= "000"; --IDLE
            --wait for 5 ns;
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 5 ns;
    
            perilla <= "111";
            inicio <= '1';
            wait for 5 ns;
            sal_sensor2 <= '1';
            sal_sensor0 <= '1';
            inicio <= '0';
            wait for 36 ns;
            sal_sensor2 <= '0';
            sal_sensor0 <= '0';
            wait for 6 ns;
            sal_sensor2 <= '1';
            sal_sensor0 <= '1';
            wait for 36 ns;
            sal_sensor2 <= '0';
            sal_sensor0 <= '0';
            wait for 10 ns;
            sal_sensor0 <= '1';
            wait for 11 ns;
            sal_sensor0 <= '0';

    
            --perilla <= "010"; --ENJUAGUE
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 50 ns;
    
            --perilla <= "100"; --CENTRIFUGADO
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 50 ns;
    --
            --perilla <= "011"; --LAVADO Y ENJUAGUE
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 100 ns;
    --
            --perilla <= "101"; --LAVADO Y CENTRIFUGADO
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 100 ns;
    --
            --perilla <= "110"; --ENJUAGUE Y CENTRIFUGADO
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 100 ns;
    --
            --perilla <= "111"; --LAVADO ENJUAGUE Y CENTRIFUGADO
            --inicio <= '1';
            --wait for 3 ns;
            --inicio <= '0';
            --wait for 100 ns;
        wait;
    end process;
        
end architecture;