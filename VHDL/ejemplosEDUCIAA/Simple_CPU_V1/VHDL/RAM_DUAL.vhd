library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_DUAL is

generic (

    WORD_LENGTH : integer := 8   ;   --Bits por palabra
    ADDR_LENGTH : integer := 8 ) ;   --Bits de las direcciones

port (

    w_clk    : in  std_logic;   --Write Clock
    write_en : in  std_logic;   --Write Enable
    r_clk    : in  std_logic;   --Read Clock

    w_addr  : in  unsigned(ADDR_LENGTH-1 downto 0)   ;  --Direccion de escritura
    r_addr  : in  unsigned(ADDR_LENGTH-1 downto 0)   ;  --Direccion de lectura

    data_in  : in  std_logic_vector(WORD_LENGTH-1 downto 0)   ;  --Dato de entrada
    data_out : out std_logic_vector(WORD_LENGTH-1 downto 0) ) ;  --Dato de salida

end entity RAM_DUAL;

architecture RAM_DUAL_ARQ of RAM_DUAL is

--Bloque de memoria (** denota potencia)
type MEMORIA is array (0 to 2**ADDR_LENGTH-1) of std_logic_vector(WORD_LENGTH-1 downto 0);
signal MEM : MEMORIA;

begin

--Proceso de escritura
process (w_clk) begin
    if (rising_edge(w_clk)) then
        if (write_en='1') then
            MEM(to_integer(w_addr)) <= data_in;
        end if;
    end if;
end process;

--Proceso de lectura
process (r_clk) begin
    if (rising_edge(r_clk)) then
        data_out <= MEM(to_integer(r_addr));
    end if;
end process;

end architecture RAM_DUAL_ARQ;
