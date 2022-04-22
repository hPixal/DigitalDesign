
--------------------------------------------------------------------------------
--- Entidad: RAM256x16.
--- Descripción: Esta entidad es la RAM del Simple CPU v1.
--- Bibliografía: *",Simple CPU v1",, 9/10/2020,
--                  https://creativecommons.org/licenses/by-nc-nd/4.0/
--                *Grupo ASE, ",RAM Single Port",, Wiki-FPGA para todos.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 01/03/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
--                estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee; 				 --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;    --Paquete para signed y unsigned.
--Entidad.
entity RAM256x16 is
    generic(
        WORD_LENGTH : integer := 16; --Bits por palabra
        ADDR_LENGTH : integer := 8   --Bits de las direcciones
    ) ;
    port(
        clk_in      : in  std_logic; --Clock
        writeEn_in  : in  std_logic; --Write Enable
        address_in  : in  std_logic_vector(ADDR_LENGTH-1 downto 0); --Direccion
        data_in     : in  std_logic_vector(WORD_LENGTH-1 downto 0); --Dato de entrada
        data_out    : out std_logic_vector(WORD_LENGTH-1 downto 0) --Dato de salida
    );
end entity RAM256x16;
--Arquitectura
architecture RAM256x16_ARQ of RAM256x16 is
    --Bloque de memoria (** denota potencia).
    type MEMORY is array (0 to (2**ADDR_LENGTH)-1) of std_logic_vector(WORD_LENGTH-1 downto 0);
    signal mem_s : MEMORY := (
        x"0048",  -- H
        x"E0FF",
        x"0045",  -- E
        x"E0FF",
        x"004C",  -- L
        x"E0FF",
        x"004C",  -- L
        x"E0FF",
        x"004F",  -- O
        x"E0FF",
        x"0020",  -- SPACE
        x"E0FF",
        x"0057",  -- W
        x"E0FF",
        x"004F",  -- O
        x"E0FF",
        x"0052",  -- R
        x"E0FF",
        x"004C",  -- L
        x"E0FF",
        x"0044",  -- D
        x"E0FF",
        x"000A",  -- NewLine
        x"E0FF",
        x"8000",
      others => (others => '0')
    );
begin
    --Escritura y lectura sincronicas: se escribe la posición marcada por
    --address con el valor de data_in al activar la linea write. data_out se
    --actualiza con el valor de dicha posición de memoria.
    process (clk_in) begin
        if (rising_edge(clk_in)) then
            if (writeEn_in = '1') then
                mem_s(to_integer(unsigned(address_in))) <= data_in;
            end if;
            data_out <= mem_s(to_integer(unsigned(address_in)));
        end if;
    end process;
end architecture RAM256x16_ARQ;
