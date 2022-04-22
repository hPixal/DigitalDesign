ghdl -a parametersPackage.vhd
ghdl -a LUTPackage.vhd
ghdl -a signalLUT.vhd
ghdl -a nco.vhd
ghdl -a -fsynopsys ncoLUT_tb.vhd
ghdl -e -fsynopsys ncoLUT_tb
#./ncolut_tb --wave=nco_lut_tb_wave.ghw
#gtkwave nco_lut_tb_wave.ghw
ghdl -r -fsynopsys ncoLUT_tb --vcd=test.vcd
gtkwave test.vcd
#rm *.o
rm *.cf
#rm *.ghw
rm *.vcd
#rm ncoLUT_tb
