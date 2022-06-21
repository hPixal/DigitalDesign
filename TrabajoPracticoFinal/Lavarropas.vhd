library ieee;
use ieee.std_logic_1164.all;

entity Lavarropas is
port(
    inicio : in std_logic;
    perilla : in std_logic_vector(2 downto 0);
    led_tapa : out std_logic;
    led_lavado : out std_logic;
    led_centrifugado : out std_logic;
    led_enjuague : out std_logic
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


end architecture;