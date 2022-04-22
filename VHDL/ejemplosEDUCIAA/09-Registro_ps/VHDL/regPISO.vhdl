--------------------------------------------------------------------------------
--- Entidad: regPISO.
--- Descripción: Esta entidad es un registro de entrada paralela y salida
--               serie, o PISO ("Parallel Input Serial Output") por su sigla en
--               inglés, que tiene una cantidad de bits de entrada configurable
--               y 1 bit de salida, una entrada para habilitar la carga de
--               datos en paralelo, una entrada de clock y otra de habilitación
--               del clock, activación por flanco de clock modificable y dos
--               entradas asincrónicas, una para habilitar la salida del
--               registro y otra para resetearlo.
--
--               La entrada de mayor jerarquía es la de habilitación de la
--               salida: si esta está en 1 la salida se pone en alta
--               impedancia, sino la salida depende de las entradas restantes.
--               Si la entrada de reset está en 1 la salida se pone en 0 como
--               así también los datos en serie que internamente se van
--               desplazando. De lo contrario, si esta entrada está en 0 como
--               así también la de carga, la salida mantiene su valor,
--               "expulsando" uno a uno los datos serie internos con cada flanco
--               de clock ascendente o descendente, según la configuración. Si
--               la entrada de carga está en 1, no se "expulsan" datos por la
--               salida y se cargan en paralelo los datos de entrada de forma
--               sincrónica.
--
--               Este diseño está basado en el IC 74HC165.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 16/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity regPISO is
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
            q_out          : out std_logic);
end entity regPISO;

--Declaración de la arquitectura.
architecture regPISO_arch of regPISO is
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

    --Asignación de la salida. El control de salida es asincrónico.
    q_out <= 'Z' when outEnable_in = '0' else
             serialData_reg(nBits-1);
end architecture regPISO_arch;
