library ieee;                 --Estándar IEEE
use ieee.std_logic_1164.all;  --Biblioteca std_logic
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

-- Librerias necesarias para manejo de archivos
library std;
use std.textio.all;

-- Declarar los contenidos del package
package TestbenchUtils is

  --Procedure que instancia un clock
  procedure ClockGen (
      constant PER_CLK  : in   time;
      signal   STOP_sig : in   boolean;
      signal   OUT_CLK  : out  std_logic);

  --Procedure que realiza el pulso inicial de reset
  procedure ResetGen (
    constant RST_INITS : in  time;
    constant RST_LASTS : in  time;
    signal   RST_out   : out std_logic);

  --Procedure que asigna valores de un std_logic_vector a un std_logic
  procedure StimGen (
    constant STIM_VECTOR : in  std_logic_vector;
    constant STIM_INIT   : in  time;
    constant STIM_TIME   : in  time;
    signal   STIM_out    : out std_logic
  );

  --Funcion que transforma un bit a std_logic
  function Bit_2_StdLogic (constant input_bit : in bit)
    return std_logic;

  --Procedure que lee estimulos de un archivo y los asigna en un std_logic
  procedure StimFileGen (
    constant STIM_FILE : in  string;
    constant STIM_INIT : in  time;
    constant STIM_TIME : in  time;
    signal   STIM_out  : out std_logic
  );

end package TestbenchUtils;

-- Definir los contenidos del package
package body TestbenchUtils is

  --Procedure que instancia un clock
  procedure ClockGen (
      constant PER_CLK  : in   time;
      signal   STOP_sig : in   boolean;
      signal   OUT_CLK  : out  std_logic)
      is begin
          OUT_CLK <= '1';
          wait for PER_CLK/2;
          OUT_CLK <= '0';
          wait for PER_CLK/2;
          if (STOP_sig) then
              wait;
          end if;
  end procedure ClockGen;

  --Procedure que realiza el pulso inicial de reset
  procedure ResetGen (
    constant RST_INITS : in time;
    constant RST_LASTS : in time;
    signal   RST_out   : out std_logic)
    is begin
      wait for RST_INITS;
      RST_out <= '1';
      wait for RST_LASTS;
      RST_out <= '0';
      wait;
  end procedure ResetGen;

  --Procedure que asigna valores de un std_logic_vector a un std_logic
  procedure StimGen (
    constant STIM_VECTOR : in  std_logic_vector;
    constant STIM_INIT   : in  time;
    constant STIM_TIME   : in  time;
    signal   STIM_out    : out std_logic)
    is begin
      wait for STIM_INIT;
      stim_loop : for i in 0 to (STIM_VECTOR'length -1) loop
        STIM_out <= STIM_VECTOR(i);
        wait for STIM_TIME;
      end loop stim_loop;
    end procedure StimGen;

    --Funcion que transforma un bit a std_logic
    function Bit_2_StdLogic (constant input_bit : in bit)
      return std_logic is variable output_stdl  : std_logic;
    begin
        if(input_bit = '0')then
            output_stdl := '0';
        else
            output_stdl := '1';
        end if;
        return output_stdl;
      end function Bit_2_StdLogic;

    --Procedure que lee estimulos de un archivo y los asigna en un std_logic
    procedure StimFileGen (
      constant STIM_FILE : in  string;
      constant STIM_INIT : in  time;
      constant STIM_TIME : in  time;
      signal   STIM_out  : out std_logic) is

    --Variables internas
    file     stimulus     : text;
    variable in_line      : line;
    variable data_in_bit  : bit;

    begin

      wait for STIM_INIT;

      file_open(stimulus,STIM_FILE,read_mode);
      read_line_loop : while (not endfile(stimulus)) loop

        --Leer una linea
        readline(stimulus,in_line);

        --Mientras no se haya leido toda la linea
        read_bit_loop : while (not (in_line'length = 0)) loop

            --Leer un bit y guardar en data_in_bit
            read(in_line, data_in_bit);

            --Transformar bit en std_logic
            STIM_out <= Bit_2_StdLogic(data_in_bit);

            --Esperar un tiempo
            wait for STIM_TIME;

        end loop read_bit_loop;

      end loop read_line_loop;

    end procedure StimFileGen;

end package body TestbenchUtils;

