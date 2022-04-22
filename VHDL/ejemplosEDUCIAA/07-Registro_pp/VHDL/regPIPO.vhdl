--------------------------------------------------------------------------------
--- Entidad: regPIPO.
--- Descripción: Esta entidad es un registro de entrada paralela y salida
--               paralela, o PIPO ("Parallel Input Parallel Output") por su
--               sigla en inglés, que tiene una cantidad de bits de entrada y
--               salida configurable, una entrada de clock y otra sincrónica de
--               habilitación del clock, activación por flanco de clock
--               modificable y dos entradas asincrónicas, una para habilitar la
--               salida del registro y otra para resetearlo.
--
--               La entrada de mayor jerarquía es la de habilitación de la
--               salida: si esta está en 1 la salida se pone en alta
--               impedancia, sino la salida depende de las entradas restantes.
--               Si la entrada de reset está en 1 la salida se pone en 0, sino
--               esta mantiene su valor hasta que suceda cierto flanco de clock,
--               donde la salida adquiere el mismo valor que la entrada, siempre
--               y cuando la entrada de habilitación del clock esté en 1.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 16/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity regPIPO is
    generic(
            nBits           : integer := 8;
            risingEdgeClock : BOOLEAN := TRUE);
    port(
        d_in           : in  std_logic_vector(nBits-1 downto 0);
        reset_in       : in  std_logic;
        outEnable_in   : in  std_logic;
        clock_in       : in  std_logic;
        clockEnable_in : in  std_logic;
        q_out          : out std_logic_vector(nBits-1 downto 0));
end entity regPIPO;

--Declaración de la arquitectura.
architecture regPIPO_arch of regPIPO is
    --Señal auxiliar que almacena la información de salida del registro
    --suponiendo la salida habilitada.
    signal parallelData_reg : std_logic_vector(nBits-1 downto 0);
begin
    --Generación de un registro PIPO activado por flanco ascendente.
    risingEdgeRegister : if (risingEdgeClock = TRUE) generate
        --Proceso para cambiar el dato interno del registro según sus entradas.
        risingEdgeRegisterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then  --El reset es asincrónico.
                parallelData_reg <= (others => '0');
            elsif((rising_edge(clock_in)) and (clockEnable_in = '1')) then
                parallelData_reg <= d_in;
            end if;
        end process risingEdgeRegisterData;
    end generate risingEdgeRegister;

    --Generación de un registro PIPO activado por flanco descendente.
    fallingEdgeRegister : if (risingEdgeClock = FALSE) generate
        --Proceso para cambiar el dato interno del registro según sus entradas.
        fallingEdgeRegisterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then  --El reset es asincrónico.
                parallelData_reg <= (others => '0');
            elsif((falling_edge(clock_in)) and (clockEnable_in = '1')) then
                parallelData_reg <= d_in;
            end if;
        end process fallingEdgeRegisterData;
    end generate fallingEdgeRegister;

    --Asignación de la salida. El control de salida es asincrónico.
    q_out <= (others =>'Z') when outEnable_in = '0' else
             parallelData_reg;
end architecture regPIPO_arch;
