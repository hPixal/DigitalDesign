library ieee;
use ieee.std_logic_1164.all;

entity Lavarropas is
port(
    perilla          : in std_logic_vector(2 downto 0);
    inicio           : in std_logic;
    clk              : in std_logic;
    led_tapa         : out std_logic;
    led_lavado       : out std_logic;
    led_centrifugado : out std_logic;
    led_enjuague     : out std_logic
);
end entity;

architecture sens of Lavarropas is
    
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
        sal_sensor : in std_logic
    );
    end component;

    component Electroiman
    port(
        act_electroiman : in std_logic;
        led_electroiman : out std_logic
    );
    end component;

    --CABLES 

    --Valvulas
    signal act_VJ : std_logic;
    signal act_VS : std_logic;
    signal act_VL : std_logic;
    signal act_VV : std_logic;

    --Motor
    signal alt : std_logic;
    signal med : std_logic;

    --Bomba
    signal act_bomba : std_logic;

    --Electroiman
    signal act_electroiman : std_logic;
    signal led_electroiman : std_logic;

    --Sensores
    signal sal_sensor0 : std_logic;
    signal sal_sensor1 : std_logic;
    signal sal_sensor2 : std_logic;
    signal sal_sensor3 : std_logic;
    signal sal_sensor4 : std_logic;

    --Maquina de Estados

    signal state_reg  : std_logic_vector(3 downto 0);
    signal next_state : std_logic_vector(3 downto 0);

    --Estados
    Constant IDLE         : std_logic_vector(3 downto 0) := "0001";
    Constant LAVADO       : std_logic_vector(3 downto 0) := "0010";
    Constant ENJUAGUE     : std_logic_vector(3 downto 0) := "0100";
    Constant CENTRIFUGADO : std_logic_vector(3 downto 0) := "1000";
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

    --Electroiman
    TT: Electroiman port map(
        act_electroiman => act_electroiman,
        led_electroiman => led_electroiman
    );

    --Sensores
    S0: Sensor port map(
        sal_sensor => sal_sensor0
    );

    S1: Sensor port map(
        sal_sensor => sal_sensor1
    );

    S2: Sensor port map(
        sal_sensor => sal_sensor2
    );

    S3: Sensor port map(
        sal_sensor => sal_sensor3
    );

    S4: Sensor port map(
        sal_sensor => sal_sensor4
    );

    process(next_state)
    begin
        if(next_state'event) then
            state_reg <= next_state;
        end if;
    end process;

    process (clk)
    begin
      if rising_edge(clk) then
        delay <= rd_en & delay(0 to dn - 2);
      end if;
    end process;


    process(perilla,inicio,state_reg)
    begin
        case state_reg is
----------------------------------------------------------------------------------------------------
            when IDLE=>
                if inicio = '1' then
                    if perilla = "001" or perilla = "011" or perilla = "101" or perilla = "111" then
                        next_state <= LAVADO;
                    end if;
                    if perilla = "110" or perilla = "010" then
                        next_state <= ENJUAGUE;
                    end if;
                    if perilla = "100" then
                        next_state <= CENTRIFUGADO;
                    end if;
                else
                    next_state <= IDLE;
                end if;
----------------------------------------------------------------------------------------------------
            when LAVADO =>
                act_VJ <= '1';
                act_VL <= '1';
                --wait for 10 ns;
                act_VJ <= '0';
                act_VL <= '0';
                if sal_sensor3 = '0' then
                    act_VV <= '1';
                    med <= '1';
                    --wait for 20 ns;
                    act_VV <= '0';
                    med <= '0';
                    next_state <= IDLE;
                end if;
                med <= '1';
                --wait for 600 ns;
                med <= '0';
                act_VV <= '1';
                act_bomba <= '1';
                --wait for 20 ns;
                act_VV <= '0';
                act_bomba <= '0';
                --TODO: Logica de los sensores
                if perilla = "011" or perilla = "111" then
                    next_state <= ENJUAGUE;
                end if;
                if perilla = "001" then
                    next_state <= IDLE;
                end if;
                if perilla = "101" then
                    next_state <= CENTRIFUGADO;
                end if;
----------------------------------------------------------------------------------------------------
            when ENJUAGUE =>
            --TODO: Añadir logica motores
                if perilla = "011" or perilla = "010" then
                    next_state <= IDLE;
                end if;
                if perilla = "111" or perilla = "110" then
                    next_state <= CENTRIFUGADO;
                end if;
----------------------------------------------------------------------------------------------------
            when CENTRIFUGADO =>
                if perilla = "101" or perilla = "111" or perilla = "110" or perilla = "100" then
                    next_state <= IDLE;
                end if;
            
            when others =>
            next_state <= IDLE;
        end case;   
    end process;

end architecture;