--------------------------------------------------------------------------------
--- Entidad: regSISO
--- Descripción: Esta entidad es un registro de desplazamiento del tipo entrada
--							en serie/salida en serie. Los datos saldrán del registro uno
--							por uno en el mismo orden en el que se cargaron. El número de
--							bits es configurable a través del generic Nbits.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 08/08/2020.
--- Dependencias: Paq_outuete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

--Entidad
entity regSISO is
	--Cantidad de bits del registro
	generic (Nbits : integer range 8 to 64 := 8);

	--Puertos E/S
	port(
		clk_in : in std_logic;
		rst_in : in std_logic;
		ser_in : in std_logic;
		q_out : out std_logic);

end entity regSISO;

--Arquitectura
architecture regSISO_arch of regSISO is
	signal serialReg_s : std_logic_vector(Nbits-1 downto 0);

begin
	do_shift: process(clk_in)
	begin
			if rising_edge(clk_in) then
			if rst_in = '1' then
				serialReg_s <= (others => '0');
			else
				serialReg_s <= ser_in & serialReg_s(Nbits-1 downto 1);
			end if;
		end if;
	end process do_shift;

	q_out <= serialReg_s(0);

end architecture regSISO_arch;
