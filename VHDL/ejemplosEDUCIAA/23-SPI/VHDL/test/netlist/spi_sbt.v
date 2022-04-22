// ******************************************************************************

// iCEcube Netlister

// Version:            2017.08.27940

// Build Date:         Sep 11 2017 17:30:03

// File Generated:     Aug 23 2020 10:31:11

// Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

// Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

// ******************************************************************************

// Verilog file for cell "spi" view "INTERFACE"

module spi (
    data_out,
    data_in,
    sclk_out,
    rst_in_n,
    drdy_in,
    cs_out,
    write_in,
    shifting_out,
    serialD_in,
    serialD_out,
    dataReceived_out,
    clk_in);

    output [7:0] data_out;
    input [7:0] data_in;
    output sclk_out;
    input rst_in_n;
    input drdy_in;
    output cs_out;
    input write_in;
    output shifting_out;
    input serialD_in;
    output serialD_out;
    output dataReceived_out;
    input clk_in;

    wire N__2502;
    wire N__2501;
    wire N__2500;
    wire N__2491;
    wire N__2490;
    wire N__2489;
    wire N__2482;
    wire N__2481;
    wire N__2480;
    wire N__2473;
    wire N__2472;
    wire N__2471;
    wire N__2464;
    wire N__2463;
    wire N__2462;
    wire N__2455;
    wire N__2454;
    wire N__2453;
    wire N__2446;
    wire N__2445;
    wire N__2444;
    wire N__2437;
    wire N__2436;
    wire N__2435;
    wire N__2428;
    wire N__2427;
    wire N__2426;
    wire N__2419;
    wire N__2418;
    wire N__2417;
    wire N__2410;
    wire N__2409;
    wire N__2408;
    wire N__2401;
    wire N__2400;
    wire N__2399;
    wire N__2392;
    wire N__2391;
    wire N__2390;
    wire N__2383;
    wire N__2382;
    wire N__2381;
    wire N__2374;
    wire N__2373;
    wire N__2372;
    wire N__2365;
    wire N__2364;
    wire N__2363;
    wire N__2356;
    wire N__2355;
    wire N__2354;
    wire N__2347;
    wire N__2346;
    wire N__2345;
    wire N__2338;
    wire N__2337;
    wire N__2336;
    wire N__2329;
    wire N__2328;
    wire N__2327;
    wire N__2320;
    wire N__2319;
    wire N__2318;
    wire N__2311;
    wire N__2310;
    wire N__2309;
    wire N__2302;
    wire N__2301;
    wire N__2300;
    wire N__2293;
    wire N__2292;
    wire N__2291;
    wire N__2284;
    wire N__2283;
    wire N__2282;
    wire N__2275;
    wire N__2274;
    wire N__2273;
    wire N__2256;
    wire N__2255;
    wire N__2254;
    wire N__2251;
    wire N__2248;
    wire N__2245;
    wire N__2238;
    wire N__2237;
    wire N__2236;
    wire N__2233;
    wire N__2228;
    wire N__2223;
    wire N__2222;
    wire N__2221;
    wire N__2218;
    wire N__2215;
    wire N__2212;
    wire N__2207;
    wire N__2202;
    wire N__2201;
    wire N__2200;
    wire N__2197;
    wire N__2194;
    wire N__2191;
    wire N__2184;
    wire N__2183;
    wire N__2182;
    wire N__2181;
    wire N__2180;
    wire N__2179;
    wire N__2178;
    wire N__2177;
    wire N__2176;
    wire N__2159;
    wire N__2158;
    wire N__2157;
    wire N__2154;
    wire N__2151;
    wire N__2148;
    wire N__2145;
    wire N__2136;
    wire N__2133;
    wire N__2132;
    wire N__2131;
    wire N__2130;
    wire N__2129;
    wire N__2128;
    wire N__2127;
    wire N__2126;
    wire N__2117;
    wire N__2108;
    wire N__2103;
    wire N__2102;
    wire N__2101;
    wire N__2098;
    wire N__2093;
    wire N__2088;
    wire N__2087;
    wire N__2084;
    wire N__2083;
    wire N__2080;
    wire N__2075;
    wire N__2070;
    wire N__2069;
    wire N__2068;
    wire N__2065;
    wire N__2062;
    wire N__2057;
    wire N__2052;
    wire N__2051;
    wire N__2050;
    wire N__2047;
    wire N__2042;
    wire N__2037;
    wire N__2034;
    wire N__2031;
    wire N__2028;
    wire N__2025;
    wire N__2022;
    wire N__2019;
    wire N__2016;
    wire N__2013;
    wire N__2012;
    wire N__2009;
    wire N__2006;
    wire N__2005;
    wire N__2004;
    wire N__2003;
    wire N__2002;
    wire N__2001;
    wire N__2000;
    wire N__1999;
    wire N__1996;
    wire N__1993;
    wire N__1990;
    wire N__1983;
    wire N__1978;
    wire N__1975;
    wire N__1962;
    wire N__1959;
    wire N__1956;
    wire N__1953;
    wire N__1950;
    wire N__1949;
    wire N__1948;
    wire N__1947;
    wire N__1946;
    wire N__1943;
    wire N__1940;
    wire N__1935;
    wire N__1932;
    wire N__1923;
    wire N__1922;
    wire N__1921;
    wire N__1920;
    wire N__1913;
    wire N__1910;
    wire N__1905;
    wire N__1902;
    wire N__1901;
    wire N__1900;
    wire N__1899;
    wire N__1898;
    wire N__1897;
    wire N__1896;
    wire N__1895;
    wire N__1894;
    wire N__1893;
    wire N__1890;
    wire N__1889;
    wire N__1888;
    wire N__1863;
    wire N__1860;
    wire N__1857;
    wire N__1856;
    wire N__1855;
    wire N__1848;
    wire N__1845;
    wire N__1842;
    wire N__1841;
    wire N__1840;
    wire N__1839;
    wire N__1838;
    wire N__1837;
    wire N__1836;
    wire N__1835;
    wire N__1834;
    wire N__1815;
    wire N__1812;
    wire N__1809;
    wire N__1806;
    wire N__1803;
    wire N__1800;
    wire N__1797;
    wire N__1794;
    wire N__1791;
    wire N__1788;
    wire N__1785;
    wire N__1782;
    wire N__1781;
    wire N__1778;
    wire N__1777;
    wire N__1774;
    wire N__1771;
    wire N__1768;
    wire N__1761;
    wire N__1758;
    wire N__1757;
    wire N__1756;
    wire N__1755;
    wire N__1754;
    wire N__1751;
    wire N__1744;
    wire N__1741;
    wire N__1734;
    wire N__1731;
    wire N__1730;
    wire N__1729;
    wire N__1728;
    wire N__1725;
    wire N__1722;
    wire N__1719;
    wire N__1716;
    wire N__1707;
    wire N__1706;
    wire N__1705;
    wire N__1698;
    wire N__1695;
    wire N__1692;
    wire N__1689;
    wire N__1686;
    wire N__1685;
    wire N__1684;
    wire N__1677;
    wire N__1674;
    wire N__1673;
    wire N__1670;
    wire N__1667;
    wire N__1662;
    wire N__1659;
    wire N__1656;
    wire N__1653;
    wire N__1650;
    wire N__1647;
    wire N__1644;
    wire N__1641;
    wire N__1638;
    wire N__1635;
    wire N__1632;
    wire N__1629;
    wire N__1626;
    wire N__1623;
    wire N__1620;
    wire N__1617;
    wire N__1614;
    wire N__1611;
    wire N__1608;
    wire N__1605;
    wire N__1602;
    wire N__1599;
    wire N__1596;
    wire N__1593;
    wire N__1590;
    wire N__1587;
    wire N__1584;
    wire N__1581;
    wire N__1580;
    wire N__1577;
    wire N__1574;
    wire N__1573;
    wire N__1570;
    wire N__1567;
    wire N__1564;
    wire N__1557;
    wire N__1554;
    wire N__1551;
    wire N__1548;
    wire N__1545;
    wire N__1542;
    wire N__1539;
    wire N__1536;
    wire N__1533;
    wire N__1530;
    wire N__1527;
    wire N__1524;
    wire N__1521;
    wire N__1518;
    wire N__1515;
    wire N__1512;
    wire N__1509;
    wire N__1506;
    wire N__1503;
    wire N__1500;
    wire N__1497;
    wire N__1494;
    wire N__1491;
    wire N__1490;
    wire N__1489;
    wire N__1486;
    wire N__1483;
    wire N__1480;
    wire N__1473;
    wire N__1472;
    wire N__1471;
    wire N__1470;
    wire N__1465;
    wire N__1462;
    wire N__1459;
    wire N__1452;
    wire N__1449;
    wire N__1448;
    wire N__1445;
    wire N__1442;
    wire N__1437;
    wire N__1434;
    wire N__1433;
    wire N__1430;
    wire N__1427;
    wire N__1426;
    wire N__1423;
    wire N__1420;
    wire N__1417;
    wire N__1410;
    wire N__1409;
    wire N__1406;
    wire N__1403;
    wire N__1402;
    wire N__1399;
    wire N__1396;
    wire N__1393;
    wire N__1386;
    wire N__1383;
    wire N__1380;
    wire N__1377;
    wire N__1374;
    wire N__1371;
    wire N__1370;
    wire N__1367;
    wire N__1364;
    wire N__1359;
    wire N__1358;
    wire N__1355;
    wire N__1352;
    wire N__1347;
    wire N__1346;
    wire N__1343;
    wire N__1340;
    wire N__1335;
    wire N__1332;
    wire N__1329;
    wire N__1326;
    wire N__1323;
    wire N__1320;
    wire N__1319;
    wire N__1316;
    wire N__1313;
    wire N__1308;
    wire N__1307;
    wire N__1304;
    wire N__1301;
    wire N__1296;
    wire N__1295;
    wire N__1292;
    wire N__1289;
    wire N__1284;
    wire N__1283;
    wire N__1280;
    wire N__1277;
    wire N__1272;
    wire N__1269;
    wire N__1266;
    wire N__1263;
    wire N__1260;
    wire N__1257;
    wire N__1254;
    wire N__1251;
    wire N__1248;
    wire N__1245;
    wire N__1242;
    wire N__1239;
    wire N__1236;
    wire N__1233;
    wire N__1230;
    wire N__1227;
    wire N__1224;
    wire N__1221;
    wire N__1218;
    wire N__1215;
    wire N__1212;
    wire N__1209;
    wire N__1206;
    wire N__1203;
    wire N__1200;
    wire N__1197;
    wire N__1194;
    wire N__1191;
    wire N__1188;
    wire N__1185;
    wire N__1182;
    wire N__1179;
    wire N__1176;
    wire N__1173;
    wire N__1170;
    wire N__1167;
    wire N__1164;
    wire N__1161;
    wire N__1158;
    wire N__1155;
    wire N__1152;
    wire N__1149;
    wire N__1146;
    wire N__1143;
    wire N__1140;
    wire N__1137;
    wire N__1134;
    wire N__1131;
    wire N__1128;
    wire N__1125;
    wire N__1122;
    wire N__1119;
    wire N__1116;
    wire N__1113;
    wire N__1110;
    wire N__1107;
    wire N__1104;
    wire N__1101;
    wire N__1098;
    wire N__1095;
    wire N__1092;
    wire N__1089;
    wire N__1086;
    wire N__1083;
    wire N__1080;
    wire N__1077;
    wire N__1074;
    wire N__1071;
    wire N__1068;
    wire N__1065;
    wire N__1062;
    wire N__1059;
    wire N__1056;
    wire N__1053;
    wire N__1050;
    wire N__1047;
    wire N__1044;
    wire N__1041;
    wire N__1038;
    wire N__1035;
    wire N__1032;
    wire N__1029;
    wire GNDG0;
    wire VCCG0;
    wire cs_out_c;
    wire rst_in_n_c;
    wire rst_in_n_c_i;
    wire N_12_i_sx_cascade_;
    wire INVpulseCounterTC_sC_net;
    wire shiftBitsIn_se_0_i;
    wire pulseCounterTC_sZ0;
    wire sclk_out_c;
    wire data_out_c_1;
    wire data_out_c_0;
    wire data_out_c_5;
    wire data_out_c_6;
    wire data_out_c_4;
    wire data_out_c_7;
    wire data_out_c_3;
    wire data_out_c_2;
    wire shift_regZ0Z_2;
    wire shift_regZ0Z_3;
    wire shift_regZ0Z_4;
    wire serialD_in_c;
    wire shift_regZ0Z_0;
    wire shift_regZ0Z_1;
    wire shift_regZ0Z_5;
    wire shift_regZ0Z_6;
    wire data_in_c_1;
    wire din_regZ0Z_1;
    wire data_in_c_6;
    wire din_regZ0Z_6;
    wire data_in_c_4;
    wire din_regZ0Z_4;
    wire data_in_c_7;
    wire din_regZ0Z_7;
    wire data_in_c_2;
    wire din_regZ0Z_2;
    wire pulseCounter_cntZ0Z_1;
    wire pulseCounter_cntZ0Z_0;
    wire pulseCounter_cnt_r_sx_2_cascade_;
    wire pulseCounter_cntZ0Z_2;
    wire INVpulseCounter_cnt_2C_net;
    wire dataReceived_out_c;
    wire drdy_in_c;
    wire currentState_sZ0Z_1;
    wire currentState_s_fastZ0Z_1;
    wire currentState_s_fastZ0Z_2;
    wire write_in_c;
    wire currentState_sZ0Z_6;
    wire shift_regZ0Z_7;
    wire serialD_out_c;
    wire INVserialD_outZ0C_net;
    wire data_in_c_3;
    wire din_regZ0Z_3;
    wire data_in_c_0;
    wire din_regZ0Z_0;
    wire data_in_c_5;
    wire din_regZ0Z_5;
    wire currentState_sZ0Z_5;
    wire bfn_3_9_0_;
    wire shiftBitsIn_s_cry_0;
    wire shiftBitsIn_s_cry_1;
    wire shiftBitsIn_s_cry_2;
    wire shiftBitsIn_s_cry_3;
    wire shiftBitsIn_s_cry_4;
    wire shiftBitsIn_s_cry_5;
    wire shiftBitsIn_s_cry_6;
    wire shiftBitsIn_sZ0Z_2;
    wire shiftBitsIn_sZ0Z_1;
    wire shiftBitsIn_sZ0Z_3;
    wire shiftBitsIn_sZ0Z_4;
    wire currentState_sZ0Z_4;
    wire N_30_mux_i_0_a3_4_cascade_;
    wire N_14;
    wire shiftBitsIn_sZ0Z_7;
    wire shiftBitsIn_sZ0Z_6;
    wire shiftBitsIn_sZ0Z_0;
    wire shiftBitsIn_sZ0Z_5;
    wire N_30_mux_i_0_a3_5;
    wire dataReceived_s_0_sqmuxa_0_a2_1;
    wire shifting_out_c;
    wire dataReceived_s_0_sqmuxa_0_a2_4_4;
    wire currentState_sZ0Z_3;
    wire dataReceived_sZ0;
    wire _gnd_net_;
    wire clk_in_c_g;
    wire shiftBitsIn_se_0_i_g;
    wire rst_in_n_c_i_g;

    PRE_IO_GBUF clk_in_ibuf_gb_io_preiogbuf (
            .PADSIGNALTOGLOBALBUFFER(N__2500),
            .GLOBALBUFFEROUTPUT(clk_in_c_g));
    defparam clk_in_ibuf_gb_io_iopad.PULLUP=1'b0;
    defparam clk_in_ibuf_gb_io_iopad.IO_STANDARD="SB_LVCMOS";
    IO_PAD clk_in_ibuf_gb_io_iopad (
            .OE(N__2502),
            .DIN(N__2501),
            .DOUT(N__2500),
            .PACKAGEPIN(clk_in));
    defparam clk_in_ibuf_gb_io_preio.NEG_TRIGGER=1'b0;
    defparam clk_in_ibuf_gb_io_preio.PIN_TYPE=6'b000001;
    PRE_IO clk_in_ibuf_gb_io_preio (
            .PADOEN(N__2502),
            .PADOUT(N__2501),
            .PADIN(N__2500),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_3_iopad (
            .OE(N__2491),
            .DIN(N__2490),
            .DOUT(N__2489),
            .PACKAGEPIN(data_out[3]));
    defparam data_out_obuf_3_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_3_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_3_preio (
            .PADOEN(N__2491),
            .PADOUT(N__2490),
            .PADIN(N__2489),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1128),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_7_iopad (
            .OE(N__2482),
            .DIN(N__2481),
            .DOUT(N__2480),
            .PACKAGEPIN(data_in[7]));
    defparam data_in_ibuf_7_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_7_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_7_preio (
            .PADOEN(N__2482),
            .PADOUT(N__2481),
            .PADIN(N__2480),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_7),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD serialD_in_ibuf_iopad (
            .OE(N__2473),
            .DIN(N__2472),
            .DOUT(N__2471),
            .PACKAGEPIN(serialD_in));
    defparam serialD_in_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam serialD_in_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO serialD_in_ibuf_preio (
            .PADOEN(N__2473),
            .PADOUT(N__2472),
            .PADIN(N__2471),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(serialD_in_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD drdy_in_ibuf_iopad (
            .OE(N__2464),
            .DIN(N__2463),
            .DOUT(N__2462),
            .PACKAGEPIN(drdy_in));
    defparam drdy_in_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam drdy_in_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO drdy_in_ibuf_preio (
            .PADOEN(N__2464),
            .PADOUT(N__2463),
            .PADIN(N__2462),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(drdy_in_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_7_iopad (
            .OE(N__2455),
            .DIN(N__2454),
            .DOUT(N__2453),
            .PACKAGEPIN(data_out[7]));
    defparam data_out_obuf_7_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_7_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_7_preio (
            .PADOEN(N__2455),
            .PADOUT(N__2454),
            .PADIN(N__2453),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1143),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_3_iopad (
            .OE(N__2446),
            .DIN(N__2445),
            .DOUT(N__2444),
            .PACKAGEPIN(data_in[3]));
    defparam data_in_ibuf_3_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_3_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_3_preio (
            .PADOEN(N__2446),
            .PADOUT(N__2445),
            .PADIN(N__2444),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_3),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD cs_out_obuf_iopad (
            .OE(N__2437),
            .DIN(N__2436),
            .DOUT(N__2435),
            .PACKAGEPIN(cs_out));
    defparam cs_out_obuf_preio.NEG_TRIGGER=1'b0;
    defparam cs_out_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO cs_out_obuf_preio (
            .PADOEN(N__2437),
            .PADOUT(N__2436),
            .PADIN(N__2435),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1101),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_6_iopad (
            .OE(N__2428),
            .DIN(N__2427),
            .DOUT(N__2426),
            .PACKAGEPIN(data_in[6]));
    defparam data_in_ibuf_6_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_6_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_6_preio (
            .PADOEN(N__2428),
            .PADOUT(N__2427),
            .PADIN(N__2426),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_6),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_0_iopad (
            .OE(N__2419),
            .DIN(N__2418),
            .DOUT(N__2417),
            .PACKAGEPIN(data_out[0]));
    defparam data_out_obuf_0_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_0_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_0_preio (
            .PADOEN(N__2419),
            .PADOUT(N__2418),
            .PADIN(N__2417),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1212),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_2_iopad (
            .OE(N__2410),
            .DIN(N__2409),
            .DOUT(N__2408),
            .PACKAGEPIN(data_in[2]));
    defparam data_in_ibuf_2_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_2_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_2_preio (
            .PADOEN(N__2410),
            .PADOUT(N__2409),
            .PADIN(N__2408),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_2),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_0_iopad (
            .OE(N__2401),
            .DIN(N__2400),
            .DOUT(N__2399),
            .PACKAGEPIN(data_in[0]));
    defparam data_in_ibuf_0_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_0_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_0_preio (
            .PADOEN(N__2401),
            .PADOUT(N__2400),
            .PADIN(N__2399),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_0),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    defparam rst_in_n_ibuf_iopad.PULLUP=1'b0;
    defparam rst_in_n_ibuf_iopad.IO_STANDARD="SB_LVCMOS";
    IO_PAD rst_in_n_ibuf_iopad (
            .OE(N__2392),
            .DIN(N__2391),
            .DOUT(N__2390),
            .PACKAGEPIN(rst_in_n));
    defparam rst_in_n_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam rst_in_n_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO rst_in_n_ibuf_preio (
            .PADOEN(N__2392),
            .PADOUT(N__2391),
            .PADIN(N__2390),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(rst_in_n_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_4_iopad (
            .OE(N__2383),
            .DIN(N__2382),
            .DOUT(N__2381),
            .PACKAGEPIN(data_out[4]));
    defparam data_out_obuf_4_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_4_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_4_preio (
            .PADOEN(N__2383),
            .PADOUT(N__2382),
            .PADIN(N__2381),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1161),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD sclk_out_obuf_iopad (
            .OE(N__2374),
            .DIN(N__2373),
            .DOUT(N__2372),
            .PACKAGEPIN(sclk_out));
    defparam sclk_out_obuf_preio.NEG_TRIGGER=1'b0;
    defparam sclk_out_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO sclk_out_obuf_preio (
            .PADOEN(N__2374),
            .PADOUT(N__2373),
            .PADIN(N__2372),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1035),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_1_iopad (
            .OE(N__2365),
            .DIN(N__2364),
            .DOUT(N__2363),
            .PACKAGEPIN(data_out[1]));
    defparam data_out_obuf_1_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_1_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_1_preio (
            .PADOEN(N__2365),
            .PADOUT(N__2364),
            .PADIN(N__2363),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1227),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_5_iopad (
            .OE(N__2356),
            .DIN(N__2355),
            .DOUT(N__2354),
            .PACKAGEPIN(data_in[5]));
    defparam data_in_ibuf_5_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_5_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_5_preio (
            .PADOEN(N__2356),
            .PADOUT(N__2355),
            .PADIN(N__2354),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_5),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD write_in_ibuf_iopad (
            .OE(N__2347),
            .DIN(N__2346),
            .DOUT(N__2345),
            .PACKAGEPIN(write_in));
    defparam write_in_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam write_in_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO write_in_ibuf_preio (
            .PADOEN(N__2347),
            .PADOUT(N__2346),
            .PADIN(N__2345),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(write_in_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_5_iopad (
            .OE(N__2338),
            .DIN(N__2337),
            .DOUT(N__2336),
            .PACKAGEPIN(data_out[5]));
    defparam data_out_obuf_5_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_5_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_5_preio (
            .PADOEN(N__2338),
            .PADOUT(N__2337),
            .PADIN(N__2336),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1197),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD shifting_out_obuf_iopad (
            .OE(N__2329),
            .DIN(N__2328),
            .DOUT(N__2327),
            .PACKAGEPIN(shifting_out));
    defparam shifting_out_obuf_preio.NEG_TRIGGER=1'b0;
    defparam shifting_out_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO shifting_out_obuf_preio (
            .PADOEN(N__2329),
            .PADOUT(N__2328),
            .PADIN(N__2327),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__2025),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_1_iopad (
            .OE(N__2320),
            .DIN(N__2319),
            .DOUT(N__2318),
            .PACKAGEPIN(data_in[1]));
    defparam data_in_ibuf_1_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_1_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_1_preio (
            .PADOEN(N__2320),
            .PADOUT(N__2319),
            .PADIN(N__2318),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_1),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD dataReceived_out_obuf_iopad (
            .OE(N__2311),
            .DIN(N__2310),
            .DOUT(N__2309),
            .PACKAGEPIN(dataReceived_out));
    defparam dataReceived_out_obuf_preio.NEG_TRIGGER=1'b0;
    defparam dataReceived_out_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO dataReceived_out_obuf_preio (
            .PADOEN(N__2311),
            .PADOUT(N__2310),
            .PADIN(N__2309),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1437),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_2_iopad (
            .OE(N__2302),
            .DIN(N__2301),
            .DOUT(N__2300),
            .PACKAGEPIN(data_out[2]));
    defparam data_out_obuf_2_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_2_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_2_preio (
            .PADOEN(N__2302),
            .PADOUT(N__2301),
            .PADIN(N__2300),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1116),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_in_ibuf_4_iopad (
            .OE(N__2293),
            .DIN(N__2292),
            .DOUT(N__2291),
            .PACKAGEPIN(data_in[4]));
    defparam data_in_ibuf_4_preio.NEG_TRIGGER=1'b0;
    defparam data_in_ibuf_4_preio.PIN_TYPE=6'b000001;
    PRE_IO data_in_ibuf_4_preio (
            .PADOEN(N__2293),
            .PADOUT(N__2292),
            .PADIN(N__2291),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(data_in_c_4),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD serialD_out_obuf_iopad (
            .OE(N__2284),
            .DIN(N__2283),
            .DOUT(N__2282),
            .PACKAGEPIN(serialD_out));
    defparam serialD_out_obuf_preio.NEG_TRIGGER=1'b0;
    defparam serialD_out_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO serialD_out_obuf_preio (
            .PADOEN(N__2284),
            .PADOUT(N__2283),
            .PADIN(N__2282),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1662),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD data_out_obuf_6_iopad (
            .OE(N__2275),
            .DIN(N__2274),
            .DOUT(N__2273),
            .PACKAGEPIN(data_out[6]));
    defparam data_out_obuf_6_preio.NEG_TRIGGER=1'b0;
    defparam data_out_obuf_6_preio.PIN_TYPE=6'b011001;
    PRE_IO data_out_obuf_6_preio (
            .PADOEN(N__2275),
            .PADOUT(N__2274),
            .PADIN(N__2273),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__1179),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    InMux I__502 (
            .O(N__2256),
            .I(N__2251));
    InMux I__501 (
            .O(N__2255),
            .I(N__2248));
    InMux I__500 (
            .O(N__2254),
            .I(N__2245));
    LocalMux I__499 (
            .O(N__2251),
            .I(shiftBitsIn_sZ0Z_2));
    LocalMux I__498 (
            .O(N__2248),
            .I(shiftBitsIn_sZ0Z_2));
    LocalMux I__497 (
            .O(N__2245),
            .I(shiftBitsIn_sZ0Z_2));
    InMux I__496 (
            .O(N__2238),
            .I(N__2233));
    InMux I__495 (
            .O(N__2237),
            .I(N__2228));
    InMux I__494 (
            .O(N__2236),
            .I(N__2228));
    LocalMux I__493 (
            .O(N__2233),
            .I(shiftBitsIn_sZ0Z_1));
    LocalMux I__492 (
            .O(N__2228),
            .I(shiftBitsIn_sZ0Z_1));
    CascadeMux I__491 (
            .O(N__2223),
            .I(N__2218));
    CascadeMux I__490 (
            .O(N__2222),
            .I(N__2215));
    InMux I__489 (
            .O(N__2221),
            .I(N__2212));
    InMux I__488 (
            .O(N__2218),
            .I(N__2207));
    InMux I__487 (
            .O(N__2215),
            .I(N__2207));
    LocalMux I__486 (
            .O(N__2212),
            .I(shiftBitsIn_sZ0Z_3));
    LocalMux I__485 (
            .O(N__2207),
            .I(shiftBitsIn_sZ0Z_3));
    InMux I__484 (
            .O(N__2202),
            .I(N__2197));
    InMux I__483 (
            .O(N__2201),
            .I(N__2194));
    InMux I__482 (
            .O(N__2200),
            .I(N__2191));
    LocalMux I__481 (
            .O(N__2197),
            .I(shiftBitsIn_sZ0Z_4));
    LocalMux I__480 (
            .O(N__2194),
            .I(shiftBitsIn_sZ0Z_4));
    LocalMux I__479 (
            .O(N__2191),
            .I(shiftBitsIn_sZ0Z_4));
    InMux I__478 (
            .O(N__2184),
            .I(N__2159));
    InMux I__477 (
            .O(N__2183),
            .I(N__2159));
    InMux I__476 (
            .O(N__2182),
            .I(N__2159));
    InMux I__475 (
            .O(N__2181),
            .I(N__2159));
    InMux I__474 (
            .O(N__2180),
            .I(N__2159));
    InMux I__473 (
            .O(N__2179),
            .I(N__2159));
    InMux I__472 (
            .O(N__2178),
            .I(N__2159));
    InMux I__471 (
            .O(N__2177),
            .I(N__2159));
    InMux I__470 (
            .O(N__2176),
            .I(N__2154));
    LocalMux I__469 (
            .O(N__2159),
            .I(N__2151));
    InMux I__468 (
            .O(N__2158),
            .I(N__2148));
    InMux I__467 (
            .O(N__2157),
            .I(N__2145));
    LocalMux I__466 (
            .O(N__2154),
            .I(currentState_sZ0Z_4));
    Odrv4 I__465 (
            .O(N__2151),
            .I(currentState_sZ0Z_4));
    LocalMux I__464 (
            .O(N__2148),
            .I(currentState_sZ0Z_4));
    LocalMux I__463 (
            .O(N__2145),
            .I(currentState_sZ0Z_4));
    CascadeMux I__462 (
            .O(N__2136),
            .I(N_30_mux_i_0_a3_4_cascade_));
    InMux I__461 (
            .O(N__2133),
            .I(N__2117));
    InMux I__460 (
            .O(N__2132),
            .I(N__2117));
    InMux I__459 (
            .O(N__2131),
            .I(N__2117));
    InMux I__458 (
            .O(N__2130),
            .I(N__2117));
    InMux I__457 (
            .O(N__2129),
            .I(N__2108));
    InMux I__456 (
            .O(N__2128),
            .I(N__2108));
    InMux I__455 (
            .O(N__2127),
            .I(N__2108));
    InMux I__454 (
            .O(N__2126),
            .I(N__2108));
    LocalMux I__453 (
            .O(N__2117),
            .I(N_14));
    LocalMux I__452 (
            .O(N__2108),
            .I(N_14));
    InMux I__451 (
            .O(N__2103),
            .I(N__2098));
    InMux I__450 (
            .O(N__2102),
            .I(N__2093));
    InMux I__449 (
            .O(N__2101),
            .I(N__2093));
    LocalMux I__448 (
            .O(N__2098),
            .I(shiftBitsIn_sZ0Z_7));
    LocalMux I__447 (
            .O(N__2093),
            .I(shiftBitsIn_sZ0Z_7));
    CascadeMux I__446 (
            .O(N__2088),
            .I(N__2084));
    InMux I__445 (
            .O(N__2087),
            .I(N__2080));
    InMux I__444 (
            .O(N__2084),
            .I(N__2075));
    InMux I__443 (
            .O(N__2083),
            .I(N__2075));
    LocalMux I__442 (
            .O(N__2080),
            .I(shiftBitsIn_sZ0Z_6));
    LocalMux I__441 (
            .O(N__2075),
            .I(shiftBitsIn_sZ0Z_6));
    CascadeMux I__440 (
            .O(N__2070),
            .I(N__2065));
    InMux I__439 (
            .O(N__2069),
            .I(N__2062));
    InMux I__438 (
            .O(N__2068),
            .I(N__2057));
    InMux I__437 (
            .O(N__2065),
            .I(N__2057));
    LocalMux I__436 (
            .O(N__2062),
            .I(shiftBitsIn_sZ0Z_0));
    LocalMux I__435 (
            .O(N__2057),
            .I(shiftBitsIn_sZ0Z_0));
    InMux I__434 (
            .O(N__2052),
            .I(N__2047));
    InMux I__433 (
            .O(N__2051),
            .I(N__2042));
    InMux I__432 (
            .O(N__2050),
            .I(N__2042));
    LocalMux I__431 (
            .O(N__2047),
            .I(shiftBitsIn_sZ0Z_5));
    LocalMux I__430 (
            .O(N__2042),
            .I(shiftBitsIn_sZ0Z_5));
    InMux I__429 (
            .O(N__2037),
            .I(N__2034));
    LocalMux I__428 (
            .O(N__2034),
            .I(N_30_mux_i_0_a3_5));
    InMux I__427 (
            .O(N__2031),
            .I(N__2028));
    LocalMux I__426 (
            .O(N__2028),
            .I(dataReceived_s_0_sqmuxa_0_a2_1));
    IoInMux I__425 (
            .O(N__2025),
            .I(N__2022));
    LocalMux I__424 (
            .O(N__2022),
            .I(N__2019));
    IoSpan4Mux I__423 (
            .O(N__2019),
            .I(N__2016));
    Span4Mux_s1_h I__422 (
            .O(N__2016),
            .I(N__2013));
    Span4Mux_h I__421 (
            .O(N__2013),
            .I(N__2009));
    InMux I__420 (
            .O(N__2012),
            .I(N__2006));
    Sp12to4 I__419 (
            .O(N__2009),
            .I(N__1996));
    LocalMux I__418 (
            .O(N__2006),
            .I(N__1993));
    InMux I__417 (
            .O(N__2005),
            .I(N__1990));
    InMux I__416 (
            .O(N__2004),
            .I(N__1983));
    InMux I__415 (
            .O(N__2003),
            .I(N__1983));
    InMux I__414 (
            .O(N__2002),
            .I(N__1983));
    InMux I__413 (
            .O(N__2001),
            .I(N__1978));
    InMux I__412 (
            .O(N__2000),
            .I(N__1978));
    InMux I__411 (
            .O(N__1999),
            .I(N__1975));
    Odrv12 I__410 (
            .O(N__1996),
            .I(shifting_out_c));
    Odrv4 I__409 (
            .O(N__1993),
            .I(shifting_out_c));
    LocalMux I__408 (
            .O(N__1990),
            .I(shifting_out_c));
    LocalMux I__407 (
            .O(N__1983),
            .I(shifting_out_c));
    LocalMux I__406 (
            .O(N__1978),
            .I(shifting_out_c));
    LocalMux I__405 (
            .O(N__1975),
            .I(shifting_out_c));
    CascadeMux I__404 (
            .O(N__1962),
            .I(N__1959));
    InMux I__403 (
            .O(N__1959),
            .I(N__1956));
    LocalMux I__402 (
            .O(N__1956),
            .I(dataReceived_s_0_sqmuxa_0_a2_4_4));
    InMux I__401 (
            .O(N__1953),
            .I(N__1950));
    LocalMux I__400 (
            .O(N__1950),
            .I(N__1943));
    InMux I__399 (
            .O(N__1949),
            .I(N__1940));
    InMux I__398 (
            .O(N__1948),
            .I(N__1935));
    InMux I__397 (
            .O(N__1947),
            .I(N__1935));
    InMux I__396 (
            .O(N__1946),
            .I(N__1932));
    Odrv4 I__395 (
            .O(N__1943),
            .I(currentState_sZ0Z_3));
    LocalMux I__394 (
            .O(N__1940),
            .I(currentState_sZ0Z_3));
    LocalMux I__393 (
            .O(N__1935),
            .I(currentState_sZ0Z_3));
    LocalMux I__392 (
            .O(N__1932),
            .I(currentState_sZ0Z_3));
    InMux I__391 (
            .O(N__1923),
            .I(N__1913));
    InMux I__390 (
            .O(N__1922),
            .I(N__1913));
    InMux I__389 (
            .O(N__1921),
            .I(N__1913));
    InMux I__388 (
            .O(N__1920),
            .I(N__1910));
    LocalMux I__387 (
            .O(N__1913),
            .I(dataReceived_sZ0));
    LocalMux I__386 (
            .O(N__1910),
            .I(dataReceived_sZ0));
    InMux I__385 (
            .O(N__1905),
            .I(N__1902));
    LocalMux I__384 (
            .O(N__1902),
            .I(N__1890));
    ClkMux I__383 (
            .O(N__1901),
            .I(N__1863));
    ClkMux I__382 (
            .O(N__1900),
            .I(N__1863));
    ClkMux I__381 (
            .O(N__1899),
            .I(N__1863));
    ClkMux I__380 (
            .O(N__1898),
            .I(N__1863));
    ClkMux I__379 (
            .O(N__1897),
            .I(N__1863));
    ClkMux I__378 (
            .O(N__1896),
            .I(N__1863));
    ClkMux I__377 (
            .O(N__1895),
            .I(N__1863));
    ClkMux I__376 (
            .O(N__1894),
            .I(N__1863));
    ClkMux I__375 (
            .O(N__1893),
            .I(N__1863));
    Glb2LocalMux I__374 (
            .O(N__1890),
            .I(N__1863));
    ClkMux I__373 (
            .O(N__1889),
            .I(N__1863));
    ClkMux I__372 (
            .O(N__1888),
            .I(N__1863));
    GlobalMux I__371 (
            .O(N__1863),
            .I(N__1860));
    gio2CtrlBuf I__370 (
            .O(N__1860),
            .I(clk_in_c_g));
    CEMux I__369 (
            .O(N__1857),
            .I(N__1848));
    CEMux I__368 (
            .O(N__1856),
            .I(N__1848));
    CEMux I__367 (
            .O(N__1855),
            .I(N__1848));
    GlobalMux I__366 (
            .O(N__1848),
            .I(N__1845));
    gio2CtrlBuf I__365 (
            .O(N__1845),
            .I(shiftBitsIn_se_0_i_g));
    SRMux I__364 (
            .O(N__1842),
            .I(N__1815));
    SRMux I__363 (
            .O(N__1841),
            .I(N__1815));
    SRMux I__362 (
            .O(N__1840),
            .I(N__1815));
    SRMux I__361 (
            .O(N__1839),
            .I(N__1815));
    SRMux I__360 (
            .O(N__1838),
            .I(N__1815));
    SRMux I__359 (
            .O(N__1837),
            .I(N__1815));
    SRMux I__358 (
            .O(N__1836),
            .I(N__1815));
    SRMux I__357 (
            .O(N__1835),
            .I(N__1815));
    SRMux I__356 (
            .O(N__1834),
            .I(N__1815));
    GlobalMux I__355 (
            .O(N__1815),
            .I(N__1812));
    gio2CtrlBuf I__354 (
            .O(N__1812),
            .I(rst_in_n_c_i_g));
    InMux I__353 (
            .O(N__1809),
            .I(bfn_3_9_0_));
    InMux I__352 (
            .O(N__1806),
            .I(shiftBitsIn_s_cry_0));
    InMux I__351 (
            .O(N__1803),
            .I(shiftBitsIn_s_cry_1));
    InMux I__350 (
            .O(N__1800),
            .I(shiftBitsIn_s_cry_2));
    InMux I__349 (
            .O(N__1797),
            .I(shiftBitsIn_s_cry_3));
    InMux I__348 (
            .O(N__1794),
            .I(shiftBitsIn_s_cry_4));
    InMux I__347 (
            .O(N__1791),
            .I(shiftBitsIn_s_cry_5));
    InMux I__346 (
            .O(N__1788),
            .I(shiftBitsIn_s_cry_6));
    CEMux I__345 (
            .O(N__1785),
            .I(N__1782));
    LocalMux I__344 (
            .O(N__1782),
            .I(N__1778));
    InMux I__343 (
            .O(N__1781),
            .I(N__1774));
    Span4Mux_v I__342 (
            .O(N__1778),
            .I(N__1771));
    InMux I__341 (
            .O(N__1777),
            .I(N__1768));
    LocalMux I__340 (
            .O(N__1774),
            .I(N__1761));
    Span4Mux_h I__339 (
            .O(N__1771),
            .I(N__1761));
    LocalMux I__338 (
            .O(N__1768),
            .I(N__1761));
    Odrv4 I__337 (
            .O(N__1761),
            .I(currentState_sZ0Z_1));
    InMux I__336 (
            .O(N__1758),
            .I(N__1751));
    InMux I__335 (
            .O(N__1757),
            .I(N__1744));
    InMux I__334 (
            .O(N__1756),
            .I(N__1744));
    InMux I__333 (
            .O(N__1755),
            .I(N__1744));
    InMux I__332 (
            .O(N__1754),
            .I(N__1741));
    LocalMux I__331 (
            .O(N__1751),
            .I(currentState_s_fastZ0Z_1));
    LocalMux I__330 (
            .O(N__1744),
            .I(currentState_s_fastZ0Z_1));
    LocalMux I__329 (
            .O(N__1741),
            .I(currentState_s_fastZ0Z_1));
    CascadeMux I__328 (
            .O(N__1734),
            .I(N__1731));
    InMux I__327 (
            .O(N__1731),
            .I(N__1725));
    InMux I__326 (
            .O(N__1730),
            .I(N__1722));
    InMux I__325 (
            .O(N__1729),
            .I(N__1719));
    InMux I__324 (
            .O(N__1728),
            .I(N__1716));
    LocalMux I__323 (
            .O(N__1725),
            .I(currentState_s_fastZ0Z_2));
    LocalMux I__322 (
            .O(N__1722),
            .I(currentState_s_fastZ0Z_2));
    LocalMux I__321 (
            .O(N__1719),
            .I(currentState_s_fastZ0Z_2));
    LocalMux I__320 (
            .O(N__1716),
            .I(currentState_s_fastZ0Z_2));
    InMux I__319 (
            .O(N__1707),
            .I(N__1698));
    InMux I__318 (
            .O(N__1706),
            .I(N__1698));
    InMux I__317 (
            .O(N__1705),
            .I(N__1698));
    LocalMux I__316 (
            .O(N__1698),
            .I(N__1695));
    Span4Mux_v I__315 (
            .O(N__1695),
            .I(N__1692));
    Span4Mux_h I__314 (
            .O(N__1692),
            .I(N__1689));
    Odrv4 I__313 (
            .O(N__1689),
            .I(write_in_c));
    InMux I__312 (
            .O(N__1686),
            .I(N__1677));
    InMux I__311 (
            .O(N__1685),
            .I(N__1677));
    InMux I__310 (
            .O(N__1684),
            .I(N__1677));
    LocalMux I__309 (
            .O(N__1677),
            .I(currentState_sZ0Z_6));
    InMux I__308 (
            .O(N__1674),
            .I(N__1670));
    InMux I__307 (
            .O(N__1673),
            .I(N__1667));
    LocalMux I__306 (
            .O(N__1670),
            .I(shift_regZ0Z_7));
    LocalMux I__305 (
            .O(N__1667),
            .I(shift_regZ0Z_7));
    IoInMux I__304 (
            .O(N__1662),
            .I(N__1659));
    LocalMux I__303 (
            .O(N__1659),
            .I(N__1656));
    Span4Mux_s3_h I__302 (
            .O(N__1656),
            .I(N__1653));
    Odrv4 I__301 (
            .O(N__1653),
            .I(serialD_out_c));
    InMux I__300 (
            .O(N__1650),
            .I(N__1647));
    LocalMux I__299 (
            .O(N__1647),
            .I(N__1644));
    Span4Mux_h I__298 (
            .O(N__1644),
            .I(N__1641));
    Span4Mux_v I__297 (
            .O(N__1641),
            .I(N__1638));
    Span4Mux_v I__296 (
            .O(N__1638),
            .I(N__1635));
    Odrv4 I__295 (
            .O(N__1635),
            .I(data_in_c_3));
    InMux I__294 (
            .O(N__1632),
            .I(N__1629));
    LocalMux I__293 (
            .O(N__1629),
            .I(din_regZ0Z_3));
    InMux I__292 (
            .O(N__1626),
            .I(N__1623));
    LocalMux I__291 (
            .O(N__1623),
            .I(N__1620));
    Span12Mux_v I__290 (
            .O(N__1620),
            .I(N__1617));
    Odrv12 I__289 (
            .O(N__1617),
            .I(data_in_c_0));
    InMux I__288 (
            .O(N__1614),
            .I(N__1611));
    LocalMux I__287 (
            .O(N__1611),
            .I(din_regZ0Z_0));
    InMux I__286 (
            .O(N__1608),
            .I(N__1605));
    LocalMux I__285 (
            .O(N__1605),
            .I(N__1602));
    Span4Mux_v I__284 (
            .O(N__1602),
            .I(N__1599));
    Span4Mux_v I__283 (
            .O(N__1599),
            .I(N__1596));
    Span4Mux_h I__282 (
            .O(N__1596),
            .I(N__1593));
    Odrv4 I__281 (
            .O(N__1593),
            .I(data_in_c_5));
    InMux I__280 (
            .O(N__1590),
            .I(N__1587));
    LocalMux I__279 (
            .O(N__1587),
            .I(din_regZ0Z_5));
    CEMux I__278 (
            .O(N__1584),
            .I(N__1581));
    LocalMux I__277 (
            .O(N__1581),
            .I(N__1577));
    CEMux I__276 (
            .O(N__1580),
            .I(N__1574));
    Span4Mux_h I__275 (
            .O(N__1577),
            .I(N__1570));
    LocalMux I__274 (
            .O(N__1574),
            .I(N__1567));
    InMux I__273 (
            .O(N__1573),
            .I(N__1564));
    Odrv4 I__272 (
            .O(N__1570),
            .I(currentState_sZ0Z_5));
    Odrv12 I__271 (
            .O(N__1567),
            .I(currentState_sZ0Z_5));
    LocalMux I__270 (
            .O(N__1564),
            .I(currentState_sZ0Z_5));
    InMux I__269 (
            .O(N__1557),
            .I(N__1554));
    LocalMux I__268 (
            .O(N__1554),
            .I(N__1551));
    Sp12to4 I__267 (
            .O(N__1551),
            .I(N__1548));
    Span12Mux_v I__266 (
            .O(N__1548),
            .I(N__1545));
    Odrv12 I__265 (
            .O(N__1545),
            .I(data_in_c_4));
    InMux I__264 (
            .O(N__1542),
            .I(N__1539));
    LocalMux I__263 (
            .O(N__1539),
            .I(din_regZ0Z_4));
    InMux I__262 (
            .O(N__1536),
            .I(N__1533));
    LocalMux I__261 (
            .O(N__1533),
            .I(N__1530));
    Span4Mux_v I__260 (
            .O(N__1530),
            .I(N__1527));
    Sp12to4 I__259 (
            .O(N__1527),
            .I(N__1524));
    Odrv12 I__258 (
            .O(N__1524),
            .I(data_in_c_7));
    InMux I__257 (
            .O(N__1521),
            .I(N__1518));
    LocalMux I__256 (
            .O(N__1518),
            .I(din_regZ0Z_7));
    InMux I__255 (
            .O(N__1515),
            .I(N__1512));
    LocalMux I__254 (
            .O(N__1512),
            .I(N__1509));
    Sp12to4 I__253 (
            .O(N__1509),
            .I(N__1506));
    Span12Mux_v I__252 (
            .O(N__1506),
            .I(N__1503));
    Odrv12 I__251 (
            .O(N__1503),
            .I(data_in_c_2));
    InMux I__250 (
            .O(N__1500),
            .I(N__1497));
    LocalMux I__249 (
            .O(N__1497),
            .I(din_regZ0Z_2));
    CascadeMux I__248 (
            .O(N__1494),
            .I(N__1491));
    InMux I__247 (
            .O(N__1491),
            .I(N__1486));
    InMux I__246 (
            .O(N__1490),
            .I(N__1483));
    InMux I__245 (
            .O(N__1489),
            .I(N__1480));
    LocalMux I__244 (
            .O(N__1486),
            .I(pulseCounter_cntZ0Z_1));
    LocalMux I__243 (
            .O(N__1483),
            .I(pulseCounter_cntZ0Z_1));
    LocalMux I__242 (
            .O(N__1480),
            .I(pulseCounter_cntZ0Z_1));
    InMux I__241 (
            .O(N__1473),
            .I(N__1465));
    InMux I__240 (
            .O(N__1472),
            .I(N__1465));
    InMux I__239 (
            .O(N__1471),
            .I(N__1462));
    InMux I__238 (
            .O(N__1470),
            .I(N__1459));
    LocalMux I__237 (
            .O(N__1465),
            .I(pulseCounter_cntZ0Z_0));
    LocalMux I__236 (
            .O(N__1462),
            .I(pulseCounter_cntZ0Z_0));
    LocalMux I__235 (
            .O(N__1459),
            .I(pulseCounter_cntZ0Z_0));
    CascadeMux I__234 (
            .O(N__1452),
            .I(pulseCounter_cnt_r_sx_2_cascade_));
    InMux I__233 (
            .O(N__1449),
            .I(N__1445));
    InMux I__232 (
            .O(N__1448),
            .I(N__1442));
    LocalMux I__231 (
            .O(N__1445),
            .I(pulseCounter_cntZ0Z_2));
    LocalMux I__230 (
            .O(N__1442),
            .I(pulseCounter_cntZ0Z_2));
    IoInMux I__229 (
            .O(N__1437),
            .I(N__1434));
    LocalMux I__228 (
            .O(N__1434),
            .I(N__1430));
    InMux I__227 (
            .O(N__1433),
            .I(N__1427));
    Span12Mux_s5_h I__226 (
            .O(N__1430),
            .I(N__1423));
    LocalMux I__225 (
            .O(N__1427),
            .I(N__1420));
    InMux I__224 (
            .O(N__1426),
            .I(N__1417));
    Odrv12 I__223 (
            .O(N__1423),
            .I(dataReceived_out_c));
    Odrv4 I__222 (
            .O(N__1420),
            .I(dataReceived_out_c));
    LocalMux I__221 (
            .O(N__1417),
            .I(dataReceived_out_c));
    CascadeMux I__220 (
            .O(N__1410),
            .I(N__1406));
    CascadeMux I__219 (
            .O(N__1409),
            .I(N__1403));
    InMux I__218 (
            .O(N__1406),
            .I(N__1399));
    InMux I__217 (
            .O(N__1403),
            .I(N__1396));
    InMux I__216 (
            .O(N__1402),
            .I(N__1393));
    LocalMux I__215 (
            .O(N__1399),
            .I(N__1386));
    LocalMux I__214 (
            .O(N__1396),
            .I(N__1386));
    LocalMux I__213 (
            .O(N__1393),
            .I(N__1386));
    Span4Mux_v I__212 (
            .O(N__1386),
            .I(N__1383));
    Span4Mux_h I__211 (
            .O(N__1383),
            .I(N__1380));
    Span4Mux_v I__210 (
            .O(N__1380),
            .I(N__1377));
    Span4Mux_v I__209 (
            .O(N__1377),
            .I(N__1374));
    Odrv4 I__208 (
            .O(N__1374),
            .I(drdy_in_c));
    InMux I__207 (
            .O(N__1371),
            .I(N__1367));
    InMux I__206 (
            .O(N__1370),
            .I(N__1364));
    LocalMux I__205 (
            .O(N__1367),
            .I(shift_regZ0Z_2));
    LocalMux I__204 (
            .O(N__1364),
            .I(shift_regZ0Z_2));
    InMux I__203 (
            .O(N__1359),
            .I(N__1355));
    InMux I__202 (
            .O(N__1358),
            .I(N__1352));
    LocalMux I__201 (
            .O(N__1355),
            .I(shift_regZ0Z_3));
    LocalMux I__200 (
            .O(N__1352),
            .I(shift_regZ0Z_3));
    InMux I__199 (
            .O(N__1347),
            .I(N__1343));
    InMux I__198 (
            .O(N__1346),
            .I(N__1340));
    LocalMux I__197 (
            .O(N__1343),
            .I(shift_regZ0Z_4));
    LocalMux I__196 (
            .O(N__1340),
            .I(shift_regZ0Z_4));
    InMux I__195 (
            .O(N__1335),
            .I(N__1332));
    LocalMux I__194 (
            .O(N__1332),
            .I(N__1329));
    Span4Mux_v I__193 (
            .O(N__1329),
            .I(N__1326));
    Sp12to4 I__192 (
            .O(N__1326),
            .I(N__1323));
    Odrv12 I__191 (
            .O(N__1323),
            .I(serialD_in_c));
    InMux I__190 (
            .O(N__1320),
            .I(N__1316));
    InMux I__189 (
            .O(N__1319),
            .I(N__1313));
    LocalMux I__188 (
            .O(N__1316),
            .I(shift_regZ0Z_0));
    LocalMux I__187 (
            .O(N__1313),
            .I(shift_regZ0Z_0));
    InMux I__186 (
            .O(N__1308),
            .I(N__1304));
    InMux I__185 (
            .O(N__1307),
            .I(N__1301));
    LocalMux I__184 (
            .O(N__1304),
            .I(shift_regZ0Z_1));
    LocalMux I__183 (
            .O(N__1301),
            .I(shift_regZ0Z_1));
    InMux I__182 (
            .O(N__1296),
            .I(N__1292));
    InMux I__181 (
            .O(N__1295),
            .I(N__1289));
    LocalMux I__180 (
            .O(N__1292),
            .I(shift_regZ0Z_5));
    LocalMux I__179 (
            .O(N__1289),
            .I(shift_regZ0Z_5));
    InMux I__178 (
            .O(N__1284),
            .I(N__1280));
    InMux I__177 (
            .O(N__1283),
            .I(N__1277));
    LocalMux I__176 (
            .O(N__1280),
            .I(shift_regZ0Z_6));
    LocalMux I__175 (
            .O(N__1277),
            .I(shift_regZ0Z_6));
    InMux I__174 (
            .O(N__1272),
            .I(N__1269));
    LocalMux I__173 (
            .O(N__1269),
            .I(N__1266));
    Span4Mux_h I__172 (
            .O(N__1266),
            .I(N__1263));
    Span4Mux_v I__171 (
            .O(N__1263),
            .I(N__1260));
    Span4Mux_v I__170 (
            .O(N__1260),
            .I(N__1257));
    Odrv4 I__169 (
            .O(N__1257),
            .I(data_in_c_1));
    InMux I__168 (
            .O(N__1254),
            .I(N__1251));
    LocalMux I__167 (
            .O(N__1251),
            .I(din_regZ0Z_1));
    InMux I__166 (
            .O(N__1248),
            .I(N__1245));
    LocalMux I__165 (
            .O(N__1245),
            .I(N__1242));
    Span4Mux_v I__164 (
            .O(N__1242),
            .I(N__1239));
    Sp12to4 I__163 (
            .O(N__1239),
            .I(N__1236));
    Odrv12 I__162 (
            .O(N__1236),
            .I(data_in_c_6));
    InMux I__161 (
            .O(N__1233),
            .I(N__1230));
    LocalMux I__160 (
            .O(N__1230),
            .I(din_regZ0Z_6));
    IoInMux I__159 (
            .O(N__1227),
            .I(N__1224));
    LocalMux I__158 (
            .O(N__1224),
            .I(N__1221));
    Span4Mux_s0_h I__157 (
            .O(N__1221),
            .I(N__1218));
    Span4Mux_h I__156 (
            .O(N__1218),
            .I(N__1215));
    Odrv4 I__155 (
            .O(N__1215),
            .I(data_out_c_1));
    IoInMux I__154 (
            .O(N__1212),
            .I(N__1209));
    LocalMux I__153 (
            .O(N__1209),
            .I(N__1206));
    IoSpan4Mux I__152 (
            .O(N__1206),
            .I(N__1203));
    Span4Mux_s2_h I__151 (
            .O(N__1203),
            .I(N__1200));
    Odrv4 I__150 (
            .O(N__1200),
            .I(data_out_c_0));
    IoInMux I__149 (
            .O(N__1197),
            .I(N__1194));
    LocalMux I__148 (
            .O(N__1194),
            .I(N__1191));
    IoSpan4Mux I__147 (
            .O(N__1191),
            .I(N__1188));
    IoSpan4Mux I__146 (
            .O(N__1188),
            .I(N__1185));
    Span4Mux_s1_h I__145 (
            .O(N__1185),
            .I(N__1182));
    Odrv4 I__144 (
            .O(N__1182),
            .I(data_out_c_5));
    IoInMux I__143 (
            .O(N__1179),
            .I(N__1176));
    LocalMux I__142 (
            .O(N__1176),
            .I(N__1173));
    IoSpan4Mux I__141 (
            .O(N__1173),
            .I(N__1170));
    IoSpan4Mux I__140 (
            .O(N__1170),
            .I(N__1167));
    Span4Mux_s3_h I__139 (
            .O(N__1167),
            .I(N__1164));
    Odrv4 I__138 (
            .O(N__1164),
            .I(data_out_c_6));
    IoInMux I__137 (
            .O(N__1161),
            .I(N__1158));
    LocalMux I__136 (
            .O(N__1158),
            .I(N__1155));
    IoSpan4Mux I__135 (
            .O(N__1155),
            .I(N__1152));
    IoSpan4Mux I__134 (
            .O(N__1152),
            .I(N__1149));
    Span4Mux_s2_h I__133 (
            .O(N__1149),
            .I(N__1146));
    Odrv4 I__132 (
            .O(N__1146),
            .I(data_out_c_4));
    IoInMux I__131 (
            .O(N__1143),
            .I(N__1140));
    LocalMux I__130 (
            .O(N__1140),
            .I(N__1137));
    Span12Mux_s3_h I__129 (
            .O(N__1137),
            .I(N__1134));
    Span12Mux_v I__128 (
            .O(N__1134),
            .I(N__1131));
    Odrv12 I__127 (
            .O(N__1131),
            .I(data_out_c_7));
    IoInMux I__126 (
            .O(N__1128),
            .I(N__1125));
    LocalMux I__125 (
            .O(N__1125),
            .I(N__1122));
    Span12Mux_s4_h I__124 (
            .O(N__1122),
            .I(N__1119));
    Odrv12 I__123 (
            .O(N__1119),
            .I(data_out_c_3));
    IoInMux I__122 (
            .O(N__1116),
            .I(N__1113));
    LocalMux I__121 (
            .O(N__1113),
            .I(N__1110));
    Span4Mux_s0_h I__120 (
            .O(N__1110),
            .I(N__1107));
    Span4Mux_h I__119 (
            .O(N__1107),
            .I(N__1104));
    Odrv4 I__118 (
            .O(N__1104),
            .I(data_out_c_2));
    IoInMux I__117 (
            .O(N__1101),
            .I(N__1098));
    LocalMux I__116 (
            .O(N__1098),
            .I(N__1095));
    Span4Mux_s0_h I__115 (
            .O(N__1095),
            .I(N__1092));
    Span4Mux_h I__114 (
            .O(N__1092),
            .I(N__1089));
    Sp12to4 I__113 (
            .O(N__1089),
            .I(N__1086));
    Odrv12 I__112 (
            .O(N__1086),
            .I(cs_out_c));
    InMux I__111 (
            .O(N__1083),
            .I(N__1080));
    LocalMux I__110 (
            .O(N__1080),
            .I(N__1077));
    Sp12to4 I__109 (
            .O(N__1077),
            .I(N__1074));
    Span12Mux_v I__108 (
            .O(N__1074),
            .I(N__1071));
    Odrv12 I__107 (
            .O(N__1071),
            .I(rst_in_n_c));
    IoInMux I__106 (
            .O(N__1068),
            .I(N__1065));
    LocalMux I__105 (
            .O(N__1065),
            .I(N__1062));
    Span4Mux_s0_h I__104 (
            .O(N__1062),
            .I(N__1059));
    Span4Mux_h I__103 (
            .O(N__1059),
            .I(N__1056));
    Odrv4 I__102 (
            .O(N__1056),
            .I(rst_in_n_c_i));
    CascadeMux I__101 (
            .O(N__1053),
            .I(N_12_i_sx_cascade_));
    IoInMux I__100 (
            .O(N__1050),
            .I(N__1047));
    LocalMux I__99 (
            .O(N__1047),
            .I(N__1044));
    Odrv12 I__98 (
            .O(N__1044),
            .I(shiftBitsIn_se_0_i));
    InMux I__97 (
            .O(N__1041),
            .I(N__1038));
    LocalMux I__96 (
            .O(N__1038),
            .I(pulseCounterTC_sZ0));
    IoInMux I__95 (
            .O(N__1035),
            .I(N__1032));
    LocalMux I__94 (
            .O(N__1032),
            .I(N__1029));
    Odrv12 I__93 (
            .O(N__1029),
            .I(sclk_out_c));
    INV INVserialD_outZ0C (
            .O(INVserialD_outZ0C_net),
            .I(N__1894));
    INV INVpulseCounter_cnt_2C (
            .O(INVpulseCounter_cnt_2C_net),
            .I(N__1893));
    INV INVpulseCounterTC_sC (
            .O(INVpulseCounterTC_sC_net),
            .I(N__1896));
    defparam IN_MUX_bfv_3_9_0_.C_INIT=2'b01;
    ICE_CARRY_IN_MUX IN_MUX_bfv_3_9_0_ (
            .carryinitin(),
            .carryinitout(bfn_3_9_0_));
    GND GND (
            .Y(GNDG0));
    VCC VCC (
            .Y(VCCG0));
    ICE_GB currentState_s_RNI3IH61_0_3 (
            .USERSIGNALTOGLOBALBUFFER(N__1050),
            .GLOBALBUFFEROUTPUT(shiftBitsIn_se_0_i_g));
    ICE_GB rst_in_n_ibuf_RNI1DMA_0 (
            .USERSIGNALTOGLOBALBUFFER(N__1068),
            .GLOBALBUFFEROUTPUT(rst_in_n_c_i_g));
    GND GND_Inst (
            .Y(_gnd_net_));
    defparam cs_out_obuf_RNO_LC_1_8_3.C_ON=1'b0;
    defparam cs_out_obuf_RNO_LC_1_8_3.SEQ_MODE=4'b0000;
    defparam cs_out_obuf_RNO_LC_1_8_3.LUT_INIT=16'b0000000000010001;
    LogicCell40 cs_out_obuf_RNO_LC_1_8_3 (
            .in0(N__1953),
            .in1(N__1781),
            .in2(_gnd_net_),
            .in3(N__2012),
            .lcout(cs_out_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam rst_in_n_ibuf_RNI1DMA_LC_1_8_6.C_ON=1'b0;
    defparam rst_in_n_ibuf_RNI1DMA_LC_1_8_6.SEQ_MODE=4'b0000;
    defparam rst_in_n_ibuf_RNI1DMA_LC_1_8_6.LUT_INIT=16'b0000000011111111;
    LogicCell40 rst_in_n_ibuf_RNI1DMA_LC_1_8_6 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1083),
            .lcout(rst_in_n_c_i),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam pulseCounterTC_s_RNO_0_LC_1_10_0.C_ON=1'b0;
    defparam pulseCounterTC_s_RNO_0_LC_1_10_0.SEQ_MODE=4'b0000;
    defparam pulseCounterTC_s_RNO_0_LC_1_10_0.LUT_INIT=16'b0111011111111111;
    LogicCell40 pulseCounterTC_s_RNO_0_LC_1_10_0 (
            .in0(N__1448),
            .in1(N__1489),
            .in2(_gnd_net_),
            .in3(N__1470),
            .lcout(),
            .ltout(N_12_i_sx_cascade_),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam pulseCounterTC_s_LC_1_10_1.C_ON=1'b0;
    defparam pulseCounterTC_s_LC_1_10_1.SEQ_MODE=4'b1000;
    defparam pulseCounterTC_s_LC_1_10_1.LUT_INIT=16'b0000111100001010;
    LogicCell40 pulseCounterTC_s_LC_1_10_1 (
            .in0(N__1757),
            .in1(_gnd_net_),
            .in2(N__1053),
            .in3(N__1729),
            .lcout(pulseCounterTC_sZ0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(INVpulseCounterTC_sC_net),
            .ce(),
            .sr(_gnd_net_));
    defparam pulseCounter_cnt_1_LC_1_10_4.C_ON=1'b0;
    defparam pulseCounter_cnt_1_LC_1_10_4.SEQ_MODE=4'b1000;
    defparam pulseCounter_cnt_1_LC_1_10_4.LUT_INIT=16'b0101101001001000;
    LogicCell40 pulseCounter_cnt_1_LC_1_10_4 (
            .in0(N__1473),
            .in1(N__1756),
            .in2(N__1494),
            .in3(N__2001),
            .lcout(pulseCounter_cntZ0Z_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(INVpulseCounterTC_sC_net),
            .ce(),
            .sr(_gnd_net_));
    defparam pulseCounter_cnt_0_LC_1_10_6.C_ON=1'b0;
    defparam pulseCounter_cnt_0_LC_1_10_6.SEQ_MODE=4'b1000;
    defparam pulseCounter_cnt_0_LC_1_10_6.LUT_INIT=16'b0101010101000100;
    LogicCell40 pulseCounter_cnt_0_LC_1_10_6 (
            .in0(N__1472),
            .in1(N__1755),
            .in2(_gnd_net_),
            .in3(N__2000),
            .lcout(pulseCounter_cntZ0Z_0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(INVpulseCounterTC_sC_net),
            .ce(),
            .sr(_gnd_net_));
    defparam currentState_s_RNI3IH61_3_LC_1_11_2.C_ON=1'b0;
    defparam currentState_s_RNI3IH61_3_LC_1_11_2.SEQ_MODE=4'b0000;
    defparam currentState_s_RNI3IH61_3_LC_1_11_2.LUT_INIT=16'b1111111111101110;
    LogicCell40 currentState_s_RNI3IH61_3_LC_1_11_2 (
            .in0(N__2157),
            .in1(N__1946),
            .in2(_gnd_net_),
            .in3(N__1999),
            .lcout(shiftBitsIn_se_0_i),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam sclk_out_obuf_RNO_LC_1_11_3.C_ON=1'b0;
    defparam sclk_out_obuf_RNO_LC_1_11_3.SEQ_MODE=4'b0000;
    defparam sclk_out_obuf_RNO_LC_1_11_3.LUT_INIT=16'b0100010001000000;
    LogicCell40 sclk_out_obuf_RNO_LC_1_11_3 (
            .in0(N__1041),
            .in1(N__1905),
            .in2(N__1734),
            .in3(N__1758),
            .lcout(sclk_out_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam dout_reg_1_LC_1_12_0.C_ON=1'b0;
    defparam dout_reg_1_LC_1_12_0.SEQ_MODE=4'b1010;
    defparam dout_reg_1_LC_1_12_0.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_1_LC_1_12_0 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1308),
            .lcout(data_out_c_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_0_LC_1_12_1.C_ON=1'b0;
    defparam dout_reg_0_LC_1_12_1.SEQ_MODE=4'b1010;
    defparam dout_reg_0_LC_1_12_1.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_0_LC_1_12_1 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1320),
            .lcout(data_out_c_0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_5_LC_1_12_2.C_ON=1'b0;
    defparam dout_reg_5_LC_1_12_2.SEQ_MODE=4'b1010;
    defparam dout_reg_5_LC_1_12_2.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_5_LC_1_12_2 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1296),
            .lcout(data_out_c_5),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_6_LC_1_12_3.C_ON=1'b0;
    defparam dout_reg_6_LC_1_12_3.SEQ_MODE=4'b1010;
    defparam dout_reg_6_LC_1_12_3.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_6_LC_1_12_3 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1284),
            .lcout(data_out_c_6),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_4_LC_1_12_4.C_ON=1'b0;
    defparam dout_reg_4_LC_1_12_4.SEQ_MODE=4'b1010;
    defparam dout_reg_4_LC_1_12_4.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_4_LC_1_12_4 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1347),
            .lcout(data_out_c_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_7_LC_1_12_5.C_ON=1'b0;
    defparam dout_reg_7_LC_1_12_5.SEQ_MODE=4'b1010;
    defparam dout_reg_7_LC_1_12_5.LUT_INIT=16'b1111111100000000;
    LogicCell40 dout_reg_7_LC_1_12_5 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1674),
            .lcout(data_out_c_7),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_3_LC_1_12_6.C_ON=1'b0;
    defparam dout_reg_3_LC_1_12_6.SEQ_MODE=4'b1010;
    defparam dout_reg_3_LC_1_12_6.LUT_INIT=16'b1100110011001100;
    LogicCell40 dout_reg_3_LC_1_12_6 (
            .in0(_gnd_net_),
            .in1(N__1359),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(data_out_c_3),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam dout_reg_2_LC_1_12_7.C_ON=1'b0;
    defparam dout_reg_2_LC_1_12_7.SEQ_MODE=4'b1010;
    defparam dout_reg_2_LC_1_12_7.LUT_INIT=16'b1100110011001100;
    LogicCell40 dout_reg_2_LC_1_12_7 (
            .in0(_gnd_net_),
            .in1(N__1371),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(data_out_c_2),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1897),
            .ce(N__1785),
            .sr(N__1834));
    defparam shift_reg_2_LC_1_13_0.C_ON=1'b0;
    defparam shift_reg_2_LC_1_13_0.SEQ_MODE=4'b1010;
    defparam shift_reg_2_LC_1_13_0.LUT_INIT=16'b1110111001000100;
    LogicCell40 shift_reg_2_LC_1_13_0 (
            .in0(N__2179),
            .in1(N__1307),
            .in2(_gnd_net_),
            .in3(N__1500),
            .lcout(shift_regZ0Z_2),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_3_LC_1_13_1.C_ON=1'b0;
    defparam shift_reg_3_LC_1_13_1.SEQ_MODE=4'b1010;
    defparam shift_reg_3_LC_1_13_1.LUT_INIT=16'b1100110010101010;
    LogicCell40 shift_reg_3_LC_1_13_1 (
            .in0(N__1370),
            .in1(N__1632),
            .in2(_gnd_net_),
            .in3(N__2181),
            .lcout(shift_regZ0Z_3),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_4_LC_1_13_2.C_ON=1'b0;
    defparam shift_reg_4_LC_1_13_2.SEQ_MODE=4'b1010;
    defparam shift_reg_4_LC_1_13_2.LUT_INIT=16'b1110111001000100;
    LogicCell40 shift_reg_4_LC_1_13_2 (
            .in0(N__2180),
            .in1(N__1358),
            .in2(_gnd_net_),
            .in3(N__1542),
            .lcout(shift_regZ0Z_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_5_LC_1_13_3.C_ON=1'b0;
    defparam shift_reg_5_LC_1_13_3.SEQ_MODE=4'b1010;
    defparam shift_reg_5_LC_1_13_3.LUT_INIT=16'b1100110010101010;
    LogicCell40 shift_reg_5_LC_1_13_3 (
            .in0(N__1346),
            .in1(N__1590),
            .in2(_gnd_net_),
            .in3(N__2182),
            .lcout(shift_regZ0Z_5),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_0_LC_1_13_4.C_ON=1'b0;
    defparam shift_reg_0_LC_1_13_4.SEQ_MODE=4'b1010;
    defparam shift_reg_0_LC_1_13_4.LUT_INIT=16'b1110111001000100;
    LogicCell40 shift_reg_0_LC_1_13_4 (
            .in0(N__2177),
            .in1(N__1335),
            .in2(_gnd_net_),
            .in3(N__1614),
            .lcout(shift_regZ0Z_0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_7_LC_1_13_5.C_ON=1'b0;
    defparam shift_reg_7_LC_1_13_5.SEQ_MODE=4'b1010;
    defparam shift_reg_7_LC_1_13_5.LUT_INIT=16'b1100110010101010;
    LogicCell40 shift_reg_7_LC_1_13_5 (
            .in0(N__1283),
            .in1(N__1521),
            .in2(_gnd_net_),
            .in3(N__2184),
            .lcout(shift_regZ0Z_7),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_1_LC_1_13_6.C_ON=1'b0;
    defparam shift_reg_1_LC_1_13_6.SEQ_MODE=4'b1010;
    defparam shift_reg_1_LC_1_13_6.LUT_INIT=16'b1110111001000100;
    LogicCell40 shift_reg_1_LC_1_13_6 (
            .in0(N__2178),
            .in1(N__1319),
            .in2(_gnd_net_),
            .in3(N__1254),
            .lcout(shift_regZ0Z_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam shift_reg_6_LC_1_13_7.C_ON=1'b0;
    defparam shift_reg_6_LC_1_13_7.SEQ_MODE=4'b1010;
    defparam shift_reg_6_LC_1_13_7.LUT_INIT=16'b1100110010101010;
    LogicCell40 shift_reg_6_LC_1_13_7 (
            .in0(N__1295),
            .in1(N__1233),
            .in2(_gnd_net_),
            .in3(N__2183),
            .lcout(shift_regZ0Z_6),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1899),
            .ce(N__1856),
            .sr(N__1836));
    defparam din_reg_1_LC_1_14_0.C_ON=1'b0;
    defparam din_reg_1_LC_1_14_0.SEQ_MODE=4'b1010;
    defparam din_reg_1_LC_1_14_0.LUT_INIT=16'b1111111100000000;
    LogicCell40 din_reg_1_LC_1_14_0 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1272),
            .lcout(din_regZ0Z_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1901),
            .ce(N__1584),
            .sr(N__1841));
    defparam din_reg_6_LC_1_14_1.C_ON=1'b0;
    defparam din_reg_6_LC_1_14_1.SEQ_MODE=4'b1010;
    defparam din_reg_6_LC_1_14_1.LUT_INIT=16'b1111111100000000;
    LogicCell40 din_reg_6_LC_1_14_1 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1248),
            .lcout(din_regZ0Z_6),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1901),
            .ce(N__1584),
            .sr(N__1841));
    defparam din_reg_4_LC_1_14_3.C_ON=1'b0;
    defparam din_reg_4_LC_1_14_3.SEQ_MODE=4'b1010;
    defparam din_reg_4_LC_1_14_3.LUT_INIT=16'b1010101010101010;
    LogicCell40 din_reg_4_LC_1_14_3 (
            .in0(N__1557),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(din_regZ0Z_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1901),
            .ce(N__1584),
            .sr(N__1841));
    defparam din_reg_7_LC_1_14_4.C_ON=1'b0;
    defparam din_reg_7_LC_1_14_4.SEQ_MODE=4'b1010;
    defparam din_reg_7_LC_1_14_4.LUT_INIT=16'b1111111100000000;
    LogicCell40 din_reg_7_LC_1_14_4 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1536),
            .lcout(din_regZ0Z_7),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1901),
            .ce(N__1584),
            .sr(N__1841));
    defparam din_reg_2_LC_1_14_5.C_ON=1'b0;
    defparam din_reg_2_LC_1_14_5.SEQ_MODE=4'b1010;
    defparam din_reg_2_LC_1_14_5.LUT_INIT=16'b1111111100000000;
    LogicCell40 din_reg_2_LC_1_14_5 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1515),
            .lcout(din_regZ0Z_2),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1901),
            .ce(N__1584),
            .sr(N__1841));
    defparam currentState_s_0_LC_2_8_4.C_ON=1'b0;
    defparam currentState_s_0_LC_2_8_4.SEQ_MODE=4'b1010;
    defparam currentState_s_0_LC_2_8_4.LUT_INIT=16'b1111111101000100;
    LogicCell40 currentState_s_0_LC_2_8_4 (
            .in0(N__1402),
            .in1(N__1426),
            .in2(_gnd_net_),
            .in3(N__1777),
            .lcout(dataReceived_out_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1900),
            .ce(),
            .sr(N__1837));
    defparam pulseCounter_cnt_RNO_0_2_LC_2_10_4.C_ON=1'b0;
    defparam pulseCounter_cnt_RNO_0_2_LC_2_10_4.SEQ_MODE=4'b0000;
    defparam pulseCounter_cnt_RNO_0_2_LC_2_10_4.LUT_INIT=16'b1001100101010101;
    LogicCell40 pulseCounter_cnt_RNO_0_2_LC_2_10_4 (
            .in0(N__1449),
            .in1(N__1490),
            .in2(_gnd_net_),
            .in3(N__1471),
            .lcout(),
            .ltout(pulseCounter_cnt_r_sx_2_cascade_),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam pulseCounter_cnt_2_LC_2_10_5.C_ON=1'b0;
    defparam pulseCounter_cnt_2_LC_2_10_5.SEQ_MODE=4'b1000;
    defparam pulseCounter_cnt_2_LC_2_10_5.LUT_INIT=16'b0000111100001100;
    LogicCell40 pulseCounter_cnt_2_LC_2_10_5 (
            .in0(_gnd_net_),
            .in1(N__1728),
            .in2(N__1452),
            .in3(N__1754),
            .lcout(pulseCounter_cntZ0Z_2),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(INVpulseCounter_cnt_2C_net),
            .ce(),
            .sr(_gnd_net_));
    defparam currentState_s_3_LC_2_11_0.C_ON=1'b0;
    defparam currentState_s_3_LC_2_11_0.SEQ_MODE=4'b1010;
    defparam currentState_s_3_LC_2_11_0.LUT_INIT=16'b1111111100000010;
    LogicCell40 currentState_s_3_LC_2_11_0 (
            .in0(N__1686),
            .in1(N__1705),
            .in2(N__1409),
            .in3(N__2176),
            .lcout(currentState_sZ0Z_3),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_6_LC_2_11_1.C_ON=1'b0;
    defparam currentState_s_6_LC_2_11_1.SEQ_MODE=4'b1011;
    defparam currentState_s_6_LC_2_11_1.LUT_INIT=16'b1101000011000000;
    LogicCell40 currentState_s_6_LC_2_11_1 (
            .in0(N__1707),
            .in1(N__1433),
            .in2(N__1410),
            .in3(N__1685),
            .lcout(currentState_sZ0Z_6),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_2_LC_2_11_2.C_ON=1'b0;
    defparam currentState_s_2_LC_2_11_2.SEQ_MODE=4'b1010;
    defparam currentState_s_2_LC_2_11_2.LUT_INIT=16'b1111111101000100;
    LogicCell40 currentState_s_2_LC_2_11_2 (
            .in0(N__1922),
            .in1(N__2004),
            .in2(_gnd_net_),
            .in3(N__1947),
            .lcout(shifting_out_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_4_LC_2_11_3.C_ON=1'b0;
    defparam currentState_s_4_LC_2_11_3.SEQ_MODE=4'b1010;
    defparam currentState_s_4_LC_2_11_3.LUT_INIT=16'b1111111100000000;
    LogicCell40 currentState_s_4_LC_2_11_3 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1573),
            .lcout(currentState_sZ0Z_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_1_LC_2_11_4.C_ON=1'b0;
    defparam currentState_s_1_LC_2_11_4.SEQ_MODE=4'b1010;
    defparam currentState_s_1_LC_2_11_4.LUT_INIT=16'b1100110000000000;
    LogicCell40 currentState_s_1_LC_2_11_4 (
            .in0(_gnd_net_),
            .in1(N__1920),
            .in2(_gnd_net_),
            .in3(N__2002),
            .lcout(currentState_sZ0Z_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_fast_1_LC_2_11_5.C_ON=1'b0;
    defparam currentState_s_fast_1_LC_2_11_5.SEQ_MODE=4'b1010;
    defparam currentState_s_fast_1_LC_2_11_5.LUT_INIT=16'b1010101000000000;
    LogicCell40 currentState_s_fast_1_LC_2_11_5 (
            .in0(N__2003),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1921),
            .lcout(currentState_s_fastZ0Z_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_fast_2_LC_2_11_6.C_ON=1'b0;
    defparam currentState_s_fast_2_LC_2_11_6.SEQ_MODE=4'b1010;
    defparam currentState_s_fast_2_LC_2_11_6.LUT_INIT=16'b1111111101000100;
    LogicCell40 currentState_s_fast_2_LC_2_11_6 (
            .in0(N__1923),
            .in1(N__1730),
            .in2(_gnd_net_),
            .in3(N__1948),
            .lcout(currentState_s_fastZ0Z_2),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam currentState_s_5_LC_2_11_7.C_ON=1'b0;
    defparam currentState_s_5_LC_2_11_7.SEQ_MODE=4'b1010;
    defparam currentState_s_5_LC_2_11_7.LUT_INIT=16'b1010101000000000;
    LogicCell40 currentState_s_5_LC_2_11_7 (
            .in0(N__1706),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1684),
            .lcout(currentState_sZ0Z_5),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1889),
            .ce(),
            .sr(N__1835));
    defparam serialD_outZ0_LC_2_12_0.C_ON=1'b0;
    defparam serialD_outZ0_LC_2_12_0.SEQ_MODE=4'b1010;
    defparam serialD_outZ0_LC_2_12_0.LUT_INIT=16'b1111111100000000;
    LogicCell40 serialD_outZ0_LC_2_12_0 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1673),
            .lcout(serialD_out_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(INVserialD_outZ0C_net),
            .ce(),
            .sr(N__1838));
    defparam din_reg_3_LC_2_13_1.C_ON=1'b0;
    defparam din_reg_3_LC_2_13_1.SEQ_MODE=4'b1010;
    defparam din_reg_3_LC_2_13_1.LUT_INIT=16'b1111111100000000;
    LogicCell40 din_reg_3_LC_2_13_1 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__1650),
            .lcout(din_regZ0Z_3),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1898),
            .ce(N__1580),
            .sr(N__1842));
    defparam din_reg_0_LC_2_13_2.C_ON=1'b0;
    defparam din_reg_0_LC_2_13_2.SEQ_MODE=4'b1010;
    defparam din_reg_0_LC_2_13_2.LUT_INIT=16'b1010101010101010;
    LogicCell40 din_reg_0_LC_2_13_2 (
            .in0(N__1626),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(din_regZ0Z_0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1898),
            .ce(N__1580),
            .sr(N__1842));
    defparam din_reg_5_LC_2_13_7.C_ON=1'b0;
    defparam din_reg_5_LC_2_13_7.SEQ_MODE=4'b1010;
    defparam din_reg_5_LC_2_13_7.LUT_INIT=16'b1010101010101010;
    LogicCell40 din_reg_5_LC_2_13_7 (
            .in0(N__1608),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(din_regZ0Z_5),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1898),
            .ce(N__1580),
            .sr(N__1842));
    defparam shiftBitsIn_s_0_LC_3_9_0.C_ON=1'b1;
    defparam shiftBitsIn_s_0_LC_3_9_0.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_0_LC_3_9_0.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_0_LC_3_9_0 (
            .in0(N__2130),
            .in1(N__2069),
            .in2(_gnd_net_),
            .in3(N__1809),
            .lcout(shiftBitsIn_sZ0Z_0),
            .ltout(),
            .carryin(bfn_3_9_0_),
            .carryout(shiftBitsIn_s_cry_0),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_1_LC_3_9_1.C_ON=1'b1;
    defparam shiftBitsIn_s_1_LC_3_9_1.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_1_LC_3_9_1.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_1_LC_3_9_1 (
            .in0(N__2126),
            .in1(N__2238),
            .in2(_gnd_net_),
            .in3(N__1806),
            .lcout(shiftBitsIn_sZ0Z_1),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_0),
            .carryout(shiftBitsIn_s_cry_1),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_2_LC_3_9_2.C_ON=1'b1;
    defparam shiftBitsIn_s_2_LC_3_9_2.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_2_LC_3_9_2.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_2_LC_3_9_2 (
            .in0(N__2131),
            .in1(N__2256),
            .in2(_gnd_net_),
            .in3(N__1803),
            .lcout(shiftBitsIn_sZ0Z_2),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_1),
            .carryout(shiftBitsIn_s_cry_2),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_3_LC_3_9_3.C_ON=1'b1;
    defparam shiftBitsIn_s_3_LC_3_9_3.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_3_LC_3_9_3.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_3_LC_3_9_3 (
            .in0(N__2127),
            .in1(N__2221),
            .in2(_gnd_net_),
            .in3(N__1800),
            .lcout(shiftBitsIn_sZ0Z_3),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_2),
            .carryout(shiftBitsIn_s_cry_3),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_4_LC_3_9_4.C_ON=1'b1;
    defparam shiftBitsIn_s_4_LC_3_9_4.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_4_LC_3_9_4.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_4_LC_3_9_4 (
            .in0(N__2132),
            .in1(N__2202),
            .in2(_gnd_net_),
            .in3(N__1797),
            .lcout(shiftBitsIn_sZ0Z_4),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_3),
            .carryout(shiftBitsIn_s_cry_4),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_5_LC_3_9_5.C_ON=1'b1;
    defparam shiftBitsIn_s_5_LC_3_9_5.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_5_LC_3_9_5.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_5_LC_3_9_5 (
            .in0(N__2128),
            .in1(N__2052),
            .in2(_gnd_net_),
            .in3(N__1794),
            .lcout(shiftBitsIn_sZ0Z_5),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_4),
            .carryout(shiftBitsIn_s_cry_5),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_6_LC_3_9_6.C_ON=1'b1;
    defparam shiftBitsIn_s_6_LC_3_9_6.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_6_LC_3_9_6.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_6_LC_3_9_6 (
            .in0(N__2133),
            .in1(N__2087),
            .in2(_gnd_net_),
            .in3(N__1791),
            .lcout(shiftBitsIn_sZ0Z_6),
            .ltout(),
            .carryin(shiftBitsIn_s_cry_5),
            .carryout(shiftBitsIn_s_cry_6),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam shiftBitsIn_s_7_LC_3_9_7.C_ON=1'b0;
    defparam shiftBitsIn_s_7_LC_3_9_7.SEQ_MODE=4'b1010;
    defparam shiftBitsIn_s_7_LC_3_9_7.LUT_INIT=16'b0001000101000100;
    LogicCell40 shiftBitsIn_s_7_LC_3_9_7 (
            .in0(N__2129),
            .in1(N__2103),
            .in2(_gnd_net_),
            .in3(N__1788),
            .lcout(shiftBitsIn_sZ0Z_7),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1895),
            .ce(N__1857),
            .sr(N__1839));
    defparam dataReceived_s_RNO_0_LC_3_10_1.C_ON=1'b0;
    defparam dataReceived_s_RNO_0_LC_3_10_1.SEQ_MODE=4'b0000;
    defparam dataReceived_s_RNO_0_LC_3_10_1.LUT_INIT=16'b0000010000000000;
    LogicCell40 dataReceived_s_RNO_0_LC_3_10_1 (
            .in0(N__2068),
            .in1(N__2255),
            .in2(N__2223),
            .in3(N__2237),
            .lcout(dataReceived_s_0_sqmuxa_0_a2_1),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam dataReceived_s_RNO_1_LC_3_10_2.C_ON=1'b0;
    defparam dataReceived_s_RNO_1_LC_3_10_2.SEQ_MODE=4'b0000;
    defparam dataReceived_s_RNO_1_LC_3_10_2.LUT_INIT=16'b0000000000000001;
    LogicCell40 dataReceived_s_RNO_1_LC_3_10_2 (
            .in0(N__2051),
            .in1(N__2102),
            .in2(N__2088),
            .in3(N__2201),
            .lcout(dataReceived_s_0_sqmuxa_0_a2_4_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam shiftBitsIn_s_RNIEA771_1_LC_3_10_3.C_ON=1'b0;
    defparam shiftBitsIn_s_RNIEA771_1_LC_3_10_3.SEQ_MODE=4'b0000;
    defparam shiftBitsIn_s_RNIEA771_1_LC_3_10_3.LUT_INIT=16'b0000000000001000;
    LogicCell40 shiftBitsIn_s_RNIEA771_1_LC_3_10_3 (
            .in0(N__2254),
            .in1(N__2236),
            .in2(N__2222),
            .in3(N__2200),
            .lcout(),
            .ltout(N_30_mux_i_0_a3_4_cascade_),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam currentState_s_RNI64AR2_4_LC_3_10_4.C_ON=1'b0;
    defparam currentState_s_RNI64AR2_4_LC_3_10_4.SEQ_MODE=4'b0000;
    defparam currentState_s_RNI64AR2_4_LC_3_10_4.LUT_INIT=16'b1111110011001100;
    LogicCell40 currentState_s_RNI64AR2_4_LC_3_10_4 (
            .in0(_gnd_net_),
            .in1(N__2158),
            .in2(N__2136),
            .in3(N__2037),
            .lcout(N_14),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam shiftBitsIn_s_RNIMI771_7_LC_3_10_5.C_ON=1'b0;
    defparam shiftBitsIn_s_RNIMI771_7_LC_3_10_5.SEQ_MODE=4'b0000;
    defparam shiftBitsIn_s_RNIMI771_7_LC_3_10_5.LUT_INIT=16'b0000000000010000;
    LogicCell40 shiftBitsIn_s_RNIMI771_7_LC_3_10_5 (
            .in0(N__2101),
            .in1(N__2083),
            .in2(N__2070),
            .in3(N__2050),
            .lcout(N_30_mux_i_0_a3_5),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam dataReceived_s_LC_3_11_4.C_ON=1'b0;
    defparam dataReceived_s_LC_3_11_4.SEQ_MODE=4'b1010;
    defparam dataReceived_s_LC_3_11_4.LUT_INIT=16'b1010000010000000;
    LogicCell40 dataReceived_s_LC_3_11_4 (
            .in0(N__2031),
            .in1(N__2005),
            .in2(N__1962),
            .in3(N__1949),
            .lcout(dataReceived_sZ0),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__1888),
            .ce(N__1855),
            .sr(N__1840));
endmodule // spi
