--------------------------------------------------------------------------------
--- Entidad: regPISOWithExtraOutput.
--- Descripción: Esta entidad es un registro de entrada paralela y salida
--               serie, o PISO ("Parallel Input Serial Output") por su sigla en
--               inglés. Este diseño es prácticamente igual al de la entidad
--               "regPISO", con la diferencia que incluye la salida
--               "storedData_out" para presentar la información almacenada
--               intermanemte. Si las salidas no están habilitadas,
--               storedData_out se pone en alta impedancia.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 16/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity regPISOWithExtraOutput is
    generic(
            nBits           : integer := 8;
            risingEdgeClock : BOOLEAN := TRUE);
    port(
        d_in           : in  std_logic_vector(nBits-1 downto 0);
        load_in        : in  std_logic;
        reset_in       : in  std_logic;
        outEnable_in   : in  std_logic;
        clock_in       : in  std_logic;
        clockEnable_in : in  std_logic;
        q_out          : out std_logic;
        storedData_out : out std_logic_vector(nBits-1 downto 0));
end entity regPISOWithExtraOutput;

--Declaración de la arquitectura.
architecture regPISOWithExtraOutput_arch of regPISOWithExtraOutput is
    --Señal auxiliar que almacena la información serial interna del registro.
    signal serialData_reg : std_logic_vector(nBits-1 downto 0);
begin
    --Generación de un registro PISO activado por flanco ascendente.
    risingEdgeRegister : if (risingEdgeClock = TRUE) generate
        --Proceso para cambiar el dato interno del registro según sus entradas.
        risingEdgeRegisterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then  --El reset es asincrónico.
                serialData_reg <= (others => '0');
            elsif((rising_edge(clock_in)) and (clockEnable_in = '1')) then
                if(load_in = '1') then
                    serialData_reg <= d_in;
                else
                    serialData_reg <= serialData_reg(nBits-2 downto 0) & '0';
                end if;
            end if;
        end process risingEdgeRegisterData;
    end generate risingEdgeRegister;

    --Generación de un registro PISO activado por flanco descendente.
    fallingEdgeRegister : if (risingEdgeClock = FALSE) generate
        --Proceso para cambiar el dato interno del registro según sus entradas.
        fallingEdgeRegisterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then  --El reset es asincrónico.
                serialData_reg <= (others => '0');
            elsif((falling_edge(clock_in)) and (clockEnable_in = '1')) then
                if(load_in = '1') then
                    serialData_reg <= d_in;
                else
                    serialData_reg <= serialData_reg(nBits-2 downto 0) & '0';
                end if;
            end if;
        end process fallingEdgeRegisterData;
    end generate fallingEdgeRegister;

    --Asignación de las salidas. El control de salida es asincrónico.
    q_out <= 'Z' when outEnable_in = '0' else
             serialData_reg(nBits-1);

    storedData_out <= (others => 'Z') when outEnable_in = '0' else
                      serialData_reg;
end architecture regPISOWithExtraOutput_arch;
