library ieee;
use ieee.std_logic_1164.all;

entity Lavarropas is
port(
    perilla          : in std_logic_vector(2 downto 0) := "000";
    inicio           : in std_logic := '0';
    clk              : in std_logic := '0';
    led_tapa         : out std_logic := '0';
    led_lavado       : out std_logic := '0';
    led_centrifugado : out std_logic := '0';
    led_enjuague     : out std_logic := '0';
    --DESCOMENTAR PARA EL TESTBENCH
    sal_sensor0      : in std_logic := '0';
    sal_sensor1      : in std_logic := '0';
    sal_sensor2      : in std_logic := '0';
    sal_sensor3      : in std_logic := '0';
    sal_sensor4      : in std_logic := '0'
);
end entity;

architecture sens of Lavarropas is
    signal cont : integer range 0 to 63 := 0;
    
    component Motor
    port(
        med : in std_logic;
        alt : in std_logic
        );
    end component;
        
    component Bomba
    port(
        act_bomba : in std_logic
        );
    end component;

    component Valvula
    port(
        act_valvula : in std_logic
    );
    end component;

    component Sensor
    port(
        sal_sensor : out std_logic
    );
    end component;

    component Electroiman
    port(
        act_electroiman : in std_logic;
        salida_electroiman : out std_logic
    );
    end component;

    --CABLES 

    --Valvulas
    signal act_VJ : std_logic := '0';
    signal act_VS : std_logic := '0';
    signal act_VL : std_logic := '0';
    signal act_VV : std_logic := '0';

    --Motor
    signal alt : std_logic := '0';
    signal med : std_logic := '0';

    --Bomba
    signal act_bomba : std_logic := '0';

    --Electroiman
    signal act_electroiman : std_logic := '0';
    signal salida_electroiman : std_logic := '0';

    --Sensores COMENTAR ESTAS SENALES PARA EL TESBENCH
    --signal sal_sensor0 : std_logic := '0';
    --signal sal_sensor1 : std_logic := '0';
    --signal sal_sensor2 : std_logic := '1';
    --signal sal_sensor3 : std_logic := '0';
    --signal sal_sensor4 : std_logic := '0';

    --Maquina de Estados

    signal state_reg  : std_logic_vector(5 downto 0);
    signal next_state : std_logic_vector(5 downto 0);

    --Bandera
    signal camino : std_logic_vector(1 downto 0) := "00";

    --Estados
    Constant IDLE         : std_logic_vector(5 downto 0) := "000001";
    Constant LAVADO       : std_logic_vector(5 downto 0) := "000010";
    Constant ENJUAGUE     : std_logic_vector(5 downto 0) := "000100";
    Constant CENTRIFUGADO : std_logic_vector(5 downto 0) := "001000";
    Constant LLENADO      : std_logic_vector(5 downto 0) := "010000";
    Constant DESAGOTE     : std_logic_vector(5 downto 0) := "100000";
    begin

    --Valvulas
    VS: Valvula port map(
        act_valvula => act_VS
    ); 
    VJ: Valvula port map(
        act_valvula => act_VJ
    );
    VL: Valvula port map(
        act_valvula => act_VL
    );
    VV: Valvula port map(
        act_valvula => act_VV
    );

    --Motor
    CVM: Motor port map(
        alt => alt,
        med => med
    );
    
    --Bomba
    CB: Bomba port map(
        act_bomba => act_bomba
    );

    --Electroiman111
    TT: Electroiman port map(
        act_electroiman => act_electroiman,
        salida_electroiman => salida_electroiman
    );

    --COMENTAR LOS SENSORES PARA EL TEST BENCH
    --Sensores
    --S0: Sensor port map(
    --    sal_sensor => sal_sensor0
    --);
--
    --S1: Sensor port map(
    --    sal_sensor => sal_sensor1
    --);
--
    --S2: Sensor port map(
    --    sal_sensor => sal_sensor2
    --);
--
    --S3: Sensor port map(  
    --    sal_sensor => sal_sensor3
    --);
--
    --S4: Sensor port map(
    --    sal_sensor => sal_sensor4
    --);

    process(next_state)
    begin                            
        if next_state'event then
            state_reg <= next_state;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            cont <= cont + 1 ;
            led_tapa <= salida_electroiman;
            case state_reg is
