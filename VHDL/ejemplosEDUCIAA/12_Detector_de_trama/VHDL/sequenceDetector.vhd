---------------------------------------------------------------------------
---- Entity:  sequenceDetector                                         ----
---- Description:  Detect a serial sequence                            ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision:  13/06/2020                                        ----
---- Dependencies:                                                     ----
----	IEEE.std_logic_1164                                              ----
----	IEEE.numeric_std                                                 ----
----	                                                                 ----
----	                                                                 ----
----                                                                   ----
----                                                                   ----
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sequenceDetector is
    generic (nBits : integer range 4 to 64 := 8);
    port(
		    clk_in : in std_logic;
		    rst_in_n : in std_logic;
		    serial_in : in std_logic;
				seq_in : in std_logic_vector(nBits-1 downto 0);
		    detection_out : out std_logic);
end entity sequenceDetector;

architecture sequenceDetector_arch of sequenceDetector is
    signal serialInput_reg : unsigned(nBits-1 downto 0);
		signal sequenceInput_reg : unsigned(nBits-1 downto 0);
begin

    --Registro serie-paralelo
    shift_in:
    process(clk_in)
    begin
		    if (rising_edge(clk_in)) then
			      if rst_in_n = '0' then
				        serialInput_reg <= (others => '0');
		        else
				        serialInput_reg <= unsigned(serial_in & serialInput_reg(nBits-1 downto 1));
			      end if;
		    end if;
    end process shift_in;

    --Registro de entrada para la señal seq_in
    register_input_seq:
		process(clk_in)
		begin
		    if (rising_edge(clk_in)) then
				    if rst_in_n = '0' then
						    sequenceInput_reg <= (others => '1');
				    else
						    sequenceInput_reg <= unsigned(seq_in);
				    end if;
		    end if;
		end process register_input_seq;

    --Comparador
		compare:
		process(clk_in)
		begin
		    if (rising_edge(clk_in)) then
			      if rst_in_n = '0' then
						    detection_out <= '0';
				    else
						    if(serialInput_reg = sequenceInput_reg) then
                    detection_out <= '1';
								else
                    detection_out <= '0';
								end if;
				    end if;
		    end if;
		end process compare;




end architecture sequenceDetector_arch;
