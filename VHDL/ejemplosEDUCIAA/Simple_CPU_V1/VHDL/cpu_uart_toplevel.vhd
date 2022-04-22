--- Entidad: CPU_UART_toplevel.
--- Descripción: Esta entidad es el toplevel del Simple CPU V1 con una UART
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 15/05/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

entity CPU_UART_toplevel is
  generic (
     brDivisor : positive := 313 --Divisor para elegir baudrate 313 ~= 12MHz/(4*9600)
  );
  port (
      clock_in   : in  std_logic ;
      clr_in     : in  std_logic ;
      serial_out : out std_logic
  );
end entity CPU_UART_toplevel;

architecture CPU_UART_toplevel_arch of CPU_UART_toplevel  is

  -- Declaracion de la UART
  component UART_C is
    generic(
       BRDIVISOR : positive:=1); -- Baud rate divisor
    port (
       -- Wishbone signals
       wb_clk_i  : in  std_logic;  -- clock
       wb_rst_i  : in  std_logic;  -- Reset input
       wb_adr_i  : in  std_logic_vector(0 downto 0); -- Adress bus
       wb_dat_i  : in  std_logic_vector(7 downto 0); -- DataIn Bus
       wb_dat_o  : out std_logic_vector(7 downto 0); -- DataOut Bus
       wb_we_i   : in  std_logic;  -- Write Enable
       wb_stb_i  : in  std_logic;  -- Strobe
       wb_ack_o  : out std_logic;  -- Acknowledge
       -- Process signals
       inttx_o   : out std_logic;  -- Transmit interrupt: indicate waiting for Byte
       intrx_o   : out std_logic;  -- Receive interrupt: indicate Byte received
       br_clk_i  : in  std_logic;  -- Clock used for Transmit/Receive
       txd_pad_o : out std_logic;  -- Tx RS232 Line
       rxd_pad_i : in  std_logic); -- Rx RS232 Line
  end component UART_C;
  -- Declaracion del softcore
  component softcore is
    generic(
      cpu_data_word_length : integer := 8
    );
    port (
    clock_in   : in  std_logic ;
    clr_in     : in  std_logic ;
    cpu_out    : out std_logic_vector(cpu_data_word_length-1 downto 0);
    chip_en    : in  std_logic ;
    serial_we  : out std_logic
    );
  end component softcore;

  component BUF is

    generic (
        WORD_LENGTH : integer := 8;	        --Bits de cada palabra
        ADDR_LENGTH : integer := 8);        --Bits de direcciones
    port (
        clk      : in std_logic;				--Clock
        write_en : in std_logic;			        --Write enable
        read_en  : in std_logic;                            --Read enable
        reset    : in std_logic;                            --Reset

        data_in  : in  std_logic_vector(WORD_LENGTH-1 downto 0);	--Dato de entrada
        data_out : out std_logic_vector(WORD_LENGTH-1 downto 0);	--Dato de salida

        isFull   : out std_logic  ;                        --Buffer lleno
        isEmpty  : out std_logic );                        --Buffer vacio
  end component BUF;

  -- Constantes:
  constant NUM_BITS   : integer := 8;
  constant BUF_LEN    : integer := 8;


  --Señales de UART_C
  signal wb_rst : std_logic;  -- Reset input
  signal wbAdr_bus : std_logic_vector(0 downto 0); -- Adress bus
  signal wbDatIn_bus : std_logic_vector(7 downto 0); -- DataIn Bus
  signal wbDatOut_bus : std_logic_vector(7 downto 0); -- DataOut Bus
  signal wbWrite_ena  : std_logic;  -- Write Enable
  signal wbStb_s : std_logic;  -- Strobe
  signal wbAck_s : std_logic;  -- Acknowledge
  signal inttx_s  : std_logic;  -- Transmit interrupt: indicate waiting for Byte
  signal intrx_s  : std_logic;  -- Receive interrupt: indicate Byte received
  signal br_clk : std_logic;  -- Clock used for Transmit/Receive
  signal txd_s : std_logic;  -- Tx RS232 Line
  signal rxd_s : std_logic; -- Rx RS232 Line

  --Señales de Softcore
  signal clock_s     : std_logic;
  signal clear_s     : std_logic;
  signal chip_en_s   : std_logic;
  signal cpu_out_s   : std_logic_vector(NUM_BITS-1 downto 0);

  --Señales del Buffer
  signal isFull_s       : std_logic;
  signal isEmpty_s      : std_logic;
  signal buffer_out_s   : std_logic_vector(NUM_BITS-1 downto 0);
  signal read_en_s      : std_logic;
  signal write_en_s     : std_logic;

begin
  clear_s <= clr_in ;
  clock_s <= clock_in;
  wb_rst <=  not clear_s;
  wbAdr_bus <= "0";
  br_clk <= '1';
  wbStb_s <= '1';
  rxd_s <= '0';
  serial_out <= txd_s ;
  chip_en_s <=  '1' when isFull_s = '0' else '0';
  read_en_s <= inttx_s;

  BUF_0 : BUF
      generic map (
          WORD_LENGTH => NUM_BITS,
          ADDR_LENGTH => BUF_LEN )
      port map(
          clk      =>  clock_s,
          write_en =>  write_en_s,
          read_en  =>  read_en_s,
          reset    =>  wb_rst,
          data_in  =>  cpu_out_s,
          data_out =>  buffer_out_s,
          isFull   =>  isFull_s,
          isEmpty  =>  isEmpty_s
      );
  UART: entity work.UART_C
      generic map(BRDIVISOR => brDivisor)
      port map(
            wb_clk_i => clock_s,
            wb_rst_i => wb_rst,
            wb_adr_i => wbAdr_bus,
            wb_dat_i => wbDatIn_bus,
            wb_dat_o => wbDatOut_bus,
            wb_we_i => wbWrite_ena,
            wb_stb_i => wbStb_s,
            wb_ack_o => wbAck_s,
            inttx_o => inttx_s,
            intrx_o => intrx_s,
            br_clk_i => br_clk,
            txd_pad_o => txd_s,
            rxd_pad_i => rxd_s);
  softcore_1 : softcore
    generic map (
        cpu_data_word_length => NUM_BITS
    )
    port map
      (
          clock_in => clock_s  ,
          clr_in  => clear_s   ,
          cpu_out => cpu_out_s ,
          chip_en => chip_en_s ,
          serial_we => write_en_s
      );
  txProcess : process(clock_s)
    begin
      if rising_edge(clock_s) then
        if wb_rst = '1' then
            wbWrite_ena <= '0';
        elsif inttx_s = '1' then
            wbDatIn_bus <= buffer_out_s;
            wbWrite_ena <= '1';
        else
            wbWrite_ena <= '0';
        end if ;
      end if ;
  end process;



end architecture CPU_UART_toplevel_arch;