--------------------------------------------------------------------------------------------------------
                when IDLE=>
                    act_electroiman <= '0';
                    if inicio = '1' then
                        if perilla = "001" or perilla = "010" or  perilla = "011" or  perilla = "101"  or perilla = "110" or  perilla = "111" then
                            cont <= 0;
                            next_state <= LLENADO;
                        elsif perilla = "100" then
                            cont <= 0;
                            next_state <= CENTRIFUGADO;
                        end if;
                    else
                        cont <= 0;
                        next_state <= IDLE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when LAVADO =>
                    act_electroiman <= '1';
                    if cont = 1 then
                        led_lavado <= '1';
                        med <= '1';
                    elsif cont = 31 then
                        led_lavado <= '0';
                        med <= '0';
                        cont <= 0;
                        if perilla = "001" then
                            camino <= "11";
                        elsif perilla = "101" then
                            camino <= "10";
                        elsif perilla = "011" and perilla = "111" then
                            camino <= "01"; 
                        end if;
                        led_lavado <= '0';
                        cont <= 0;
                        next_state <= DESAGOTE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when ENJUAGUE =>
                    act_electroiman <= '1';
                    if cont = 1 then
                        led_enjuague <= '1';
                        med <= '1';
                    elsif cont = 31 then
                        med <= '0';
                        cont <= 0;
                        led_enjuague <= '0';
                        if perilla = "010" or perilla = "011" then
                            camino <= "11";
                        elsif perilla = "110" or perilla = "111" then
                            camino <= "10";
                        end if;
                        led_enjuague <= '0';
                        next_state <= DESAGOTE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when CENTRIFUGADO =>
                    act_electroiman <= '1';
                    if cont = 1 then
                        led_centrifugado <= '1';
                        if sal_sensor0 = '1' then
                            led_centrifugado <= '0';
                            camino <= "10";
                            cont <= 0;
                            next_state <= DESAGOTE;
                        else
                            alt <= '1';
                        end if;
                    elsif cont = 16 then
                        camino <= "00";
                        cont <= 0;
                        led_centrifugado <= '0';
                        next_state <= DESAGOTE;
                    else 
                        cont <= 0;
                        led_centrifugado <= '0';
                        next_state <= IDLE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when LLENADO =>
                    act_electroiman <= '1';
                    if sal_sensor4 = '0' then
                        if cont = 1 and sal_sensor2 = '0' then
                            if camino = "00" then 
                                act_VL <= '1';
                                act_VJ <= '1';
                            elsif camino = "01" then
                                act_VL <= '1';
                                act_VS <= '1';
                            end if;
                        elsif sal_sensor2 = '1' and cont < 6 then 
                            act_VL <= '0';
                            act_VS <= '0';
                            act_VJ <= '0';
                            if camino = "00" then
                                cont <= 0;
                                next_state <= LAVADO;
                            else
                                cont <= 0;
                                next_state <= ENJUAGUE;
                            end if;
                        elsif cont = 6 then
                            act_VL <= '0';
                            act_VS <= '0';
                            act_VJ <= '0'; 
                            camino <= "11";
                            cont <= 0;
                            next_state <= DESAGOTE;
                        end if;
                    else
                        act_VL <= '0';
                        act_VS <= '0';
                        act_VJ <= '0'; 
                        camino <= "11";
                        cont <= 0;
                        next_state <= DESAGOTE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when DESAGOTE =>
                    act_electroiman <= '1';
                    if cont = 1 and sal_sensor0 = '1' then
                        act_bomba <= '1';
                        act_VV <= '1';
                    elsif cont > 1 and sal_sensor0 = '0' then
                        act_bomba <= '0';
                        act_VV <= '0';
                        if camino = "01" then
                            cont <= 0;
                            next_state <= LLENADO;
                        elsif camino = "10" then
                            cont <= 0;
                            next_state <= CENTRIFUGADO;
                        else
                            cont <= 0;
                            next_state <= IDLE;
                        end if;
                    elsif cont = 1 and sal_sensor0 = '0' then
                        cont <= 0;
                        next_state <= IDLE;
                    end if;
--------------------------------------------------------------------------------------------------------
                when others =>
                cont <= 0;
                next_state <= IDLE;
            end case;
            if cont = 60 then
                cont <= 0;
            end if;
        end if;   
    end process;

end architecture;