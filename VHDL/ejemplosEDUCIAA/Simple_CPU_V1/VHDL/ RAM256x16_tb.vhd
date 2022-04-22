--------------------------------------------------------------------------------
--- Entidad: RAM256x16_tb.
--- Descripción: Este testbench permite probar la RAM del Simple CPU v1.
--- Bibliografía: *"Simple CPU v1", 9/10/2020,
--                  https://creativecommons.org/licenses/by-nc-nd/4.0/
--                *Grupo ASE, "RAM Single Port", Wiki-FPGA para todos.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 01/03/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
--                estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Entidad del testbench.
entity RAM256x16_tb is
end entity RAM256x16_tb;

--Arquitectura del testbench.
architecture RAM256x16_tb_arch of RAM256x16_tb is
    --Declaración de la RAM a probar.
    component RAM256x16
        generic (
            WORD_LENGTH : integer := 16;
            ADDR_LENGTH : integer := 8
        );
        port (
            clk_in     : in  std_logic;
            writeEn_in : in  std_logic;
            address_in : in  std_logic_vector(ADDR_LENGTH-1 downto 0);
            data_in    : in  std_logic_vector(WORD_LENGTH-1 downto 0);
            data_out   : out std_logic_vector(WORD_LENGTH-1 downto 0)
        );
    end component RAM256x16;

    --Declaración de constantes.
    constant W_LENGTH : integer := 16;
    constant A_LENGTH : integer := 8;
    constant PERIOD   : time    := 100 ns;

    --Declaración de estímulos y señal de monitoreo.
    --Entradas a la RAM.
    signal test_clk_s     : std_logic;
    signal test_writeEn_s : std_logic;
    signal test_address_s : std_logic_vector(A_LENGTH-1 downto 0);
    signal test_dataIn_s  : std_logic_vector(W_LENGTH-1 downto 0);

    --Salida de la RAM.
    signal test_dataOut_s : std_logic_vector(W_LENGTH-1 downto 0);

    --Señal auxiliar para detener la simulación (por defecto es FALSE).
    signal stopSimulation_s : BOOLEAN := FALSE;

	--Declaración de vector de std_logic_vector para agrupar en este los valores
	--de direcciones.
	type stimulus_vec is array (integer range <>) of
								std_logic_vector(A_LENGTH-1 downto 0);

	--Declaración de un vector vec_stimulus con las direcciones de entrada.
	constant IN_REGISTER : stimulus_vec := (
		(x"00"), (x"01"), (x"02"), (x"03"),
		(x"04"), (x"05"), (x"06"), (x"07"),
		(x"08"), (x"09"), (x"0A"), (x"0B"),
		(x"0C"), (x"0D"), (x"0E"), (x"0F")
	);

begin
	--Instanciación del DUT (Device Under Test).
    RAM256x16_0 : RAM256x16
        generic map (
              WORD_LENGTH => W_LENGTH,
              ADDR_LENGTH => A_LENGTH
        )
        port map (
              clk_in     => test_clk_s,
              writeEn_in => test_writeEn_s,
              address_in => test_address_s,
              data_in    => test_dataIn_s,
              data_out   => test_dataOut_s
        );

    --Proceso de generación de clock.
    clockGeneration : process
    begin
        test_clk_s <= '0';
        wait for PERIOD/2;
        test_clk_s <= '1';
        wait for PERIOD/2;
        if (stopSimulation_s = TRUE) then
            wait;
        end if;
    end process clockGeneration;

    --Proceso de aplicación de estímulos.
    applyStimulus : process
    begin
        --Estado inicial: escritura deshailitada.
        test_writeEn_s <= '0';
        test_dataIn_s  <= (others => '0');

        --Se leen las primeras 16 double words.
        applyInputData_1: for i in IN_REGISTER'range loop
            test_address_s <= IN_REGISTER(i);
            wait for PERIOD;
        end loop applyInputData_1;

		--Se escriben las primeras 16 double words con 0xFFFF.
        test_writeEn_s <= '1';
        test_dataIn_s  <= (others => '1');
		applyInputData_2: for i in IN_REGISTER'range loop
			test_address_s <= IN_REGISTER(i);
			wait for PERIOD;
		end loop applyInputData_2;

        --Se leen las primeras 16 double words.
        test_writeEn_s <= '0';
        test_dataIn_s  <= (others => '0');
        applyInputData_3: for i in IN_REGISTER'range loop
            test_address_s <= IN_REGISTER(i);
            wait for PERIOD;
        end loop applyInputData_3;

		--Se detiene la simulación.
		stopSimulation_s <= TRUE;
   		wait;
   	end process applyStimulus;
end architecture RAM256x16_tb_arch;
