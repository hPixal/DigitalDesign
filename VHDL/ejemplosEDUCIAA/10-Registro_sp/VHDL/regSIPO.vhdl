--------------------------------------------------------------------------------
--- Entidad: regSIPO
--- Descripción: Esta entidad es un registro de desplazamiento del tipo entrada
--							en serie/salida en paralelo. Los datos ingresados por la entrada
--							serie se irán desplazando dentro del registro y saldrán de forma
-- 							paralela.El número de bits es configurable a través del generic
--							Nbits.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 29/08/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

--Entidad
entity regSIPO is
	generic (Nbits : integer range 8 to 64 := 8);
	port(
		clk_in : in std_logic;
		rst_in : in std_logic;
		ser_in : in std_logic;
		q_out : out std_logic_vector(Nbits-1 downto 0));
end entity regSIPO;

--Arquitectura
architecture regSIPO_arch of regSIPO is

signal serialReg_s : std_logic_vector(Nbits-1 downto 0);

begin
	do_shift:	process(clk_in) begin
		if (rising_edge(clk_in)) then
			if rst_in = '1' then
				serialReg_s <= (others => '0');
			else
				serialReg_s <= ser_in & serialReg_s(Nbits-1 downto 1);
			end if;
		end if;
	end process do_shift;

	q_out <= serialReg_s;

end architecture regSIPO_arch;
