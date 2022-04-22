ghdl -a utils.vhdl
ghdl -a Rxunit.vhdl
ghdl -a Txunit.vhdl
ghdl -a miniuart.vhdl
ghdl -a TopCOMPort.vhdl
ghdl -a -fsynopsys TopCOMPort_tb.vhdl
ghdl -e -fsynopsys TopCOMPort_tb
ghdl -r -fsynopsys TopCOMPort_tb --vcd=test.vcd
gtkwave test.vcd
rm *.cf
rm *.vcd
rm *.ghw
