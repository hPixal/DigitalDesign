library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BUF is

  generic ( WORD_LENGTH : integer := 8;	        --Bits de cada palabra
            ADDR_LENGTH : integer := 8);        --Bits de direcciones

  port (    clk      : in std_logic;				--Clock
            write_en : in std_logic;			        --Write enable
            read_en     : in std_logic;                            --Read enable
            reset    : in std_logic;                            --Reset

            data_in  : in  std_logic_vector(WORD_LENGTH-1 downto 0);	--Dato de entrada
            data_out : out std_logic_vector(WORD_LENGTH-1 downto 0);	--Dato de salida

            isFull   : out std_logic  ;                        --Buffer lleno
            isEmpty  : out std_logic );                        --Buffer vacio

end entity BUF;

architecture BUF_ARQ of BUF is

--Direcciones de lectura y escritura (recordar que las direcciones siempre deben declararse como unsigned)
signal w_addr : unsigned(ADDR_LENGTH-1 downto 0);
signal r_addr : unsigned(ADDR_LENGTH-1 downto 0);

--Direccion inicial y final
constant ADDR_START  : unsigned(ADDR_LENGTH-1 downto 0) := (others => '0'); --00
constant ADDR_FINISH : unsigned(ADDR_LENGTH-1 downto 0) := (others => '1'); --FF

--Lineas auxiliares
signal aux_write : std_logic;
signal aux_r_clk : std_logic;
signal aux_full  : std_logic;
signal aux_mpty  : std_logic;

--Dual Port RAM
component RAM_DUAL is

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

end component RAM_DUAL;

begin

--Instanciar memoria principal, para asegurarnos el uso de las BLOCK RAM de la FPGA
--Usamos una DUAL_RAM, pero con un clock unificado
block_ram : RAM_DUAL generic map (WORD_LENGTH => WORD_LENGTH, ADDR_LENGTH => ADDR_LENGTH)
                     port    map (w_clk    => clk,
                                  r_clk    => aux_r_clk,
                                  write_en => aux_write,
                                  w_addr   => w_addr,
                                  r_addr   => r_addr,
                                  data_in  => data_in,
                                  data_out => data_out);

--Definicion de las lineas auxiliares
isFull  <= aux_full;
isEmpty <= aux_mpty;
aux_write <= write_en and not aux_full;
aux_r_clk <= clk and read_en and not aux_mpty;

--Proceso principal
process (clk) begin
    if (rising_edge(clk)) then
        --Evento de reset
        if (reset = '1') then
	        w_addr  <= ADDR_START;
            r_addr  <= ADDR_START;
            aux_full <= '0';
            aux_mpty <= '1';
        else
            --Chequear si se puede escribir
            if (aux_full = '0') then
                if (write_en = '1') then
                    if (w_addr = ADDR_FINISH) then
                        w_addr <= ADDR_START;
                    else
                        w_addr <= w_addr + 1;
                    end if;
                    aux_mpty <= '0';
                elsif (w_addr = r_addr and aux_mpty = '0') then
                    aux_full  <= '1';
                else
                    aux_full  <= '0';
                end if;
            --Chequear si se puede leer
             elsif (aux_mpty = '0') then
                if (read_en = '1') then
                    if (r_addr = ADDR_FINISH) then
                        r_addr <= ADDR_START;
                    else
                        r_addr <= r_addr + 1;
                    end if;
                    aux_full  <= '0';
                elsif (r_addr = w_addr and aux_full = '0') then
                    aux_mpty <= '1';
                else
                    aux_mpty <= '0';
               end if;
            end	if;
        end if;
    end if;
end process;

end architecture BUF_ARQ;
