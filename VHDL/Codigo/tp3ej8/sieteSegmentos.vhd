library ieee;
use ieee.std_logic_1164.all;
---use ieee.std_logic_arith.all;
---use ieee.std_logic_unsigned.all;

entity sieteSegmentos is
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
end sieteSegmentos;

architecture Behavioral of sieteSegmentos is
    begin
        a <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND (---BI LT PRIORITY CHECK
             ((NOT AIN) AND (CIN))
          OR ((NOT AIN) AND (NOT BIN) AND (NOT DIN))
          OR ((NOT AIN) AND (BIN) AND (DIN))
          OR ((AIN) AND (NOT BIN) AND (NOT CIN))));
        
        b <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT AIN) AND (NOT BIN))
          OR ((NOT BIN) AND (NOT CIN))
          OR ((NOT AIN) AND (NOT CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (CIN) AND (DIN))));

        c <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT BIN) AND (NOT CIN))
          OR ((NOT AIN) AND (DIN))
          OR ((NOT AIN) AND (BIN))));

        d <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT BIN) AND (NOT CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (NOT BIN) AND (CIN))
          OR ((NOT AIN) AND (CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (BIN) AND (NOT CIN) AND (DIN))));

        e <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT BIN) AND (NOT CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (CIN) AND (NOT DIN))));

        f <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT AIN) AND (NOT CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (BIN) AND (NOT CIN))
          OR ((NOT AIN) AND (BIN) AND (NOT DIN))
          OR ((AIN) AND (NOT BIN) AND (NOT CIN))));

        g <= ((NOT BI) AND (LT)) OR ( (NOT BI) AND ( ---BI LT PRIORITY CHECK
             ((NOT AIN) AND (NOT BIN) AND (CIN))
          OR ((NOT AIN) AND (CIN) AND (NOT DIN))
          OR ((NOT AIN) AND (BIN) AND (NOT CIN))
          OR ((AIN) AND (NOT BIN) AND (NOT CIN))));
    end Behavioral;