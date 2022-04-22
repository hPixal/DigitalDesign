--------------------------------------------------------------------------------
--- Entidad: BCDTo7seg.
--- Descripción: Esta entidad es un decodificador de BCD a 7 segmentos, que
--               convierte valores de 0 a 15, posee una línea de habilitación y
--               puede ser configurado con su salida en ánodo o cátodo común,
--               según un genérico.
--
--               Si el decodificador no está habilitado, la salida es tal
--               que ningún segmento debería encenderse. Es decir, todos ceros
--               si es cátodo común, o todos unos si es ánodo común.
--
--               La correspondencia entre la salida "seg7_out" y los segmentos
--               del display es:
--                              seg7_out(0) --> segmento a
--                              seg7_out(1) --> segmento b
--                              seg7_out(2) --> segmento c
--                              seg7_out(3) --> segmento d
--                              seg7_out(4) --> segmento e
--                              seg7_out(5) --> segmento f
--                              seg7_out(6) --> segmento g
--- Autor/es: Martín Heredia y Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity BCDTo7seg is
    generic(commonAnode : BOOLEAN := TRUE);
    port(
        BCD_in   : in  std_logic_vector(3 downto 0);
        ena_in 	 : in  std_logic;
        seg7_out : out std_logic_vector(6 downto 0)
    );
end entity BCDTo7seg;

--Declaración de la arquitectura.
architecture BCDTo7seg_arch of BCDTo7seg is
    --Declaración de constante que sirve para invertir bits.
    constant ONES : std_logic_vector(6 downto 0) := "1111111";

    --Declaración de señal que es la salida para cátodo común.
    signal seg7comCath_s : std_logic_vector(6 downto 0);
begin
    --Proceso para convertir de BCD a 7 segmentos.
    makeConversion: process(BCD_in, ena_in)
    begin
        if ena_in = '1' then
            case BCD_in is
                when "0000" =>
                    seg7comCath_s <= "0111111";-- Display: 0.
                when "0001" =>
                    seg7comCath_s <= "0000110";-- Display: 1.
                when "0010" =>
                    seg7comCath_s <= "1011011";-- Display: 2.
                when "0011" =>
                    seg7comCath_s <= "1001111";-- Display: 3.
                when "0100" =>
                    seg7comCath_s <= "1100110";-- Display: 4.
                when "0101" =>
                    seg7comCath_s <= "1101101";-- Display: 5.
                when "0110" =>
                    seg7comCath_s <= "1111101";-- Display: 6.
                when "0111" =>
                    seg7comCath_s <= "0000111";-- Display: 7.
                when "1000" =>
                    seg7comCath_s <= "1111111";-- Display: 8.
                when "1001" =>
                    seg7comCath_s <= "1101111";-- Display: 9.
                when "1010" =>
                    seg7comCath_s <= "1110111";-- Display: A.
                when "1011" =>
                    seg7comCath_s <= "1111100";-- Display: b.
                when "1100" =>
                    seg7comCath_s <= "0111001";-- Display: C.
                when "1101" =>
                    seg7comCath_s <= "1011110";-- Display: d.
                when "1110" =>
                    seg7comCath_s <= "1111001";-- Display: E.
                when others =>
                    seg7comCath_s <= "1110001";-- Display: F.
            end case;
        else
            seg7comCath_s <= "0000000";--Cuando el conversor no está habilitado.
        end if;
    end process makeConversion;

    --Inversión de bits de salida si el decodificador es ánodo común.
    seg7_out <= (seg7comCath_s xor ONES) when (commonAnode = TRUE) else
                 seg7comCath_s; --commonAnode = FALSE.
end architecture BCDTo7seg_arch;
