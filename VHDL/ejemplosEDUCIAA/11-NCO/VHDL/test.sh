ghdl -a parametersPackage.vhd
ghdl -a nco.vhd
ghdl -a -fsynopsys nco_tb.vhd
ghdl -e -fsynopsys nco_tb
#./nco_tb --wave=nco_tb_wave.ghw
#gtkwave nco_tb_wave.ghw
ghdl -r -fsynopsys nco_tb --vcd=test.vcd
gtkwave test.vcd
#rm *.o
rm *.cf
#rm *.ghw
rm *.vcd
#rm nco_tb
