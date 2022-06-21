library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arth.all;
---use ieee.std_logic_unsigned.all;

entity sieteSegmentos_tb is
end entity;

architecture sieteSegmentos_tb of sieteSegmentos_tb is
    component sieteSegmentos
    port (
        AIN : in std_logic;
        BIN : in std_logic;
        CIN : in std_logic;
        DIN : in std_logic;
        LT : in std_logic;
        BI : in std_logic;
        a : out std_logic;
        b : out std_logic;
        c : out std_logic;
        d : out std_logic;
        e : out std_logic;
        f : out std_logic;
        g : out std_logic
    );
    end component;

    signal a : std_logic;
    signal b : std_logic;
    signal c : std_logic;
    signal d : std_logic;
    signal e : std_logic;
    signal f : std_logic;
    signal g : std_logic;
    signal AIN : std_logic;
    signal BIN : std_logic;
    signal CIN : std_logic;
    signal DIN : std_logic;
    signal LT : std_logic;
    signal BI : std_logic;
    
begin
    uut: sieteSegmentos
    port map(
            DIN => DIN,
            CIN => CIN,
            BIN => BIN,
            AIN => AIN,
            LT => LT,
            BI => BI,
            a => a,
            b => b,
            c => c,
            d => d,
            e => e,
            f => f,
            g => g
    );

    process
    begin
    wait for 10 ns;
    DIN <= '0'; CIN <= '0'; BIN <= '0'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Cero
    wait for 10 ns;
    DIN <= '0'; CIN <= '0'; BIN <= '0'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Uno
    wait for 10 ns;
    DIN <= '0'; CIN <= '0'; BIN <= '1'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Dos
    wait for 10 ns;
    DIN <= '0'; CIN <= '0'; BIN <= '1'; AIN <= '1'; BI <= '0'; LT <= '0';
    -- Tres
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '0'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Cuatro
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '0'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Cinco
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '1'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Seis
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '1'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Siete
    wait for 10 ns;
    DIN <= '1'; CIN <= '0'; BIN <= '0'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Ocho
    wait for 10 ns;
    DIN <= '1'; CIN <= '0'; BIN <= '0'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Nueve
    wait for 10 ns;
    DIN <= '1'; CIN <= '0'; BIN <= '1'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Diez
    wait for 10 ns;
    DIN <= '1'; CIN <= '0'; BIN <= '1'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Once
    wait for 10 ns;
    DIN <= '1'; CIN <= '1'; BIN <= '0'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Doce
    wait for 10 ns;
    DIN <= '1'; CIN <= '1'; BIN <= '0'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Trece
    wait for 10 ns;
    DIN <= '1'; CIN <= '1'; BIN <= '1'; AIN <= '0'; BI <= '0'; LT <= '0';
    --- Catorce
    wait for 10 ns;
    DIN <= '1'; CIN <= '1'; BIN <= '1'; AIN <= '1'; BI <= '0'; LT <= '0';
    --- Cince
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '1'; AIN <= '1'; BI <= '0'; LT <= '1';
    --- Siete con LT
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '1'; AIN <= '1'; BI <= '1'; LT <= '0';
    --- Siete con BI
    wait for 10 ns;
    DIN <= '0'; CIN <= '1'; BIN <= '1'; AIN <= '1'; BI <= '1'; LT <= '1';
    --- Siete con LT y BI
    wait for 10 ns;
    wait;
    end process;
end architecture;
