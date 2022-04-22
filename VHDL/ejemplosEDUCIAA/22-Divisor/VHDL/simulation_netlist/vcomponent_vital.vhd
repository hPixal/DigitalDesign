library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_Timing.all; 
USE IEEE.numeric_std.ALL;

package vcomponent_vital is 
   
component SB_CARRY 
            Port (  I0 : in  std_logic;
                    I1 : in  std_logic;
                    CI : in  std_logic;
                    CO : out  std_logic  
                 );
end component;

component SB_CARRY_IN_MUX 
             generic( C_INIT:bit_vector(1 downto 0) := "00";
		        Xon   : boolean := true;
                      MsgOn : boolean := false;
                      tipd_carry_init_in :VitalDelayType01:= (0.0 ns, 0.0 ns);  
                      tpd_carry_init_in_carry_init_out :VitalDelayType01 := (0.0 ns, 0.0 ns)
                     );
             port ( 
	               carry_init_out  : out  std_logic;
	               carry_init_in  : in  std_logic  
                  );
end component; 
     
component SB_LUT4 
            generic(LUT_INIT:bit_vector(15 downto 0):= "0000000000000000");
            port ( 
	           O  : out  std_logic;
	           I0  : in  std_logic;
	           I1  : in  std_logic;
	           I2  : in  std_logic;
	           I3  : in  std_logic  
                 );
end component; 
 
component SB_DFF 
           port ( 
	          Q  : out  std_logic;
	          D  : in  std_logic;
	          C  : in  std_logic  
               );	  
end component; 
 
component SB_DFFSR 
           port ( 
                 R  : in  std_logic;
	          Q  : out  std_logic;
	          D  : in  std_logic;
	          C  : in  std_logic 
                );	  
end component; 
 
component SB_DFFSS 
            port ( 
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFR 
            port ( 
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFS
            port ( 
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic  
                 );	  
end component; 
 
component SB_DFFE 
            port ( 
                  E  : in  std_logic ;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFESR 
            port ( 
                  E  : in  std_logic ;
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFESS 
            port ( 
                  E  : in  std_logic ;
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFER 
            port ( 
                  E  : in  std_logic ;
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFES 
            port ( 
                  E  : in  std_logic ;
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFN 
             port ( 
	            Q  : out  std_logic;
	            D  : in  std_logic;
	            C  : in  std_logic 
                   );	  
end component; 
 
component SB_DFFNSR 
            port ( 
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFNSS 
	     port ( 
	           S  : in  std_logic;
		    Q  : out  std_logic;
		    D  : in  std_logic;
		    C  : in  std_logic  
                 );		  
end component; 
	 
component SB_DFFNR 
            port ( 
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFNS 
            port ( 
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFNE 
            port ( 
                  E  : in  std_logic ;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );
end component; 
 
component SB_DFFNESR 
            port ( 
                  E  : in  std_logic ;
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component;
 
component SB_DFFNESS
            port ( 
                  E  : in  std_logic ;
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                 );	  
end component; 
 
component SB_DFFNER 
            port ( 
                  E  : in  std_logic ;
                  R  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic
                 );	  
end component; 
 
component SB_DFFNES 
            port ( 
                  E  : in  std_logic ;
                  S  : in  std_logic;
	           Q  : out  std_logic;
	           D  : in  std_logic;
	           C  : in  std_logic 
                );	  
end component; 
 
component SB_RAM4KNRNW

  generic ( 
           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLKN  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WCLKN  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));

           tpd_RCLKN_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));

           tsetup_RADDR_RCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RADDR_RCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RCLKE_RCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WADDR_WCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WDATA_WCLKN_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLKN_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLKN_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLKN_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RADDR_RCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RCLKE_RCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLKN_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLKN_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLKN_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLKN_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLKN_negedge : VitalDelayType := 0 ns;
           tpw_RCLKN_posedge : VitalDelayType := 0 ns;
           tpw_WCLKN_negedge : VitalDelayType := 0 ns;
           tpw_WCLKN_posedge : VitalDelayType := 0 ns;

           trecovery_RCLKN_WCLKN_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_RCLKN_WCLKN_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_RCLKN_WCLKN_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_RCLKN_WCLKN_negedge_posedge   : VitalDelayType                   := 0 ns;
           trecovery_WCLKN_RCLKN_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_WCLKN_RCLKN_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_WCLKN_RCLKN_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_WCLKN_RCLKN_negedge_posedge   : VitalDelayType                   := 0 ns;


           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN  : in  std_logic ;
                RCLKE : in  std_logic ;
                RE    : in  std_logic ;
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLKN  : in  std_logic ;
                WCLKE : in  std_logic ;
                WE    : in  std_logic ;
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component;

component SB_RAM4KNW 

  generic ( 
           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WCLKN  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));

           tpd_RCLK_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));
           tpd_RCLK_RDATA_posedge : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));

           tsetup_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WADDR_WCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WDATA_WCLKN_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLKN_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLKN_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLKN_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLKN_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLKN_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLKN_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLKN_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLK_negedge : VitalDelayType := 0 ns;
           tpw_RCLK_posedge : VitalDelayType := 0 ns;
           tpw_WCLKN_negedge : VitalDelayType := 0 ns;
           tpw_WCLKN_posedge : VitalDelayType := 0 ns;

           trecovery_RCLK_WCLKN_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_RCLK_WCLKN_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_RCLK_WCLKN_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_RCLK_WCLKN_negedge_posedge   : VitalDelayType                   := 0 ns;
           trecovery_WCLKN_RCLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_WCLKN_RCLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_WCLKN_RCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_WCLKN_RCLK_negedge_posedge   : VitalDelayType                   := 0 ns;


           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic ;
                RE    : in  std_logic ;
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLKN  : in  std_logic ;
                WCLKE : in  std_logic ;
                WE    : in  std_logic ;
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component;

component SB_RAM4KNR 

  generic ( 
           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLKN  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));

           tpd_RCLKN_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));

           tsetup_RADDR_RCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RADDR_RCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RCLKE_RCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLKN_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RADDR_RCLKN_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RCLKE_RCLKN_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLKN_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLKN_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLKN_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLKN_negedge : VitalDelayType := 0 ns;
           tpw_RCLKN_posedge : VitalDelayType := 0 ns;
           tpw_WCLK_negedge : VitalDelayType := 0 ns;
           tpw_WCLK_posedge : VitalDelayType := 0 ns;

           trecovery_RCLKN_WCLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_RCLKN_WCLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_RCLKN_WCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_RCLKN_WCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
           trecovery_WCLK_RCLKN_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_WCLK_RCLKN_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_WCLK_RCLKN_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_WCLK_RCLKN_negedge_posedge   : VitalDelayType                   := 0 ns;


           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN  : in  std_logic ;
                RCLKE : in  std_logic ;
                RE    : in  std_logic ;
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic ;
                WE    : in  std_logic ;
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component;

component SB_RAM4K 

  generic ( 
           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));

           tpd_RCLK_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));
           tpd_RCLK_RDATA_posedge : VitalDelayArrayType01(15 downto 0) := (others => (100 ns, 100 ns));

           tsetup_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           tsetup_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(7 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLK_negedge : VitalDelayType := 0 ns;
           tpw_RCLK_posedge : VitalDelayType := 0 ns;
           tpw_WCLK_negedge : VitalDelayType := 0 ns;
           tpw_WCLK_posedge : VitalDelayType := 0 ns;


           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic ;
                RE    : in  std_logic ;
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic ;
                WE    : in  std_logic ;
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component;

component SB_RAM256x16 
  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );

end component; 	  
  
component  SB_RAM256x16NR 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
  
end component; 

component  SB_RAM256x16NW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component; 


component SB_RAM256x16NRNW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 7  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 7  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15  downto 0)
               );
  
end component; 


component SB_RAM512x8 
  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 7  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 8  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 8  downto 0) ;
                WDATA : in  std_logic_vector( 7  downto 0)
               );
  
end component; 

component SB_RAM512x8NR 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 7  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 8  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 8  downto 0) ;
                WDATA : in  std_logic_vector( 7  downto 0)
               );
  
  
end component; 
  
component  SB_RAM512x8NW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 7  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 8  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 8  downto 0) ;
                WDATA : in  std_logic_vector( 7  downto 0)
               );
  
  
end component; 

component  SB_RAM512x8NRNW 
  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 7  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 8  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 8  downto 0) ;
                WDATA : in  std_logic_vector( 7  downto 0)
               );
  
  
end component ; 


component SB_RAM1024x4 
  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 3  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 9  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 9  downto 0) ;
                WDATA : in  std_logic_vector( 3  downto 0)
               );
  
  
end component ; 

component  SB_RAM1024x4NR 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 3  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 9  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 9  downto 0) ;
                WDATA : in  std_logic_vector( 3  downto 0)
               );
  
  
end component ; 

component  SB_RAM1024x4NW 

      generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 3  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 9  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 9  downto 0) ;
                WDATA : in  std_logic_vector( 3  downto 0)
               );
  
  
end component; 

component SB_RAM1024x4NRNW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 3  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 9  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 9  downto 0) ;
                WDATA : in  std_logic_vector( 3  downto 0)
               );
  
  
end component; 

component SB_RAM2048x2 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 1  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                WDATA : in  std_logic_vector( 1  downto 0)
               );
  
  
end component; 

component SB_RAM2048x2NR 
  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 1  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                WDATA : in  std_logic_vector( 1  downto 0)
               );

end component; 


component SB_RAM2048x2NW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 1  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                WDATA : in  std_logic_vector( 1  downto 0)
               );
  
  
end component; 

component  SB_RAM2048x2NRNW 

  generic ( 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 1  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                WDATA : in  std_logic_vector( 1  downto 0)
               );
  
  
end component; 


component SB_RAM40_4K 
  generic ( 
           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(10 downto 0) := (others => (0 ns, 0 ns));
           tipd_WCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(10 downto 0) := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));

           tpd_RCLK_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));
           tpd_RCLK_RDATA_posedge : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));

           tsetup_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           tsetup_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           tsetup_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           tsetup_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           thold_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(10 downto 0) := (others => 0 ns);
           thold_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(10 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(10 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLK_negedge : VitalDelayType := 0 ns;
           tpw_RCLK_posedge : VitalDelayType := 0 ns;
           tpw_WCLK_negedge : VitalDelayType := 0 ns;
           tpw_WCLK_posedge : VitalDelayType := 0 ns;


  	   WRITE_MODE : integer := 0; 
  	   READ_MODE  : integer := 0; 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15 downto 0)
               );
end component; 

component SB_RAM40_4KNR 
  generic ( 
  	   WRITE_MODE : integer := 0; 
  	   READ_MODE  : integer := 0; 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLK  : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15 downto 0)
               );
end component; 

component SB_RAM40_4KNW 

  generic ( 
  	   WRITE_MODE : integer := 0; 
  	   READ_MODE  : integer := 0; 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLK  : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15 downto 0)
               );
end component;  

component SB_RAM40_4KNRNW 
      	generic ( 
  	   WRITE_MODE : integer := 0 ; 
  	   READ_MODE  : integer := 0 ; 
           INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
            ) ;
          port( 
                RDATA : out std_logic_vector( 15  downto 0) ;
                RCLKN : in  std_logic ;
                RCLKE : in  std_logic := 'H';
                RE    : in  std_logic := 'L';
                RADDR : in  std_logic_vector( 10  downto 0) ;
                WCLKN : in  std_logic ;
                WCLKE : in  std_logic := 'H';
                WE    : in  std_logic := 'L';
                WADDR : in  std_logic_vector( 10  downto 0) ;
                MASK  : in  std_logic_vector( 15  downto 0) ;
                WDATA : in  std_logic_vector( 15 downto 0)
               );
end component;

-- SF8K Components  

component SB_TMDS_deserializer is
	generic 	(
	----------------------------------------------------------------------------------
        --VITAL PARAMETER
	---------------------------------------------------------------------------------
	TimingChecksOn  	: boolean := true;
	Xon   			: boolean := true;
	MsgOn 			: boolean := true;
	--- VITAL input port delay 
	tipd_TMDSch0p	  			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSch0n  				: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSch1p 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSch1n 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSch2p 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSch2n 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSclkp 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_TMDSclkn 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_RSTNdeser 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_RSTNpll	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_EN	       				: VitalDelayType01 := (0 ns, 0 ns);
	tipd_PHASELch0 	       			: VitalDelayArrayType01( 3 downto 0 )  :=(others => (0 ns, 0 ns));
	tipd_PHASELch1 	       			: VitalDelayArrayType01( 3 downto 0 )  :=(others => (0 ns, 0 ns)); 
	tipd_PHASELch2 	       			: VitalDelayArrayType01( 3 downto 0 )  :=(others => (0 ns, 0 ns)); 
	tipd_EXTFEEDBACK       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_DYNAMICDELAY       		: VitalDelayArrayType01( 7 downto 0 )  :=(others => (0 ns, 0 ns));
	tipd_BYPASS 	       			: VitalDelayType01 := (0 ns, 0 ns);
	tipd_LATCHINPUTVALUE 	       		: VitalDelayType01 := (0 ns, 0 ns);
	tipd_SDI       				: VitalDelayType01 := (0 ns, 0 ns);
	tipd_SCLK	       			: VitalDelayType01 := (0 ns, 0 ns);
	-- VITAL Path Delay 	
	tpd_TMDSclkp_PLLOUTGLOBALclkx1         	: VitalDelayType01 := (0 ns, 0 ns);
	tpd_TMDSclkp_PLLOUTCOREclkx1 	     	: VitalDelayType01 := (0 ns, 0 ns);
	tpd_TMDSclkp_PLLOUTGLOBALclkx5         	: VitalDelayType01 := (0 ns, 0 ns);
	tpd_TMDSclkp_PLLOUTCOREclkx5           	: VitalDelayType01 := (0 ns, 0 ns);
	-- VITAL clk-to-output path delay
        tpd_TMDSclkp_RAWDATAch0_posedge 	: VitalDelayArrayType01( 9 downto 0) := (others => (0 ns, 0 ns));
        tpd_TMDSclkp_RAWDATAch1_posedge 	: VitalDelayArrayType01( 9 downto 0) := (others => (0 ns, 0 ns));
        tpd_TMDSclkp_RAWDATAch2_posedge 	: VitalDelayArrayType01( 9 downto 0) := (others => (0 ns, 0 ns));
	-- VITAL Setup delays 
        tsetup_TMDSch0p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch0p_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch0p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch0p_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch0n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch0n_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch0n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch0n_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 

        tsetup_TMDSch1p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch1p_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch1p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch1p_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch1n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch1n_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch1n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch1n_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 

        tsetup_TMDSch2p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch2p_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch2p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch2p_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch2n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch2n_TMDSclkp_negedge_posedge	 	: VitalDelayType                   := 0 ns; 
        tsetup_TMDSch2n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
   	tsetup_TMDSch2n_TMDSclkp_negedge_negedge	 	: VitalDelayType                   := 0 ns; 

	-- VITAL Hold delays 
        thold_TMDSch0p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch0p_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch0p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch0p_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch0n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch0n_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch0n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch0n_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 

        thold_TMDSch1p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch1p_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch1p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch1p_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch1n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch1n_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch1n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch1n_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 

        thold_TMDSch2p_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch2p_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch2p_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch2p_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch2n_TMDSclkp_posedge_posedge 		: VitalDelayType                   := 0 ns; 
   	thold_TMDSch2n_TMDSclkp_negedge_posedge	 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch2n_TMDSclkp_posedge_negedge 		: VitalDelayType                   := 0 ns; 
        thold_TMDSch2n_TMDSclkp_negedge_negedge 		: VitalDelayType                   := 0 ns; 
	 --- DVI generic params 
	 FEEDBACK_PATH 			: string 		:= "PHASE_AND_DELAY" ;	   
	 DELAY_ADJUSTMENT_MODE_FEEDBACK : string 		:= "FIXED"; 
	 DELAY_ADJUSTMENT_MODE_RELATIVE : string		:= "FIXED"; 
	 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0):= "11"; 		--Set to div by 5 mode 
	 FDA_FEEDBACK			: bit_vector(3 downto 0):="0000"; 		
	 FDA_RELATIVE 			: bit_vector(3 downto 0):= "0000";  
	 PLLOUT_SELECT_PORTA 		: string 		:= "GENCLK";    	-- Clkx5
	 PLLOUT_SELECT_PORTB 		: string 		:= "SHIFTREG_0deg"; 	-- Clkx1
	 -- Frequency Parameters: Current defaults are for TMDS Clk = 30-40MHz 
	 DIVR 				: bit_vector(3 downto 0) := "0000"; 	
	 DIVF 				: bit_vector(6 downto 0) := "0000000"; 
	 DIVQ 				: bit_vector(2 downto 0) := "010"; 	
	 FILTER_RANGE 			: bit_vector(2 downto 0) := "011"; 	
	 ENABLE_ICEGATE_PORTA 		: bit			 := '0';
	 ENABLE_ICEGATE_PORTB 		: bit 			 := '0';
 	 -- Test Mode parameter
	 TEST_MODE 			: bit 			 := '0';
	 EXTERNAL_DIVIDE_FACTOR 	: integer		  := 1 		-- Required for  PLL Config Wizard.
	); 

	port	( 
        -- TMDS input interface
  	TMDSch0p		: in 	std_logic ;             		-- TMDS ch 0 differential input pos
	TMDSch0n		: in	std_logic ;             		-- TMDS ch 0 differential input neg
	TMDSch1p		: in	std_logic ; 	          		-- TMDS ch 1 differential input pos
	TMDSch1n		: in	std_logic ;   	        		-- TMDS ch 1 differential input neg
   	TMDSch2p		: in	std_logic ; 	        		-- TMDS ch 2 differential input pos
   	TMDSch2n		: in 	std_logic ;             		-- TMDS ch 2 differential input neg
   	TMDSclkp		: in	std_logic ;             		-- TMDS clock differential input pos
   	TMDSclkn		: in	std_logic ;             		-- TMDS clock differential input neg                                
        -- Receiver controller interface
  	RSTNdeser		: in 	std_logic ;             		-- Reset deserailzier logics- active low
	RSTNpll			: in	std_logic ;             		-- Reset deserializer PLL- active low
   	EN			: in	std_logic ;             		-- Enable deserializer- active high
    	PHASELch0		: in	std_logic_vector( 3 downto 0) ; 	--  Clock phase delay compensation select for ch 0
   	PHASELch1		: in	std_logic_vector( 3 downto 0) ; 	--  Clock phase delay compensation select for ch 1
   	PHASELch2		: in	std_logic_vector( 3 downto 0) ; 	--  Clock phase delay compensation select for ch 2
   	PLLlock			: out 	std_logic ;              	 	--  PLL lock signal- active high
   	PLLOUTGLOBALclkx1 	: out 	std_logic ;     			--  PLL output on global n/w 
   	PLLOUTCOREclkx1 	: out 	std_logic ;      			--  PLL output on global n/w 
   	PLLOUTGLOBALclkx5 	: out 	std_logic ; 	 			--  PLL output on global n/w 
   	PLLOUTCOREclkx5 	: out 	std_logic ;      			--  PLL output on global n/w
   	RAWDATAch0 		: out 	std_logic_vector( 9 downto 0) ;     	--  Recovered ch 0 10-bit data 
   	RAWDATAch1 		: out	std_logic_vector( 9 downto 0) ;     	--  Recovered ch 1 10-bit data
   	RAWDATAch2 		: out 	std_logic_vector( 9 downto 0) ;     	--  Recovered ch 2 10-bit data
  	EXTFEEDBACK	  	: in 	std_logic ;   			    	--  Driven by core logic. Not required HDMI mode.
  	DYNAMICDELAY 		: in 	std_logic_vector ( 7 downto 0 ) ;   	--  Driven by core logic. Not required for HDMI mode.
  	BYPASS			: in 	std_logic ; 		    		--  Driven by core logic. Not required for HDMI mode.
  	LATCHINPUTVALUE 	: in 	std_logic ;  		    		--  iCEGate signal. Not required for HDMI mode
	-- Test Pins
  	SDO 			: out 	std_logic ; 		    		--  Output of PLL
  	SDI			: in 	std_logic ; 		    		--  Driven by core logic
  	SCLK			: in    std_logic 		    		--  Driven by core logic
  	);

end  component;  

component  SB_MIPI_RX_2LANE is
        generic  (

                ----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn          : boolean := true;
                Xon                     : boolean := true;
                MsgOn                   : boolean := false;
                --- VITAL input port delay
                tipd_ENPDESER                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_PU                                 : VitalDelayType01 := (0 ns, 0 ns);
                tipd_DP0                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_DN0                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0TXLPEN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0DTXLPP                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0DTXLPN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0RXLPEN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0CDEN                             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0RXHSEN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D0HSDESEREN                        : VitalDelayType01 := (0 ns, 0 ns);
                tipd_DP1                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_DN1                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D1RXLPEN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D1RXHSEN                           : VitalDelayType01 := (0 ns, 0 ns);
                tipd_D1HSDESEREN                        : VitalDelayType01 := (0 ns, 0 ns);
                tipd_CKP                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_CKN                                : VitalDelayType01 := (0 ns, 0 ns);
                tipd_CLKRXLPEN                          : VitalDelayType01 := (0 ns, 0 ns);
                tipd_CLKRXHSEN                          : VitalDelayType01 := (0 ns, 0 ns);
                -- VITAL Path Delay
                tpd_DP0_D0DRXLPP                        : VitalDelayType01 := (0 ns, 0 ns);
                tpd_DN0_D0DRXLPN                        : VitalDelayType01 := (0 ns, 0 ns);
                tpd_DP0_D0DCDP                          : VitalDelayType01 := (0 ns, 0 ns);
                tpd_DN0_D0DCDN                          : VitalDelayType01 := (0 ns, 0 ns);
                tpd_DP1_D1DRXLPP                        : VitalDelayType01 := (0 ns, 0 ns);
                tpd_DN1_D1DRXLPN                        : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_CLKDRXLPP                       : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKN_CLKDRXLPN                       : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_CLKHSBYTE                       : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D0HSBYTECLKD                    : VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL clk-to-output path delay
                tpd_CKP_D0HSRXDATA_posedge              : VitalDelayArrayType01( 7 downto 0) := (others => (0 ns, 0 ns));
                tpd_CKP_D1HSRXDATA_posedge              :  VitalDelayArrayType01(7 downto 0) := (others => (0 ns, 0 ns));

                tpd_CKP_D0SYNC_posedge                  : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D0ERRSYNC_posedge               : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D0NOSYNC_negedge                : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D1SYNC_posedge                  : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D1ERRSYNC_posedge               : VitalDelayType01 := (0 ns, 0 ns);
                tpd_CKP_D1NOSYNC_negedge                : VitalDelayType01 := (0 ns, 0 ns);

		-- VITAL Setup delays
                tsetup_DP0_CKP_posedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DP0_CKP_negedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DP0_CKP_posedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DP0_CKP_negedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DN0_CKP_posedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DN0_CKP_negedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DN0_CKP_posedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DN0_CKP_negedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DP1_CKP_posedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DP1_CKP_negedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DP1_CKP_posedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DP1_CKP_negedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DN1_CKP_posedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DN1_CKP_negedge_posedge          : VitalDelayType                   := 0 ns;
                tsetup_DN1_CKP_posedge_negedge          : VitalDelayType                   := 0 ns;
                tsetup_DN1_CKP_negedge_negedge          : VitalDelayType                   := 0 ns;
                -- VITAL Hold delays
                thold_DP0_CKP_posedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DP0_CKP_negedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DP0_CKP_posedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DP0_CKP_negedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DN0_CKP_posedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DN0_CKP_negedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DN0_CKP_posedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DN0_CKP_negedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DP1_CKP_posedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DP1_CKP_negedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DP1_CKP_posedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DP1_CKP_negedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DN1_CKP_posedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DN1_CKP_negedge_posedge           : VitalDelayType                   := 0 ns;
                thold_DN1_CKP_posedge_negedge           : VitalDelayType                   := 0 ns;
                thold_DN1_CKP_negedge_negedge           : VitalDelayType                   := 0 ns
                );
		port   (
                -- Common Interface Pins
                ENPDESER        : in            std_logic ;
                PU              : in            std_logic ;
                -- Data0 Interface Pins
                DP0             : in            std_logic ;
                DN0             : in            std_logic ;
                D0RXHSEN        : in            std_logic ;
                D0DTXLPP        : in            std_logic ;
                D0DTXLPN        : in            std_logic ;
                D0TXLPEN        : in            std_logic ;
                D0DRXLPP        : out           std_logic ;
                D0DRXLPN        : out           std_logic ;
                D0RXLPEN        : in            std_logic ;
                D0DCDP          : out           std_logic ;
                D0DCDN          : out           std_logic ;
                D0CDEN          : in            std_logic ;
                D0HSDESEREN     : in            std_logic ;
                D0HSRXDATA      : out           std_logic_vector ( 7 downto 0) ;
                D0HSBYTECLKD    : out           std_logic ;
                D0SYNC          : out           std_logic ;
                D0ERRSYNC       : out           std_logic ;
                D0NOSYNC        : out           std_logic ;
                --  DATA1 Interface Pins
                DP1             : in            std_logic ;
                DN1             : in            std_logic ;
                D1RXHSEN        : in            std_logic ;
                D1DRXLPP        : out           std_logic ;
                D1DRXLPN        : out           std_logic ;
                D1RXLPEN        : in            std_logic ;
                D1HSDESEREN     : in            std_logic ;
                D1HSRXDATA      : out           std_logic_vector ( 7 downto 0) ;
                D1SYNC          : out           std_logic ;
                D1ERRSYNC       : out           std_logic ;
                D1NOSYNC        : out           std_logic ;
                --  CLOCK Interface Pins
                CKP             : in            std_logic ;
                CKN             : in            std_logic ;
                CLKRXHSEN       : in            std_logic ;
                CLKDRXLPP       : out           std_logic ;
                CLKDRXLPN       : out           std_logic ;
                CLKRXLPEN       : in            std_logic ;
                CLKHSBYTE       : out           std_logic
                );

end component;


-- SF16K Components 

component SB_MAC16 is
 
	generic ( 	
	
		TimingChecksOn : boolean := true;
		Xon   : boolean := true;
		MsgOn : boolean := true;
		tipd_A		:VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
		tipd_B		: VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
		tipd_C		:VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
		tipd_D		: VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
		tipd_CLK		: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_CE		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_IRSTTOP 	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
	    tipd_IRSTBOT 	: VitalDelayType01 := (0.000 ns, 0.000 ns);  
		tipd_ORSTTOP 	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_ORSTBOT 	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_AHOLD 		:VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_BHOLD		: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_CHOLD		: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_DHOLD		: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_OHOLDTOP	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_OHOLDBOT	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_OLOADTOP	:VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_OLOADBOT	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_ADDSUBTOP	: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_ADDSUBBOT	: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_CI		: VitalDelayType01 := (0.000 ns, 0.000 ns); 
		tipd_ACCUMCI		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_SIGNEXTIN	: VitalDelayType01 := (0.000 ns, 0.000 ns);	
		
		tpd_IRSTBOT_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_CLK_O_posedge : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_ORSTBOT_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_ORSTTOP_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_CI_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_ADDSUBTOP_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_ADDSUBBOT_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_OLOADTOP_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns)); 
		tpd_OLOADBOT_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_A_CO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_A_ACCUMCO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_B_CO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_B_ACCUMCO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_C_CO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_C_ACCUMCO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_D_CO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_D_ACCUMCO : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));	
		tpd_CI_CO : VitalDelayType01 := (0.000 ns, 0.000 ns);		
		tpd_CI_ACCUMCO : VitalDelayType01 := (0.000 ns, 0.000 ns)	;
		tpd_OLOADTOP_CO : VitalDelayType01 := (0.000 ns, 0.000 ns);		
		tpd_OLOADTOP_ACCUMCO : VitalDelayType01 := (0.000 ns, 0.000 ns);	
		tpd_OLOADBOT_CO : VitalDelayType01 := (0.000 ns, 0.000 ns);		
		tpd_OLOADBOT_ACCUMCO : VitalDelayType01 := (0.000 ns, 0.000 ns)	;	
		tpd_ADDSUBBOT_CO : VitalDelayType01 := (0.000 ns, 0.000 ns);		
		tpd_ADDSUBBOT_ACCUMCO : VitalDelayType01 := (0.000 ns, 0.000 ns)	;	
		tpd_CLK_CO_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);		
		tpd_CLK_ACCUMCO_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns)	;	
		tpd_ACCUMCI_CO : VitalDelayType01 := (0.000 ns, 0.000 ns);	
		tpd_ACCUMCI_ACCUMCO : VitalDelayType01 := (0.000 ns, 0.000 ns)	;	
		tpd_ACCUMCI_O : VitalDelayArrayType01(31 downto 0) := (others => (0.0 ns, 0.0 ns));
		
		tpd_A_SIGNEXTOUT : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_B_SIGNEXTOUT : VitalDelayArrayType01(15 downto 0) := (others => (0.0 ns, 0.0 ns));
		tpd_CLK_SIGNEXTOUT_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_ADDSUBTOP_ACCUMCO                : VitalDelayType01 := (0 ns, 0 ns);
		tpd_ADDSUBTOP_CO                : VitalDelayType01 := (0 ns, 0 ns);
		
		tpd_A_O : VitalDelayArrayType01(511 downto 0):= (others => (0.0 ns, 0.0 ns)); 
		tpd_B_O : VitalDelayArrayType01(511 downto 0) := (others => (0.0 ns, 0.0 ns)); 
		tpd_C_O : VitalDelayArrayType01(511 downto 0) := (others => (0.0 ns, 0.0 ns)); 
		tpd_D_O : VitalDelayArrayType01(511 downto 0) := (others => (0.0 ns, 0.0 ns));

		 tsetup_A_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_A_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_B_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_B_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_C_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_C_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_D_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 tsetup_D_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);		 
		 tsetup_ADDSUBTOP_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 tsetup_ADDSUBTOP_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_ADDSUBBOT_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_ADDSUBBOT_CLK_negedge_posedge : VitalDelayType := 0 ns;
		 tsetup_OLOADTOP_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 tsetup_OLOADTOP_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_OLOADBOT_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_OLOADBOT_CLK_negedge_posedge : VitalDelayType := 0 ns;	
		 tsetup_OHOLDBOT_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 tsetup_OHOLDBOT_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_OHOLDTOP_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_OHOLDTOP_CLK_negedge_posedge : VitalDelayType := 0 ns;	
		 tsetup_AHOLD_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 tsetup_AHOLD_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_BHOLD_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_BHOLD_CLK_negedge_posedge : VitalDelayType := 0 ns;
		 tsetup_CHOLD_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 tsetup_CHOLD_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_DHOLD_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 tsetup_DHOLD_CLK_negedge_posedge : VitalDelayType := 0 ns;			 
		 tsetup_CI_CLK_posedge_posedge : VitalDelayType  := 0 ns;	  
		 tsetup_CI_CLK_negedge_posedge : VitalDelayType := 0 ns;		 
		 tsetup_ACCUMCI_CLK_posedge_posedge : VitalDelayType  := 0 ns;	  
		 tsetup_ACCUMCI_CLK_negedge_posedge : VitalDelayType := 0 ns;
		
		 thold_A_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_A_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_B_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_B_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_C_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_C_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_D_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);
		 thold_D_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0)  := (others => 0 ns);		 
		 thold_ADDSUBTOP_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 thold_ADDSUBTOP_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 thold_ADDSUBBOT_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_ADDSUBBOT_CLK_negedge_posedge : VitalDelayType := 0 ns;
		 thold_OLOADTOP_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 thold_OLOADTOP_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 thold_OLOADBOT_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_OLOADBOT_CLK_negedge_posedge : VitalDelayType := 0 ns;
		 thold_OHOLDBOT_CLK_posedge_posedge	: VitalDelayType := 0 ns;
		 thold_OHOLDBOT_CLK_negedge_posedge	: VitalDelayType := 0 ns;  
		  thold_OHOLDTOP_CLK_posedge_posedge	: VitalDelayType := 0 ns;
		  thold_OHOLDTOP_CLK_negedge_posedge	: VitalDelayType := 0 ns;
		 thold_AHOLD_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 thold_AHOLD_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 thold_BHOLD_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_BHOLD_CLK_negedge_posedge : VitalDelayType := 0 ns;
		 thold_CHOLD_CLK_posedge_posedge : VitalDelayType := 0 ns;
		 thold_CHOLD_CLK_negedge_posedge : VitalDelayType  := 0 ns;
		 thold_DHOLD_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_DHOLD_CLK_negedge_posedge : VitalDelayType := 0 ns;			 
		 thold_CI_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_CI_CLK_negedge_posedge : VitalDelayType := 0 ns;	
		 thold_ACCUMCI_CLK_posedge_posedge : VitalDelayType  := 0 ns;
		 thold_ACCUMCI_CLK_negedge_posedge : VitalDelayType := 0 ns;

		 tpw_CLK_negedge : VitalDelayType := 0 ns;
		 tpw_CLK_posedge : VitalDelayType := 0 ns;
		 tperiod_CLK_posedge : VitalDelayType := 0 ns;


           trecovery_IRSTTOP_CLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_IRSTTOP_CLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_IRSTTOP_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_IRSTTOP_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
           trecovery_IRSTBOT_CLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_IRSTBOT_CLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_IRSTBOT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_IRSTBOT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
		   
		   trecovery_ORSTTOP_CLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_ORSTTOP_CLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_ORSTTOP_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_ORSTTOP_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
           trecovery_ORSTBOT_CLK_posedge_posedge  : VitalDelayType                   := 0 ns;
           trecovery_ORSTBOT_CLK_negedge_posedge  : VitalDelayType                   := 0 ns;
           tremoval_ORSTBOT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
           tremoval_ORSTBOT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
		 
		 
		NEG_TRIGGER 			: bit 		:='0'; 
		 C_REG				: bit 		:='0'; 		-- C0
		 A_REG				: bit 		:='0'; 	    	-- C1 
		 B_REG				: bit 		:='0';		-- C2
		 D_REG 				: bit 		:='0';		-- C3

		 TOP_8x8_MULT_REG		: bit 		:='0'; 	   	-- C4
		 BOT_8x8_MULT_REG		: bit 		:='0';	   	-- C5
		 PIPELINE_16x16_MULT_REG1	: bit 		:='0';		-- C6
		 PIPELINE_16x16_MULT_REG2	: bit 		:='0';		-- C7

		 TOPOUTPUT_SELECT      		: bit_vector(1 downto 0) := "00" ;	-- COMB, ACCUM_REG, MULT_8x8, MULT_16x16 //{C9,C8}   = 00, 01, 10, 11
		 TOPADDSUB_LOWERINPUT  		: bit_vector(1 downto 0) := "00" ; 	-- DATA, MULT_8x8, MULT_16x16, SIGNEXT 	 //{C11,C10} = 00, 01, 10, 11
		 TOPADDSUB_UPPERINPUT  		: bit 			 := '0'  ; 	-- ACCUM_REG, DATAC 		 	 // C12 = 0, 1
		 TOPADDSUB_CARRYSELECT 		: bit_vector(1 downto 0) := "00" ; 	-- LOGIC0,LOGIC1,ACCUMCI,GENERATED_CARRY //{C14, C13} =00, 01, 10, 11

		 BOTOUTPUT_SELECT		: bit_vector(1 downto 0) := "00" ; 	--COMB, ACCUM_REG, MULT_8x8, MULT_16x16  // {C16,C15} =00, 01, 10, 11
		 BOTADDSUB_LOWERINPUT 		: bit_vector(1 downto 0) := "00" ; 	--DATA, MULT_8x8, MULT_16x16, SIGNEXTIN //  {C18,C17} =00, 01, 10, 11
		 BOTADDSUB_UPPERINPUT 		: bit 			 := '0'  ;  	--ACCUM_REG, DATAD   			//  C19 = 0, 1
		 BOTADDSUB_CARRYSELECT 		: bit_vector(1 downto 0) := "00" ; 	--LOGIC0, LOGIC1, ACCUMCI, CI  		//  {C21, C20}=00,01,10,11
		 MODE_8x8 			: bit 			 := '0' ; 	-- C22 

		 A_SIGNED 			: bit 			 := '0' ;  	-- C23
		 B_SIGNED 			: bit 			 := '0'   	-- C24
	);
	port	(

		A		: in 	std_logic_vector(15 downto 0) := x"0000";  
		B		: in    std_logic_vector(15 downto 0) := x"0000"; 	
		C		: in 	std_logic_vector(15 downto 0) := x"0000"; 
		D		: in 	std_logic_vector(15 downto 0) := x"0000"; 
		O		: out 	std_logic_vector(31 downto 0) ;
		CLK		: in 	std_logic ; 
		CE		: in 	std_logic := 'H' ; 
		IRSTTOP 	: in 	std_logic := 'L' ; 
	    	IRSTBOT 	: in 	std_logic := 'L' ;  
		ORSTTOP 	: in 	std_logic := 'L' ; 
		ORSTBOT 	: in 	std_logic := 'L' ; 
		AHOLD 		: in	std_logic := 'L' ; 
		BHOLD		: in 	std_logic := 'L' ; 
		CHOLD		: in 	std_logic := 'L' ; 
		DHOLD		: in 	std_logic := 'L' ; 
		OHOLDTOP	: in 	std_logic := 'L' ; 
		OHOLDBOT	: in 	std_logic := 'L' ; 
		OLOADTOP	: in	std_logic := 'L' ; 
		OLOADBOT	: in 	std_logic := 'L' ; 
		ADDSUBTOP	: in 	std_logic := 'L' ; 
		ADDSUBBOT	: in 	std_logic := 'L' ;
		CO		: out 	std_logic ;
		CI		: in 	std_logic := 'L' ;  
		ACCUMCI		: in 	std_logic := 'L' ; 
		ACCUMCO        	: out 	std_logic ;
		SIGNEXTIN	: in	std_logic ; 
		SIGNEXTOUT      : out 	std_logic  				
	); 

end component;

--inoutdly
component  inoutdly64  is
 
	generic ( 
		 INDELAY  			: bit_vector(5 downto 0)	:="000000"; 
		 OUTDELAY 			: bit_vector(5 downto 0) 	:="000000"  		 
	);
	port (
		sclk		: in 	std_logic;
		serialreg_rst   : in  	std_logic; 				 
		sdi 		: in    std_logic; 
		c_r_sel 	: in	std_logic;
		in_datain 	: in 	std_logic;
		out_datain 	: in  	std_logic;
		delay_direction	: in 	std_logic ; 
		delayed_dataout : out 	std_logic ; 
		sdo		: out 	std_logic 
	); 

end component;
 

component SB_IO_DLY is 
	generic	(

		NEG_TRIGGER 		: bit				:='0';
		PIN_TYPE		: bit_vector (5 downto 0)	:="000000";
		PULLUP			: bit				:='0';
		IO_STANDARD		: string			:="SB_LVCMOS";
		INDELAY_VAL		: bit_vector (5 downto 0) 	:="000000";
		OUTDELAY_VAL 		: bit_vector (5 downto 0) 	:="000000"
	);	
	port 	(
		PACKAGE_PIN 		: inout std_ulogic; 
		LATCH_INPUT_VALUE 	: in 	std_logic; 
		CLOCK_ENABLE		: in 	std_logic; 
		INPUT_CLK		: in 	std_logic; 
		OUTPUT_CLK		: in 	std_logic; 
		OUTPUT_ENABLE		: in 	std_logic :='H'; 
		D_OUT_1			: in 	std_logic;   
		D_OUT_0			: in 	std_logic;  
		D_IN_1			: out 	std_logic; 
		D_IN_0			: out 	std_logic; 
		SCLK			: in 	std_logic; 	
		SDI			: in 	std_logic; 	
		C_R_SEL			: in 	std_logic;  
		SDO			: out 	std_logic 
--		DLY_RST			: in	std_logic 	
	 );


end component; 
 
component SB_MIPI_TX_4LANE  
	generic	( 		
		DIVR 			: bit_vector( 4 downto 0)  	:= "11111" ;      	-- Ref Clk divider
		DIVF 			: bit_vector( 7 downto 0)  	:= "11110000"; 		-- Feedback divider
		DIVQ 			: bit_vector( 1 downto 0)  	:= "00";       		-- VCO divider
		TEST_MODE 		: bit 				:= '0';
		TEST_BITS 		: bit_vector( 3 downto 0) 	:= "1001"
	); 
	port 	( 
			--Common Interface Pins
		PU			: in 	std_logic ; 
		LBEN			: in 	std_logic ; 
 		ROUTCAL			: in 	std_logic_vector(1 downto 0) ; 
 		ENPDESER		: in	std_logic ; 	
	       	PDCKG			: in	std_logic ; 
			-- DATA0 Interface pins
		DP0			: inout	std_ulogic ; 	
		DN0			: inout std_ulogic ; 
 		D0OPMODE		: in	std_logic ;  
 		D0DTXLPP		: in	std_logic ; 
 		D0DTXLPN		: in 	std_logic ; 
 		D0TXLPEN		: in	std_logic ;  	
 		D0DRXLPP		: out	std_logic ; 
	  	D0DRXLPN		: out 	std_logic ; 
 		D0RXLPEN		: in 	std_logic ; 
 		D0DCDP			: out 	std_logic ; 
		D0DCDN			: out 	std_logic ; 
 		D0CDEN			: in	std_logic ; 		
  		D0TXHSPD		: in	std_logic ; 
 		D0TXHSEN		: in 	std_logic ; 
   		D0HSTXDATA		: in 	std_logic_vector( 7 downto 0) ; 
  		D0HSSEREN		: in	std_logic ; 	 
 		D0RXHSEN		: in	std_logic ; 
  		D0HSDESEREN		: in 	std_logic ; 	
 	 	D0HSRXDATA		: out 	std_logic_vector( 7 downto 0) ; 
 		D0HSBYTECLKD		: out 	std_logic ; 
 		D0SYNC			: out 	std_logic ; 
 		D0ERRSYNC		: out 	std_logic ; 
	      	D0HSBYTECLKSNOSYNC	: out 	std_logic ; 
			-- DATA1 Interface pins
		DP1			: inout std_ulogic ; 
		DN1			: inout std_ulogic ;  
 		D1DTXLPP		: in 	std_logic ; 
 		D1DTXLPN		: in	std_logic ; 
  		D1TXLPEN		: in 	std_logic ; 
 		D1DRXLPP		: out 	std_logic ;
	  	D1DRXLPN		: out 	std_logic ; 
 		D1RXLPEN		: in	std_logic ;
 		D1DCDP			: out 	std_logic ; 
		D1DCDN			: out  	std_logic ; 
 		D1CDEN			: in	std_logic ; 
  		D1TXHSPD		: in 	std_logic ; 
 		D1TXHSEN		: in	std_logic ;  
		D1HSTXDATA		: in 	std_logic_vector( 7 downto 0) ; 
  		D1HSSEREN		: in	std_logic ; 
 		D1RXHSEN		: in 	std_logic ;
  		D1HSDESEREN		: in 	std_logic ; 
	 	D1HSRXDATA		: out   std_logic_vector( 7 downto 0) ; 
 		D1SYNC			: out 	std_logic ; 
 		D1ERRSYNC		: out 	std_logic ; 
 		D1NOSYNC		: out 	std_logic ; 
			-- DATA2 Interface pins
		DP2			: inout std_ulogic ;
		DN2			: inout std_ulogic ; 
 		D2DTXLPP		: in	std_logic ; 
 		D2DTXLPN		: in 	std_logic ; 
  		D2TXLPEN		: in 	std_logic ; 
 		D2DRXLPP		: out 	std_logic ; 
	  	D2DRXLPN		: out 	std_logic ; 
 		D2RXLPEN		: in 	std_logic ; 
 		D2DCDP			: out 	std_logic ; 
		D2DCDN			: out 	std_logic ; 
 		D2CDEN			: in	std_logic ;
  		D2TXHSPD		: in	std_logic ; 
 		D2TXHSEN		: in	std_logic ; 		 
    	 	D2HSTXDATA		: in	std_logic_vector( 7 downto 0) ; 
  		D2HSSEREN		: in	std_logic ; 
 		D2RXHSEN		: in	std_logic ; 
  		D2HSDESEREN		: in	std_logic ; 
 	 	D2HSRXDATA		: out 	std_logic_vector( 7 downto 0) ; 
 		D2SYNC			: out 	std_logic ; 
 		D2ERRSYNC		: out 	std_logic ;
 		D2NOSYNC		: out 	std_logic ; 
			-- DATA3 Interface pins
		DP3			: inout std_ulogic ; 
		DN3			: inout std_ulogic ;
 		D3DTXLPP		: in 	std_logic ; 
 		D3DTXLPN		: in	std_logic ; 
  		D3TXLPEN		: in 	std_logic ; 
 		D3DRXLPP		: out 	std_logic ; 
	  	D3DRXLPN		: out 	std_logic ;
 		D3RXLPEN		: in	std_logic ; 
 		D3DCDP			: out 	std_logic ; 
		D3DCDN			: out 	std_logic ; 
 		D3CDEN			: in	std_logic ; 
  		D3TXHSPD		: in	std_logic ; 
 		D3TXHSEN		: in	std_logic ;  
  	 	D3HSTXDATA		: in 	std_logic_vector( 7 downto 0) ; 
  		D3HSSEREN		: in	std_logic ; 
 		D3RXHSEN		: in	std_logic ; 
  		D3HSDESEREN		: in	std_logic ; 
 	 	D3HSRXDATA		: out 	std_logic_vector( 7 downto 0) ; 
 		D3SYNC			: out 	std_logic ;	
 		D3ERRSYNC		: out	std_logic ; 
 		D3NOSYNC		: out 	std_logic ; 
			-- CLOCK Interface pins
		CKP			: inout std_ulogic ;  
		CKN			: inout std_ulogic ; 
 		CLKDTXLPP		: in 	std_logic ; 
 		CLKDTXLPN		: in	std_logic ; 
  		CLKTXLPEN		: in 	std_logic ; 
	  	CLKDRXLPP		: out 	std_logic ; 
	  	CLKDRXLPN		: out 	std_logic ; 
  		CLKRXLPEN		: in	std_logic ; 
  		CLKTXHSPD		: in	std_logic ; 
 		CLKTXHSEN		: in	std_logic ; 
	       	CLKTXHSGATE		: in	std_logic ; 
  		CLKRXHSEN		: in	std_logic ; 
	     	CLKHSBYTE		: out 	std_logic ; 
			-- Universal MIPI PLL Interface pins
 		PLLPU			: in 	std_logic ; 
 		PLLREF			: in	std_logic ; 
 		PLLLOCK			: out 	std_logic ; 
			-- Universal MIPI PLL Serial Configuration Register Interface pins
 		PLLCFGSRDI		: in	std_logic ; 
 		PLLCFGSRRESET		: in	std_logic ; 
 		PLLCFGSRCLK		: in	std_logic ; 
 		PLLCFGSRDO		: out 	std_logic 
	);

end component; 

--- iCE40MH RAM16K components  
 
component SB_RAM40_16K 
	 generic (

           TimingChecksOn : boolean := true;
           Xon            : boolean := false;
           MsgOn          : boolean := false;
           
           tipd_RCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_RADDR : VitalDelayArrayType01(12 downto 0) := (others => (0 ns, 0 ns));
           tipd_WCLK  : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WCLKE : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WE    : VitalDelayType01                   := ( 0 ns, 0 ns);
           tipd_WADDR : VitalDelayArrayType01(12 downto 0) := (others => (0 ns, 0 ns));
           tipd_MASK  : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));
           tipd_WDATA : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));
		 		
           tpd_RCLK_RDATA : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));
           tpd_RCLK_RDATA_posedge : VitalDelayArrayType01(15 downto 0) := (others => (0 ns, 0 ns));

           tsetup_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           tsetup_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           tsetup_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           tsetup_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           tsetup_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           tsetup_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           tsetup_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           thold_RADDR_RCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           thold_RADDR_RCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ns);
           thold_RCLKE_RCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_RCLKE_RCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_RE_RCLK_posedge_posedge    : VitalDelayType                   := 0 ns;

           thold_WADDR_WCLK_negedge_posedge : VitalDelayArrayType(12 downto 0)  := (others => 0 ns);
           thold_WADDR_WCLK_posedge_posedge : VitalDelayArrayType(12 downto 0)  := (others => 0 ns);
           thold_WDATA_WCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WDATA_WCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_WCLKE_WCLK_negedge_posedge : VitalDelayType                   := 0 ns;
           thold_WCLKE_WCLK_posedge_posedge : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
           thold_WE_WCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
           thold_MASK_WCLK_negedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);
           thold_MASK_WCLK_posedge_posedge  : VitalDelayArrayType(15 downto 0) := (others => 0 ns);

           tpw_RCLK_negedge : VitalDelayType := 0 ns;
           tpw_RCLK_posedge : VitalDelayType := 0 ns;
           tpw_WCLK_negedge : VitalDelayType := 0 ns;
           tpw_WCLK_posedge : VitalDelayType := 0 ns;
 
	   WRITE_MODE : integer := 0; 
  	   READ_MODE  : integer := 0; 

	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"; 
           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"; 

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"; 

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
		       );
	  
end component;

component SB_RAM40_16KNR 
	generic (
	   WRITE_MODE : integer := 0; 
	   READ_MODE  : integer := 0; 

	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"; 

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
		       );
end component;

component SB_RAM40_16KNW 
	generic ( 
	   WRITE_MODE : integer := 0; 
      	   READ_MODE  : integer := 0; 

	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
end component;

component SB_RAM40_16KNRNW 
	generic ( 
	   WRITE_MODE : integer := 0; 
	   READ_MODE  : integer := 0; 

	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	
           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
end component;

component SB_RAM1024x16 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 9  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 9  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
  
end component;

component SB_RAM1024x16NR 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 9  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 9  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
end component;

component SB_RAM1024x16NW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 9  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 9  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
end component;

component SB_RAM1024x16NRNW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 15  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 9  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 9  downto 0) ;
			MASK  : in  std_logic_vector( 15  downto 0) ;
			WDATA : in  std_logic_vector( 15  downto 0)
	       );
end component;

component SB_RAM2048x8 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

	   INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 7  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 10  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 10  downto 0) ;
			WDATA : in  std_logic_vector( 7  downto 0)
	       );
end component;

component SB_RAM2048x8NR 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 7  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 10  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 10  downto 0) ;
			WDATA : in  std_logic_vector( 7  downto 0)
	       );
end component;

component SB_RAM2048x8NW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 7  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 10  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 10  downto 0) ;
			WDATA : in  std_logic_vector( 7  downto 0)
	       );
end component;

component SB_RAM2048x8NRNW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	
           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 7  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 10  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 10  downto 0) ;
			WDATA : in  std_logic_vector( 7  downto 0)
	       );
end component;

component SB_RAM4096x4 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 3  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 11  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 11  downto 0) ;
			WDATA : in  std_logic_vector( 3  downto 0)
	       );
end component;

component SB_RAM4096x4NR 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 3  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 11  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 11  downto 0) ;
			WDATA : in  std_logic_vector( 3  downto 0)
	       );
end component;

component SB_RAM4096x4NW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 3  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 11  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 11  downto 0) ;
			WDATA : in  std_logic_vector( 3  downto 0)
	       );
end component;


component SB_RAM4096x4NRNW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 3  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 11  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 11  downto 0) ;
			WDATA : in  std_logic_vector( 3  downto 0)
	       );
end component;

component SB_RAM8192x2 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 1  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			WDATA : in  std_logic_vector( 1  downto 0)
	       );
end component;

component SB_RAM8192x2NR 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 1  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLK  : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			WDATA : in  std_logic_vector( 1  downto 0)
	       );
end component;

component SB_RAM8192x2NW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	
       	   INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 1  downto 0) ;
			RCLK  : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			WDATA : in  std_logic_vector( 1  downto 0)
	       );
end component;

component SB_RAM8192x2NRNW 
	  generic ( 
	   INIT_0 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_1 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_2 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_3 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_4 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_5 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_6 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_7 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_8 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_9 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

           INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       	   INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	
           INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

       	   INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
 	   INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	   INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
           INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
	    ) ;
	  port( 
			RDATA : out std_logic_vector( 1  downto 0) ;
			RCLKN : in  std_logic ;
			RCLKE : in  std_logic := 'H';
			RE    : in  std_logic := 'H';
			RADDR : in  std_logic_vector( 12  downto 0) ;
			WCLKN : in  std_logic ;
			WCLKE : in  std_logic := 'H';
			WE    : in  std_logic := 'H';
			WADDR : in  std_logic_vector( 12  downto 0) ;
			WDATA : in  std_logic_vector( 1  downto 0)
	       );
end component;


component preio_physical

	port	(
			bs_en		:	in	std_logic;		--JTAG enable           
			shift		:	in	std_logic;		--JTAG shift            
			tclk		:	in	std_logic;		--JTAG clock            
			update		:	in	std_logic;		--JTAG update           
			sdi		:	in	std_logic;		--JTAG serial data in   
			mode		:	in	std_logic;		--JTAG mode             
			hiz_b		:	in	std_logic;		--JTAG high X control   
			sdo		:	out	std_logic;		--JTAG serial data out  
			dout1		:	out	std_logic;		--Normal Input cell output 1
			dout0		:	out	std_logic;		--Normal Input cell output 0
			ddr1		:	in	std_logic;		--Normal Output cell input 1
			ddr0		:	in	std_logic;		--Normal Output cell input 0
			oepin		:	in	std_logic;		--Normal Ouput-Enable       
			hold		:	in	std_logic;		--Normal Input cell control 
			rstio		:	in	std_logic;		--Normal Input cell reset   
			inclk		:	in	std_logic;		--Normal Input cell clock   
			outclk		:	in	std_logic;		--Normal Output cell clock  
			cbit		:	in	std_logic_vector (5 downto 0);	--Configurion bits   
			padin		:	in	std_logic;		--PAD input          
			padout		:	out	std_logic;		--PAD output         
			padoen		:	out	std_logic 		--PAD output enable  
			);

end component;


component SB_IO 

	generic (
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
			PULLUP		: bit						:=	'0';
			IO_STANDARD	: string					:=	"SB_LVCMOS"
			);
	port 
		(
		D_OUT_1 		    : in std_logic;
		D_OUT_0 		    : in std_logic;
		CLOCK_ENABLE		: in std_logic;
		LATCH_INPUT_VALUE	: in std_logic;
		INPUT_CLK			: in std_logic;
		
		D_IN_1				: out std_logic;
		D_IN_0				: out std_logic;
		OUTPUT_ENABLE		: in std_logic	:='H';
		OUTPUT_CLK			: in std_logic;
		PACKAGE_PIN			: inout	std_ulogic
		); 
		
end component;

component SB_IO_DS	
	generic	(
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
			IO_STANDARD	: string					:=	"SB_LVDS_OUTPUT"
			);

	port	(
			D_OUT_1			:	in	std_logic;	-- Input output 1 
			D_OUT_0			:	in	std_logic;	-- Input output 0 
			CLOCK_ENABLE	:	in	std_logic;	-- Clock enables NEW - common to in/out clocks 
			D_IN_1			:	out	std_logic;	-- Output input 1
			D_IN_0			:	out	std_logic;	-- Output input 0
			OUTPUT_ENABLE		: in std_logic	:='H';	-- Ouput-Enable 
			LATCH_INPUT_VALUE	:	in	std_logic;	-- Input control 
			INPUT_CLK		:	in	std_logic;	-- Input clock 
			OUTPUT_CLK		:	in	std_logic;  -- Output clock
			PACKAGE_PIN		:	inout	std_ulogic;	-- User's package pin - 'PAD' output  
			PACKAGE_PIN_B	:	inout	std_ulogic	-- User's package pin - 'PAD' output  
			);

end component;

component	SB_GB_IO 
	generic	(
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
			PULLUP		: bit						:=	'0';
			IO_STANDARD	: string					:=	"SB_LVCMOS"
			);
			
	port	(
			PACKAGE_PIN			:	inout	std_ulogic;
			LATCH_INPUT_VALUE	:	in		std_logic;
			CLOCK_ENABLE        :	in		std_logic;
			INPUT_CLK           :	in		std_logic;
			OUTPUT_CLK          :	in		std_logic;
			OUTPUT_ENABLE		: in std_logic	:='H';
			D_OUT_1             :	in		std_logic;
			D_OUT_0             :	in		std_logic;
			D_IN_1              :	out		std_logic;
			D_IN_0              :	out		std_logic;
			GLOBAL_BUFFER_OUTPUT:	out		std_logic
			);
end component;


component SB_GB	

port	(
		GLOBAL_BUFFER_OUTPUT			:	out	std_logic;
		USER_SIGNAL_TO_GLOBAL_BUFFER	:	in	std_logic
		);

end component;


--component	SB_IO 
--
--	generic (
--			NEG_TRIGGER : bit						:=	'0';
--			PIN_TYPE	: bit_vector (5 downto 0)	:=	"010000";
--			PULLUP		: bit						:=	'0';
--			IO_STANDARD	: string					:=	"SB_LVCMOS";
--		----------------------------------------------------------------------------------
--			--VITAL PARAMETER
--			---------------------------------------------------------------------------------
--			TimingChecksOn  : boolean := true;
--			Xon   : boolean := true;
--          MsgOn : boolean := false;
--			--- VITAL path delay
--			tipd_D_OUT_1       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_D_OUT_0       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_CLOCK_ENABLE        : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_LATCH_INPUT_VALUE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_INPUT_CLK        : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_OUTPUT_ENABLE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_OUTPUT_CLK       : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_PACKAGE_PIN      : VitalDelayType01 := (0 ns, 0 ns);
--            --- VITAL path delay
--            tpd_PACKAGE_PIN_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_PACKAGE_PIN_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_D_OUT_0_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_D_OUT_1_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_OUTPUT_ENABLE_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_LATCH_INPUT_VALUE_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_LATCH_INPUT_VALUE_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--  VITAL clk-to-output path delay
--			tpd_INPUT_CLK_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_INPUT_CLK_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_OUTPUT_CLK_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--- VITAL setup time
--			tsetup_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			tsetup_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			--- VITAL hold time 
--			thold_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			thold_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns			
-- 			);
--	port (
--		D_OUT_1 		: in std_logic;
--		D_OUT_0 		: in std_logic;
--		CLOCK_ENABLE		: in std_logic;
--		LATCH_INPUT_VALUE	: in std_logic;
--		INPUT_CLK		: in std_logic;
--		
--		D_IN_1			: out std_logic;
--		D_IN_0			: out std_logic;
--		OUTPUT_ENABLE		: in std_logic;
--		OUTPUT_CLK		: in std_logic;
--		PACKAGE_PIN		: inout	std_logic
--		); 	
--end component;
--
--component SB_GB_IO 
--	generic (
--			NEG_TRIGGER : bit						:=	'0';
--			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
--			PULLUP		: bit						:=	'0';
--			IO_STANDARD	: string					:=	"SB_LVCMOS";
--			----------------------------------------------------------------------------------
--			--VITAL PARAMETER
--			---------------------------------------------------------------------------------
--			TimingChecksOn  : boolean := true;
--			Xon   : boolean := true;
--            MsgOn : boolean := false;
--			--- VITAL path delay
--			tipd_D_OUT_1       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_D_OUT_0       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_CLOCK_ENABLE        : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_LATCH_INPUT_VALUE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_INPUT_CLK        : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_OUTPUT_ENABLE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_OUTPUT_CLK       : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_PACKAGE_PIN      : VitalDelayType01 := (0 ns, 0 ns);
--            --- VITAL path delay
--            tpd_PACKAGE_PIN_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_PACKAGE_PIN_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_D_OUT_0_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_D_OUT_1_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_OUTPUT_ENABLE_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_LATCH_INPUT_VALUE_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_LATCH_INPUT_VALUE_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_PACKAGE_PIN_GLOBAL_BUFFER_OUTPUT : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--  VITAL clk-to-output path delay
--			tpd_INPUT_CLK_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_INPUT_CLK_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_OUTPUT_CLK_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--- VITAL setup time
--			tsetup_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			tsetup_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			--- VITAL hold time 
--			thold_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			thold_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns			
-- 			);		
--	port	(
--		 PACKAGE_PIN		:	inout	std_logic;
--		 LATCH_INPUT_VALUE	:	in	std_logic;
--		 CLOCK_ENABLE        :	in	std_logic;
--		 INPUT_CLK           :	in	std_logic;
--		 OUTPUT_CLK          :	in	std_logic;
--		 OUTPUT_ENABLE	:      in     std_logic;
--		 D_OUT_1             :	in	std_logic;
--		 D_OUT_0             :	in	std_logic;
--		 D_IN_1              :	out	std_logic;
--		 D_IN_0              :	out	std_logic;
--		 GLOBAL_BUFFER_OUTPUT:	out	std_logic
--		);
--end component;


--component SB_GB	
--generic	(----------------------------------------------------------------------------------
--			--VITAL PARAMETER
--			---------------------------------------------------------------------------------
--			TimingChecksOn  : boolean := true;
--			Xon   : boolean := true;
--            MsgOn : boolean := false;
--			--- VITAL path delay
--			tipd_USER_SIGNAL_TO_GLOBAL_BUFFER       : VitalDelayType01 := (0 ns, 0 ns);
--            --- VITAL path delay
--            tpd_USER_SIGNAL_TO_GLOBAL_BUFFER_GLOBAL_BUFFER_OUTPUT : VitalDelayType01 := (0.000 ns, 0.000 ns)
--            );
--        port (
--		 GLOBAL_BUFFER_OUTPUT		:	out	std_logic;
--		 USER_SIGNAL_TO_GLOBAL_BUFFER	:	in	std_logic
--		);
--end component;

component SB_WARMBOOT
            port (
		   BOOT	:	in	std_logic;
		   S1		:	in	std_logic;
		   S0		:	in	std_logic
		   );

end component;

--component SB_IO_DS
--	generic	(
--			NEG_TRIGGER : bit						:=	'0';
--			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
----			PULLUP		: bit						:=	'0';
--			IO_STANDARD	: string					:=	"SB_LVDS_OUTPUT";
--			----------------------------------------------------------------------------------
--			--VITAL PARAMETER
--			---------------------------------------------------------------------------------
--			TimingChecksOn  : boolean := true;
--			Xon   : boolean := true;
--            MsgOn : boolean := false;
--			--- VITAL path delay
--			tipd_D_OUT_1       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_D_OUT_0       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_CLOCK_ENABLE        : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_LATCH_INPUT_VALUE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_INPUT_CLK        : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_OUTPUT_ENABLE       : VitalDelayType01 := (0 ns, 0 ns);
--            tipd_OUTPUT_CLK       : VitalDelayType01 := (0 ns, 0 ns);
--			tipd_PACKAGE_PIN      : VitalDelayType01 := (0 ns, 0 ns);
--            --- VITAL path delay
--            tpd_PACKAGE_PIN_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_PACKAGE_PIN_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_D_OUT_0_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_D_OUT_1_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_OUTPUT_ENABLE_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_LATCH_INPUT_VALUE_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_LATCH_INPUT_VALUE_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_D_OUT_0_PACKAGE_PIN_B : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_D_OUT_1_PACKAGE_PIN_B : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_OUTPUT_ENABLE_PACKAGE_PIN_B : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--  VITAL clk-to-output path delay
--			tpd_INPUT_CLK_D_IN_0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--            tpd_INPUT_CLK_D_IN_1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_OUTPUT_CLK_PACKAGE_PIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			tpd_OUTPUT_CLK_PACKAGE_PIN_B : VitalDelayType01 := (0.000 ns, 0.000 ns);
--			--- VITAL setup time
--			tsetup_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			tsetup_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            tsetup_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			tsetup_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            tsetup_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			--- VITAL hold time 
--			thold_CLOCK_ENABLE_INPUT_CLK_negedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_INPUT_CLK_posedge_posedge    : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_posedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_posedge_negedge : VitalDelayType                   := 0 ns;
--            thold_PACKAGE_PIN_INPUT_CLK_negedge_negedge : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_CLOCK_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_0_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_0_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns;
--			thold_D_OUT_1_OUTPUT_CLK_negedge_negedge   : VitalDelayType                   := 0 ns;
--            thold_D_OUT_1_OUTPUT_CLK_posedge_negedge   : VitalDelayType                   := 0 ns;
--			thold_OUTPUT_ENABLE_OUTPUT_CLK_negedge_posedge   : VitalDelayType                   := 0 ns;
--            thold_OUTPUT_ENABLE_OUTPUT_CLK_posedge_posedge   : VitalDelayType                   := 0 ns
--			
--			);			
--	        port (
--			PACKAGE_PIN		:	inout	       std_logic;
--			LATCH_INPUT_VALUE	:	in		std_logic;
--			CLOCK_ENABLE        :	in		std_logic;
--			INPUT_CLK           :	in		std_logic;
--			OUTPUT_CLK          :	in		std_logic;
--			OUTPUT_ENABLE		:      in            std_logic;
--			D_OUT_1             :	in		std_logic;
--			D_OUT_0             :	in		std_logic;
--			D_IN_1              :	out		std_logic;
--			D_IN_0              :	out		std_logic;
--			PACKAGE_PIN_B	    :	inout	std_logic	-- User's package pin - 'PAD' output  
--			);
--end component;

component GND	
           port (
		   Y	:	out	std_logic
		   );
end component;

component VCC	
            port (
		    Y	:	out	std_logic
		   );
end component;


component LogicCell
  generic ( SEQ_MODE  : bit_vector(3 downto 0) := "0000";
            C_ON      : bit := '0'; 
            LUT_INIT  : bit_vector(15 downto 0) := X"0000";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_carryin       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_clk            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_clkb           : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in0            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in1            : VitalDelayType01 := (0 ns, 0 ns);
			tipd_in2            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in3            : VitalDelayType01 := (0 ns, 0 ns);
			tipd_sr            : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_carryin_carryout : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_in0_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_in3_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_clk_lcout_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_clk_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_sr_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
			-- VITAL recovery time variables
            trecovery_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            trecovery_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            -- VITAL removal time variables
            tremoval_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            tremoval_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            --- VITAL setup time
			tsetup_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            --- VITAL hold time 
			thold_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns
			) ;
  port(
       carryout: out std_logic;
       lcout   : out std_logic;
       carryin : in  std_logic;
       clk      : in  std_logic;
       clkb     : in  std_logic;
       in0      : in  std_logic;
       in1      : in  std_logic;
       in2      : in  std_logic;
       in3      : in  std_logic;
       sr      : in  std_logic
      );
end component;


component LogicCell2
  generic ( SEQ_MODE  : bit_vector(3 downto 0) := "0000";
            C_ON      : bit := '0'; 
            LUT_INIT  : bit_vector(15 downto 0) := X"0000";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_carryin       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_clk            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in0            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in1            : VitalDelayType01 := (0 ns, 0 ns);
			tipd_in2            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in3            : VitalDelayType01 := (0 ns, 0 ns);
			tipd_sr            : VitalDelayType01 := (0 ns, 0 ns);
			tipd_ce            : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_carryin_carryout : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_in0_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_in3_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_clk_lcout_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_clk_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_sr_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
			-- VITAL recovery time variables
            trecovery_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            trecovery_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            -- VITAL removal time variables
            tremoval_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            tremoval_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            --- VITAL setup time
			tsetup_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			tsetup_ce_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_ce_clk_negedge_posedge    : VitalDelayType                   := 0 ns;

            --- VITAL hold time 
			thold_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
			thold_ce_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
			thold_ce_clk_posedge_posedge    : VitalDelayType                   := 0 ns
			) ;
  port(
       carryout: out std_logic;
       lcout   : out std_logic;
       carryin : in  std_logic;
       clk      : in  std_logic;
       in0      : in  std_logic;
       in1      : in  std_logic;
       in2      : in  std_logic;
       in3      : in  std_logic;
       sr      : in  std_logic;
	   ce      : in std_logic := 'H'
      );
end component;

component LogicCell40  
  generic ( SEQ_MODE  : bit_vector(3 downto 0) := "0000";
            C_ON      : bit := '0'; 
            LUT_INIT  : bit_vector(15 downto 0) := X"0000";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
	    tipd_carryin       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_clk            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in0            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in1            : VitalDelayType01 := (0 ns, 0 ns);
	    tipd_in2            : VitalDelayType01 := (0 ns, 0 ns);
            tipd_in3            : VitalDelayType01 := (0 ns, 0 ns);
	    tipd_sr            : VitalDelayType01 := (0 ns, 0 ns);
	    tipd_ce            : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_carryin_carryout : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_carryout      : VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_in0_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_in3_lcout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
  	    
 	    tpd_in0_ltout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in1_ltout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_in2_ltout         : VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_in3_ltout         : VitalDelayType01 := (0.000 ns, 0.000 ns); 	
    	    
	    --  VITAL clk-to-output path delay
	    tpd_clk_lcout_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_clk_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_sr_lcout : VitalDelayType01 := (0.000 ns, 0.000 ns);
			-- VITAL recovery time variables
            trecovery_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            trecovery_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            -- VITAL removal time variables
            tremoval_sr_clk_posedge_posedge : VitalDelayType := 0 ns;
            tremoval_sr_clk_negedge_posedge : VitalDelayType := 0 ns;
            --- VITAL setup time
	    tsetup_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_ce_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_ce_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
            --- VITAL hold time 
	    thold_ce_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_ce_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in0_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in0_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in1_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in1_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in2_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in2_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_in3_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_in3_clk_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_sr_clk_negedge_posedge    : VitalDelayType                   := 0 ns;
	    thold_sr_clk_posedge_posedge    : VitalDelayType                   := 0 ns
			) ;
  port(
    carryout: out std_logic;
    lcout   : out std_logic;
    ltout   : out std_logic;  -- ltout
    carryin : in  std_logic;
    clk      : in  std_logic;
    in0      : in  std_logic;
    in1      : in  std_logic;
    in2      : in  std_logic;
    in3      : in  std_logic;
    sr      : in  std_logic;
    ce      : in  std_logic :='H'
    );
end component; 


component INV 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );
  port(
       O : out std_logic;
       I : in std_logic
      );
end component;

component AND2 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

      tipd_A : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_A_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_B_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );
  port(
       O : out std_logic;

       A : in std_logic;
       B : in std_logic
       );
end component;


component logic_cell
  port(
    carry_out : out std_logic;
    lc_out    : out std_logic;

    carry_in :  in std_logic;
    clk      :  in std_logic;
    clkb     :  in std_logic;
    in0      :  in std_logic;
    in1      :  in std_logic;
    in2      :  in std_logic;
    in3      :  in std_logic;
    prog     :  in std_logic;
    purst    :  in std_logic;
    s_r      :  in std_logic;
    cbit     :  in std_logic_vector(20 downto 0)
    );
end component;

component logic_cell2
  port(
    carry_out : out std_logic;
    lc_out    : out std_logic;

    carry_in :  in std_logic;
    clk      :  in std_logic;
    clkb     :  in std_logic;
    in0      :  in std_logic;
    in1      :  in std_logic;
    in2      :  in std_logic;
    in3      :  in std_logic;
    prog     :  in std_logic;
    purst    :  in std_logic;
    s_r      :  in std_logic;
    cbit     :  in std_logic_vector(20 downto 0);
    ce       :  in std_logic
    );
end component;

component  logic_cell40 
  port(
    carry_out : out std_logic;
    lc_out    : out std_logic;
    lt_out    : out std_logic;   -- lt_out 	

    carry_in :  in std_logic;
    clk      :  in std_logic;
    clkb     :  in std_logic;
    in0      :  in std_logic;
    in1      :  in std_logic;
    in2      :  in std_logic;
    in3      :  in std_logic;
    prog     :  in std_logic;
    purst    :  in std_logic;
    s_r      :  in std_logic;
    cbit     :  in std_logic_vector(20 downto 0);
    ce       :  in std_logic
    );
end component;

component inv_hvt
  port(
    O : out std_logic;

    I : in std_logic
    );
end component;

component coredffr
  port(
    q       : out std_logic;

    d       : in std_logic;
    purst   : in std_logic;
    S_R     : in std_logic;
    cbit    : in std_logic_vector(1 downto 0);
    clk     : in std_logic;
    clkb    : in std_logic
    );
end component;

component coredffr2
  port(
    q       : out std_logic;

    d       : in std_logic;
    purst   : in std_logic;
    S_R     : in std_logic;
    cbit    : in std_logic_vector(1 downto 0);
    clk     : in std_logic;
    clkb    : in std_logic;
    ce    :   in std_logic
    );
end component;

component clut4
  port(
    lut4 : out std_logic;

    in0  : in std_logic;
    in1  : in std_logic;
    in2  : in std_logic;
    in3  : in std_logic;
    in0b : in std_logic;
    in1b : in std_logic;
    in2b : in std_logic;
    in3b : in std_logic;
    cbit : in std_logic_vector(15 downto 0)
    );
end component;

component carry_logic
  port(
    cout : out std_logic;

    carry_in  : in std_logic;
    a         : in std_logic;
    a_bar     : in std_logic;
    b         : in std_logic;
    b_bar     : in std_logic;
    vg_en     : in std_logic
    );
end component;

component o_mux
  port(
    O    : out std_logic;

    in0  : in std_logic;
    in1  : in std_logic;
    cbit : in std_logic;
    prog : in std_logic
    );
end component;


component ClkMux
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
    );  
  port(
    O : out std_logic;

    I : in std_logic
    );
end component;

component SRMux
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    );
end component;


component Glb2LocalMux
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component CEMux
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component DummyBuf
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Sp12to4 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Odrv4 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Odrv12
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component LocalMux
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component InMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component IoInMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component CascadeMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)

    );  
  port(
    O : out std_logic;

    I : in std_logic
    );

end component; 

component CascadeBuf 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)

    );  
  port(
    O : out std_logic;

    I : in std_logic
    );
end component; 

component IpInMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)

    );  
  port(
    O : out std_logic;

    I : in std_logic
    );

end component; 

component IpOutMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)

    );  
  port(
    O : out std_logic;

    I : in std_logic
    );

end component;

component gio2CtrlBuf 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component GlobalMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component QuadClkMux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component ColCtrlBuf 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component IoSpan4Mux 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span4Mux_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span4Mux_s0_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_s1_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_s2_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span4Mux_s3_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_s0_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span4Mux_s1_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_s2_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span4Mux_s3_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s0_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s1_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s2_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s3_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s4_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s5_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s6_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span12Mux_s7_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s8_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s9_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s10_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s11_h 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s0_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s1_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s2_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s3_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s4_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s5_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s6_v 
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;


component Span12Mux_s7_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s8_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s9_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s10_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component Span12Mux_s11_v
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component sync_clk_enable 
generic ( 
    Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_NC : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_D  : VitalDelayType01 := (0.000 ns, 0.000 ns);    
	tpd_NC_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_D_Q : VitalDelayType01 := (0.000 ns, 0.000 ns)
	             );
             port(
                   Q : out std_logic;

                   NC : in std_logic;
                   D : in std_logic
                  );
end component;

component SB_G2TBuf
generic ( 
		Xon   : boolean := true;
    MsgOn : boolean := true;    

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns) 
        );  
  port(
       O : out std_logic;

       I : in std_logic
    ); 
end component;

component ICE_IO
	generic (
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"010000";
			PULLUP		: bit						:=	'0';
			IO_STANDARD	: string					:=	"SB_LVCMOS";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_DOUT1       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_DOUT0       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_CLOCKENABLE        : VitalDelayType01 := (0 ns, 0 ns);
            tipd_LATCHINPUTVALUE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_INPUTCLK        : VitalDelayType01 := (0 ns, 0 ns);
			tipd_OUTPUTENABLE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_OUTPUTCLK       : VitalDelayType01 := (0 ns, 0 ns);
			tipd_PACKAGEPIN      : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_PACKAGEPIN_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_INPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_INPUTCLK_DIN0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_INPUTCLK_DIN1_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--- VITAL setup time
			tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			--- VITAL hold time 
			thold_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            thold_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns
	     );
	port 
	    (
		DOUT1 		    : in std_logic;
		DOUT0 		    : in std_logic;
		CLOCKENABLE		: in std_logic;
		LATCHINPUTVALUE	: in std_logic;
		INPUTCLK			: in std_logic;		
		DIN1				: out std_logic;
		DIN0				: out std_logic;
		OUTPUTENABLE		: in std_logic;
		OUTPUTCLK			: in std_logic;
		PACKAGEPIN			: inout	std_logic
		); 	
end component;

component ICE_GB_IO 
	generic (
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
			PULLUP		: bit						:=	'0';
			IO_STANDARD	: string					:=	"SB_LVCMOS";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_DOUT1       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_DOUT0       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_CLOCKENABLE        : VitalDelayType01 := (0 ns, 0 ns);
            tipd_LATCHINPUTVALUE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_INPUTCLK        : VitalDelayType01 := (0 ns, 0 ns);
			tipd_OUTPUTENABLE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_OUTPUTCLK       : VitalDelayType01 := (0 ns, 0 ns);
			tipd_PACKAGEPIN      : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_PACKAGEPIN_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_PACKAGEPIN_GLOBALBUFFEROUTPUT : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_INPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_INPUTCLK_DIN0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_INPUTCLK_DIN1_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--- VITAL setup time
			tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			--- VITAL hold time 
			thold_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            thold_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns
			
 			);
			
	port	(
			PACKAGEPIN			:	inout	std_logic;
			LATCHINPUTVALUE	:	in		std_logic;
			CLOCKENABLE        :	in		std_logic;
			INPUTCLK           :	in		std_logic;
			OUTPUTCLK          :	in		std_logic;
			OUTPUTENABLE		: in std_logic	:='H';
			DOUT1             :	in		std_logic;
			DOUT0             :	in		std_logic;
			DIN1              :	out		std_logic;
			DIN0              :	out		std_logic;
			GLOBALBUFFEROUTPUT:	out		std_logic
			);
end component;

component ICE_GB	
generic	(----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_USERSIGNALTOGLOBALBUFFER       : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_USERSIGNALTOGLOBALBUFFER_GLOBALBUFFEROUTPUT : VitalDelayType01 := (0.000 ns, 0.000 ns) 
            );
     port (
		GLOBALBUFFEROUTPUT		:	out	std_logic;
		USERSIGNALTOGLOBALBUFFER	:	in	std_logic
		);
end	component;

component ICE_IO_DS
	generic	(
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
--			PULLUP		: bit						:=	'0';
			IO_STANDARD	: string					:=	"SB_LVDS_OUTPUT";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_DOUT1       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_DOUT0       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_CLOCKENABLE        : VitalDelayType01 := (0 ns, 0 ns);
            tipd_LATCHINPUTVALUE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_INPUTCLK        : VitalDelayType01 := (0 ns, 0 ns);
			tipd_OUTPUTENABLE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_OUTPUTCLK       : VitalDelayType01 := (0 ns, 0 ns);
			tipd_PACKAGEPIN      : VitalDelayType01 := (0 ns, 0 ns);
            --- VITAL path delay
            tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_PACKAGEPIN_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT0_PACKAGEPINB : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT1_PACKAGEPINB : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTENABLE_PACKAGEPINB : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_INPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_INPUTCLK_PACKAGEPINB  : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_INPUTCLK_DIN0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_INPUTCLK_DIN1_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPINB : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPINB_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPINB_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--- VITAL setup time
			tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			--- VITAL hold time 
			thold_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            thold_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns
			
			);
			
	port	(
			PACKAGEPIN			:	inout	std_logic;
			LATCHINPUTVALUE	:	in		std_logic;
			CLOCKENABLE        :	in		std_logic;
			INPUTCLK           :	in		std_logic;
			OUTPUTCLK          :	in		std_logic;
			OUTPUTENABLE		: in std_logic	:='H';
			DOUT1             :	in		std_logic;
			DOUT0             :	in		std_logic;
			DIN1              :	out		std_logic;
			DIN0              :	out		std_logic;
			PACKAGEPINB	    :	inout	std_logic	-- User's package pin - 'PAD' output  
			);

end component;

component ICE_CARRY_IN_MUX 
generic(C_INIT:bit_vector(1 downto 0) := "00";
        ----------------------------------------------------------------------------------
			--VITAL PARAMETER
		---------------------------------------------------------------------------------
		Xon   : boolean := true;
        MsgOn : boolean := false;
        tipd_carryinitin :VitalDelayType01:= (0.0 ns, 0.0 ns);  
        tpd_carryinitin_carryinitout :VitalDelayType01:= (0.0 ns, 0.0 ns)
        );
     port ( 
	    carryinitout  : out  std_logic;
	    carryinitin  : in  std_logic  
          );
end component; 


component IO_PAD 
	generic	( 
	
		PULLUP          : bit                                           :=      '0';
		IO_STANDARD     : string                                        :=      "SB_LVCMOS";
		----------------------------------------------------------------------------------
	        --VITAL PARAMETER
	         ---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
              	Xon   		: boolean := true;
                MsgOn 		: boolean := false; 
		--- VITAL port delay
		tipd_PACKAGEPIN 	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_DIN            	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_OE              	: VitalDelayType01 := (0 ns, 0 ns);
	  	--- VITAL path delay
	        tpd_PACKAGEPIN_DOUT 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
	        tpd_DIN_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
           	tpd_OE_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
		);  	    	
	port
        	(
		PACKAGEPIN              : inout std_logic; 
		DOUT               	: out std_logic;
		DIN               	: in std_logic;
		OE 	             	: in std_logic
		); 
end component;

-- open drain pad  (SB_IO_OD split) 
component IO_PAD_OD is
	generic	( 
		----------------------------------------------------------------------------------
	        --VITAL PARAMETER
	         ---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
              	Xon   		: boolean := true;
                MsgOn 		: boolean := false; 
		--- VITAL port delay
		tipd_PACKAGEPIN 	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_DIN            	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_OE              	: VitalDelayType01 := (0 ns, 0 ns);
	  	--- VITAL path delay
	        tpd_PACKAGEPIN_DOUT 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
	        tpd_DIN_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
           	tpd_OE_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
		); 	    	
	port
        	(
		PACKAGEPIN              : inout std_logic; 
		DOUT               	: out std_logic;
		DIN               	: in std_logic;
		OE 	             	: in std_logic
		); 
end component;

component PRE_IO 
	generic (
		NEG_TRIGGER 	: bit						:=	'0';
		PIN_TYPE	: bit_vector (5 downto 0)	:=	"010000";
		----------------------------------------------------------------------------------
		--VITAL PARAMETER
		---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
		Xon   		: boolean := true;
	        MsgOn 		: boolean := false;
		-- VITAL port delay
	        tipd_CLOCKENABLE        		: VitalDelayType01 := (0 ns, 0 ns);
	        tipd_INPUTCLK        			: VitalDelayType01 := (0 ns, 0 ns);
	        tipd_OUTPUTCLK       			: VitalDelayType01 := (0 ns, 0 ns);
        	tipd_LATCHINPUTVALUE       		: VitalDelayType01 := (0 ns, 0 ns);	        
		tipd_DOUT0       			: VitalDelayType01 := (0 ns, 0 ns);
		tipd_DOUT1       			: VitalDelayType01 := (0 ns, 0 ns);	
		tipd_OUTPUTENABLE			: VitalDelayType01 := (0 ns, 0 ns);
		tipd_PADIN       			: VitalDelayType01 := (0 ns, 0 ns);
	         --- VITAL path delay
          	tpd_PADIN_DIN0 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
--	        tpd_PADIN_DIN1 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
 	        tpd_DOUT0_PADOUT			: VitalDelayType01 := (0.000 ns, 0.000 ns);
--		tpd_DOUT1_PADOUT			: VitalDelayType01 := (0.000 ns, 0.000 ns);
           	tpd_OUTPUTENABLE_PADOEN  		: VitalDelayType01 := (0.000 ns, 0.000 ns);
       		tpd_LATCHINPUTVALUE_DIN0 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
--		tpd_LATCHINPUTVALUE_DIN1 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
--		tpd_INPUTCLK_PACKAGEPIN  		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		--  VITAL clk-to-output path delay
		tpd_INPUTCLK_DIN0_posedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
       		tpd_INPUTCLK_DIN1_negedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PADOUT_posedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PADOUT_negedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PADOEN_posedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		--- VITAL setup time
		tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    	: VitalDelayType := 0 ns;
	        tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    	: VitalDelayType := 0 ns;
	        tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   	: VitalDelayType := 0 ns;
       		tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   	: VitalDelayType := 0 ns;

       		tsetup_PADIN_INPUTCLK_negedge_posedge 		: VitalDelayType := 0 ns;
	        tsetup_PADIN_INPUTCLK_posedge_posedge 		: VitalDelayType := 0 ns;
	        tsetup_PADIN_INPUTCLK_posedge_negedge 		: VitalDelayType := 0 ns;
	        tsetup_PADIN_INPUTCLK_negedge_negedge 		: VitalDelayType := 0 ns;

		tsetup_DOUT0_OUTPUTCLK_negedge_posedge   	: VitalDelayType := 0 ns;
           	tsetup_DOUT0_OUTPUTCLK_posedge_posedge   	: VitalDelayType := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_negedge_negedge   	: VitalDelayType := 0 ns;
           	tsetup_DOUT1_OUTPUTCLK_posedge_negedge   	: VitalDelayType := 0 ns;

		tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType := 0 ns;
	        tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType := 0 ns;
		--- VITAL hold time
		thold_CLOCKENABLE_INPUTCLK_negedge_posedge     : VitalDelayType := 0 ns;
                thold_CLOCKENABLE_INPUTCLK_posedge_posedge     : VitalDelayType := 0 ns;
                thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge    : VitalDelayType := 0 ns;
                thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge    : VitalDelayType := 0 ns;

                thold_PADIN_INPUTCLK_negedge_posedge           : VitalDelayType := 0 ns;
                thold_PADIN_INPUTCLK_posedge_posedge           : VitalDelayType := 0 ns;
                thold_PADIN_INPUTCLK_posedge_negedge           : VitalDelayType := 0 ns;
                thold_PADIN_INPUTCLK_negedge_negedge           : VitalDelayType := 0 ns;

                thold_DOUT0_OUTPUTCLK_negedge_posedge          : VitalDelayType := 0 ns;
                thold_DOUT0_OUTPUTCLK_posedge_posedge          : VitalDelayType := 0 ns;
                thold_DOUT1_OUTPUTCLK_negedge_negedge          : VitalDelayType := 0 ns;
                thold_DOUT1_OUTPUTCLK_posedge_negedge          : VitalDelayType := 0 ns;

                thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType := 0 ns;
                thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType := 0 ns
		);
	port 
		(
		CLOCKENABLE		: in std_logic;
		INPUTCLK		: in std_logic;
		OUTPUTCLK		: in std_logic;
		LATCHINPUTVALUE		: in std_logic;
		DOUT0 		    	: in std_logic;
		DOUT1 		    	: in std_logic;
		OUTPUTENABLE		: in std_logic;
		PADIN			: in std_logic; 
		DIN0			: out std_logic;
		DIN1			: out std_logic;
		PADOEN			: out std_logic; 
		PADOUT			: out std_logic		
		); 
end component;


component PRE_IO_GBUF 
	generic	(
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
  		        MsgOn : boolean := false;
			--- VITAL path delay
			tipd_PADSIGNALTOGLOBALBUFFER       : VitalDelayType01 := (0 ns, 0 ns);
 		        --- VITAL path delay
	               tpd_PADSIGNALTOGLOBALBUFFER_GLOBALBUFFEROUTPUT : VitalDelayType01 := (0.000 ns, 0.000 ns)
        	 );
	port	(
		GLOBALBUFFEROUTPUT	:	out	std_logic;
		PADSIGNALTOGLOBALBUFFER	:	in	std_logic
		);

end component;

-- SBPLL40 
component  SB_PLL40_CORE  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_REFERENCECLK       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_REFERENCECLK_PLLOUTCORE           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_REFERENCECLK_PLLOUTGLOBAL          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT			: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE		        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                REFERENCECLK		: in std_logic;           -- PLL ref clock, driven by core logic   
                PLLOUTCORE	     	: out std_logic;          -- PLL output to core logic through local routings. 
                PLLOUTGLOBAL            : out std_logic;   	  -- PLL output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);
end component;

component SB_PLL40_PAD  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PACKAGEPIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PACKAGEPIN_PLLOUTCORE           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBAL          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT			: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE		        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PACKAGEPIN		: in std_logic;           -- PLL ref clock, driven by  pad   
                PLLOUTCORE	     	: out std_logic;          -- PLL output to core logic through local routings. 
                PLLOUTGLOBAL            : out std_logic;   	  -- PLL output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component;  
  
-- SB_PLL40_2_PAD
component  SB_PLL40_2_PAD  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PACKAGEPIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PACKAGEPIN_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_PACKAGEPIN_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PACKAGEPIN		: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component;

-- SB_PLL40_2F_CORE 
component  SB_PLL40_2F_CORE  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_REFERENCECLK       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_REFERENCECLK_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_REFERENCECLK_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_REFERENCECLK_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_REFERENCECLK_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 		 :="GENCLK"; 
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                REFERENCECLK		: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component;  

-- SB_PLL40_2F_PAD 

component  SB_PLL40_2F_PAD  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PACKAGEPIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PACKAGEPIN_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_PACKAGEPIN_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 		 :="GENCLK"; 
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PACKAGEPIN		: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);


end component ; 

-- SB_PLL40_PAD_DS

component  SB_PLL40_PAD_DS  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PACKAGEPIN         : VitalDelayType01 := (0 ns, 0 ns);
                tipd_PACKAGEPINB        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PACKAGEPIN_PLLOUTCORE           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBAL          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT			: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE		        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PACKAGEPIN		: in std_logic;           -- PLL ref clock(+), driven by PAD.  
                PACKAGEPINB		: in std_logic;           -- PLL ref clock(-), driven by PAD.  
                PLLOUTCORE	     	: out std_logic;          -- PLL output to core logic through local routings. 
                PLLOUTGLOBAL            : out std_logic;   	  -- PLL output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component ; 

--SB_PLL40_2F_PAD_DS

component  SB_PLL40_2F_PAD_DS  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PACKAGEPIN  	: VitalDelayType01 := (0 ns, 0 ns);
                tipd_PACKAGEPINB        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PACKAGEPIN_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_PACKAGEPIN_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PACKAGEPIN_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 		 :="GENCLK"; 
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PACKAGEPIN		: in std_logic;           -- PLL ref clock(+), driven by PAD.  
                PACKAGEPINB		: in std_logic;           -- PLL ref clock(-), driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);


end component;  

-- SbtSPLL40  (Static PLL Core)
component SbtSPLL40  is
 
	generic ( 
		 FEEDBACK_PATH 			: string 	:="SIMPLE"; 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 	:="FIXED"; 
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 	:="FIXED";
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00"; 		
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 	:="GENCLK"; 
		 PLLOUT_SELECT_PORTB            : string        :="GENCLK";

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			:bit_vector(2 downto 0)  := "000";  
		 FILTER_RANGE 			:bit_vector(2 downto 0)  := "000";
		 		
 		ENABLE_ICEGATE_PORTA             :bit 			:='0';
		ENABLE_ICEGATE_PORTB            :bit 			:='0' 
	);
	port	(
		REFERENCECLK	: in    std_logic;
		EXTFEEDBACK 	: in    std_logic;
		DYNAMICDELAY	: in    std_logic_vector(7 downto 0); 
		BYPASS 		: in	std_logic;
		RESETB	 	: in 	std_logic;
		PLLOUT1 	: out  	std_logic;
		PLLOUT2		: out 	std_logic ; 
		LOCK		: out 	std_logic  
	); 

end component;

-- Sbt_DS_PLL40   (Dynamic PLL)
component Sbt_DS_PLL40  is
 
	generic ( 
		 FEEDBACK_PATH 			: string 	:="SIMPLE"; 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 	:="FIXED"; 
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 	:="FIXED";
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00"; 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 	:="GENCLK"; 
		 PLLOUT_SELECT_PORTB            : string        :="GENCLK";

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			:bit_vector(2 downto 0)  := "000";  
		 FILTER_RANGE 			:bit_vector(2 downto 0)  := "000";
		 TEST_MODE         :bit        :='0'; 		
 		ENABLE_ICEGATE_PORTA             :bit 			:='0';
		ENABLE_ICEGATE_PORTB            :bit 			:='0' 
	);
	port	(
		CORE_REF_CLK	: in    std_logic;
		EXTFEEDBACK 	: in    std_logic;
		DYNAMICDELAY	: in    std_logic_vector(7 downto 0); 
		BYPASS 		: in	std_logic;
		RESETB	 	: in 	std_logic;
		PLLOUT1 	: out  	std_logic;
		PLLOUT2		: out 	std_logic ; 
		LOCK		: out 	std_logic ;
	        PACKAGEPIN : in  std_logic :='0';
        	PLL_SCK     :in std_logic;
        	PLL_SDI     :in std_logic;
        	PLL_SDO     :out std_logic 
	); 
end component;	


component ShiftReg427  is
 
	generic ( 
		SHIFTREG_DIV_MODE  :  bit_vector(1 downto 0) := "00" 
		);
	port 	( 
		clk 		: in std_logic; 
		init 		: in std_logic; 
		phase0 		: out std_logic; 
		phase90		: out std_logic
		); 
end component;

component Delay4Buf  is
	generic ( 
		BUF_DELAY       : time := 150 ps ; 
 		MUXINV_DELAY    : time := 0 ps
		); 	
	port  ( 
		a 		:in std_logic;   	
	 	s		:in std_logic_vector(1 downto 0); 
		delay4bufout	:out std_logic; 
		muxinvout	:out std_logic
	       );   		
end component; 


component FineDlyAdj  is
	generic (
		FIXED_DELAY_ADJUSTMENT   : bit_vector(3 downto 0) :="0000"; 
		DELAY_ADJUSTMENT_MODE    : string 		  :="FIXED";
		BUF_DELAY		 : time 		  := 150 ps;
		MUXINV_DELAY		 : time 		  := 0 ps
		); 
	port 	( 
		signalin		:in  std_logic; 
		DlyAdj			:in  std_logic_vector(3 downto 0); 
		delayedout 		:out std_logic
		); 
end component; 


component  mux4to1   is
	port ( 
		a,b,c,d : in std_logic; 
		sel 	: in std_logic_vector(1 downto 0); 
		o	: out std_logic 
	      ); 
end component;


-- PLL40 

component  PLL40  is  
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PLLIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PLLIN_PLLOUTCORE           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PLLIN_PLLOUTGLOBAL          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT			: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE		        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PLLIN			: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCORE	     	: out std_logic;          -- PLL output to core logic through local routings. 
                PLLOUTGLOBAL            : out std_logic;   	  -- PLL output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);


end component; 

component  PLL40_2  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PLLIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PLLIN_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PLLIN_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_PLLIN_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PLLIN_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PLLIN		: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component;  

component  PLL40_2F  is 
	
	generic ( 
		----------------------------------------------------------------------------------
                --VITAL PARAMETER
                ---------------------------------------------------------------------------------
                TimingChecksOn  	: boolean := true;
                Xon   			: boolean := true;
	        MsgOn 			: boolean := false;
                --- VITAL input port delay 
                tipd_PLLIN       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_EXTFEEDBACK        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_DYNAMICDELAY       : VitalDelayArrayType01(7 downto 0)  := (others => (0 ns, 0 ns));
            	tipd_BYPASS             : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_RESETB             : VitalDelayType01 := (0 ns, 0 ns);
                tipd_SDI        	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_SCLK           	: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE   	: VitalDelayType01 := (0 ns, 0 ns);
		-- VITAL Path Delay 	
            	tpd_PLLIN_PLLOUTCOREA           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PLLIN_PLLOUTGLOBALA          	: VitalDelayType01 := (0 ns, 0 ns);

            	tpd_PLLIN_PLLOUTCOREB           	: VitalDelayType01 := (0 ns, 0 ns);
            	tpd_PLLIN_PLLOUTGLOBALB          	: VitalDelayType01 := (0 ns, 0 ns);
	         -- Entity Parameters 	
		 FEEDBACK_PATH 			: string 		 :="SIMPLE";   -- SIMPLE/DELAY/PHASE_AND_DELAY/EXTERNAL 
		 DELAY_ADJUSTMENT_MODE_FEEDBACK	: string 		 :="FIXED";    -- FIXED/DYNAMIC  
		 DELAY_ADJUSTMENT_MODE_RELATIVE : string 		 :="FIXED";    -- FIXED/DYNAMIC 
		 SHIFTREG_DIV_MODE		: bit_vector(1 downto 0) := "00";      -- 00 (div by 4)/ 01 (div by 7)/11 (div by 5)   	 
		 FDA_FEEDBACK			: bit_vector(3 downto 0) :="0000";
		 FDA_RELATIVE			: bit_vector(3 downto 0) := "0000";
		 PLLOUT_SELECT_PORTA		: string 		 :="GENCLK"; 
		 PLLOUT_SELECT_PORTB		: string 		 :="GENCLK"; 

		 DIVR				: bit_vector(3 downto 0) := "0000";
		 DIVF  				: bit_vector(6 downto 0) := "0000000";
		 DIVQ	   			: bit_vector(2 downto 0) := "000";  
		 FILTER_RANGE 			: bit_vector(2 downto 0) := "000";
		 		
 		 ENABLE_ICEGATE_PORTA	        : bit 			 :='0';
 		 ENABLE_ICEGATE_PORTB	        : bit 			 :='0';
		 TEST_MODE			: bit 			 :='0';  
		 EXTERNAL_DIVIDE_FACTOR         : integer 		 := 1      -- Required for PLL Config Wizard.  
	);
	port (
                PLLIN		: in std_logic;           -- PLL ref clock, driven by PAD.  
                PLLOUTCOREA	     	: out std_logic;          -- PLLA output to core logic through local routings. 
                PLLOUTGLOBALA           : out std_logic;   	  -- PLLA output to dedicated global clock network
                PLLOUTCOREB	     	: out std_logic;          -- PLLB output to core logic through local routings. 
                PLLOUTGLOBALB           : out std_logic;   	  -- PLLB output to dedicated global clock network
                EXTFEEDBACK             : in std_logic;  	  -- FB driven by core logic
                DYNAMICDELAY            : in std_logic_vector(7 downto 0);  -- driven by core logic
                LOCK                    : out std_logic;	  -- PLL Lock signal output  
                BYPASS                  : in std_logic; 	  -- REFCLK passed to PLLOUT when bypass is '1'.Driven by core logic
                RESETB                  : in std_logic; 	  -- Active low reset,Driven by core logic
                SDI                     : in std_logic;		  -- Test Input. Driven by core logic. 
                SDO                     : out std_logic; 	  -- Test output to RB Logic Tile.
                SCLK                    : in std_logic;	          -- Test Clk input.Driven by core logic. 
                LATCHINPUTVALUE         : in std_logic 		  -- iCEGate signal
	);

end component; 


component ICE_IO_DLY is

	generic (
		NEG_TRIGGER 	: bit				:= '0';
		PIN_TYPE	: bit_vector (5 downto 0)	:= "000000";
		PULLUP		: bit				:= '0';
		IO_STANDARD	: string			:= "SB_LVCMOS";
		INDELAY_VAL	: bit_vector (5 downto 0) 	:= "000000";
		OUTDELAY_VAL 	: bit_vector (5 downto 0) 	:= "000000";
		-------------------------------------------------------------------------------
		--VITAL PARAMETER
		--------------------------------------------------------------------------------
		TimingChecksOn  				: boolean 		:= true;
		Xon   						: boolean 		:= true;
	        MsgOn 						: boolean 		:= false;
		--- VITAL path delay
		tipd_DOUT1       				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_DOUT0       				: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_CLOCKENABLE        			: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE    			: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_INPUTCLK        				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_OUTPUTENABLE       			: VitalDelayType01 := (0 ns, 0 ns);
            	tipd_OUTPUTCLK       				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_PACKAGEPIN      				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_CRSEL      				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_SCLK 	     				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_SDI 	     				: VitalDelayType01 := (0 ns, 0 ns);

            	--- VITAL path delay
            	tpd_PACKAGEPIN_DIN0 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_PACKAGEPIN_DIN1 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_DOUT0_PACKAGEPIN 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_DOUT1_PACKAGEPIN 				: VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_OUTPUTENABLE_PACKAGEPIN 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_LATCHINPUTVALUE_DIN0 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_LATCHINPUTVALUE_DIN1 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_PACKAGEPIN  			: VitalDelayType01 := (0.000 ns, 0.000 ns);
		--  VITAL clk-to-output path delay
		tpd_INPUTCLK_DIN0_posedge 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_INPUTCLK_DIN1_negedge 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN  			: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN_posedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN_negedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_SCLK_SDO_posedge		 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		--- VITAL setup time
		tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    	: VitalDelayType                   := 0 ns;
	        tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    	: VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge 	: VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge 	: VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge 	: VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge 	: VitalDelayType                   := 0 ns;
            	tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   	: VitalDelayType                   := 0 ns;
            	tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   	: VitalDelayType                   := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_negedge_posedge   	: VitalDelayType                   := 0 ns;
            	tsetup_DOUT0_OUTPUTCLK_posedge_posedge   	: VitalDelayType                   := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_negedge_negedge   	: VitalDelayType                   := 0 ns;
            	tsetup_DOUT1_OUTPUTCLK_posedge_negedge   	: VitalDelayType                   := 0 ns;
		tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		--- VITAL hold time 
		thold_CLOCKENABLE_INPUTCLK_negedge_posedge    	: VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_INPUTCLK_posedge_posedge    	: VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_negedge_posedge 	: VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_posedge_posedge 	: VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_posedge_negedge 	: VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_negedge_negedge 	: VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   	: VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   	: VitalDelayType                   := 0 ns;
		thold_DOUT0_OUTPUTCLK_negedge_posedge   	: VitalDelayType                   := 0 ns;
            	thold_DOUT0_OUTPUTCLK_posedge_posedge   	: VitalDelayType                   := 0 ns;
		thold_DOUT1_OUTPUTCLK_negedge_negedge   	: VitalDelayType                   := 0 ns;
            	thold_DOUT1_OUTPUTCLK_posedge_negedge   	: VitalDelayType                   := 0 ns;
		thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   	: VitalDelayType                   := 0 ns;
            	thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   	: VitalDelayType                   := 0 ns
			
 		);
	port 
		(
		PACKAGEPIN		: inout	std_logic;
		CLOCKENABLE		: in std_logic;
		INPUTCLK		: in std_logic;
		OUTPUTCLK		: in std_logic;
		LATCHINPUTVALUE		: in std_logic;
		DIN1			: out std_logic;
		DIN0			: out std_logic;
		OUTPUTENABLE		: in std_logic :='H';
		DOUT1 		    	: in std_logic;
		DOUT0 		    	: in std_logic;
		CRSEL			: in 	std_logic;  
		SCLK			: in 	std_logic; 	
		SDI			: in 	std_logic; 	
		SDO			: out 	std_logic 
		); 


end component;

-- Lightning 4KA IP --  


COMPONENT SB_I2C
--define kinds of delay timing paras default value
GENERIC  (
	I2C_SLAVE_INIT_ADDR : string := "0b1111100001";
	BUS_ADDR74 : string := "0b0001";
	-----------------------------------------------------------------
--VITAL PARAMETER	
	--------------------------------------------
TimingChecksOn  : boolean := true;
	Xon   : boolean := true;					   
    	MsgOn : boolean := false;
	--Vital path delay
Tipd_SBCLKI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBRWI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBSTBI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI7 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI6 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI5 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI4 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI3 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI2 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI1 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI0 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI7 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI6 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI5 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI4 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI3 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI2 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI1 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI0 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SCLI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SDAI : VitalDelayType01 := (0 ns, 0 ns);
--Tipd_SCLO : VitalDelayType01 := (0 ns, 0 ns);

--Vital path delay
tpd_SCLO_SDAO_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);	
tpd_SCLO_SDAOE_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCLI_SDAO_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCLI_SDAOE_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
--Vital clk-to-output path delay
--tpd_SBCLKI_SCLO : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO1_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO2_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO3_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO4_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO5_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO6_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO7_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBACKO_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_I2CIRQ_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_I2CWKUP_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);	  
------------------------added arcs--------------------------------
tpd_SCLO_SDAO_negedge: VitalDelayType01 := (0.000 ns, 0.000 ns);	
tpd_SCLO_SDAOE_negedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCLI_SDAO_negedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCLI_SDAOE_negedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
------------------------------------------------------------------
----VITAL setup time
tsetup_SBRWI_SBCLKI_posedge_posedge  : VitalDelayType     := 0 ns;
tsetup_SBRWI_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBSTBI_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBSTBI_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI7_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI7_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI6_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI6_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI5_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI5_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI4_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI4_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI3_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI3_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI2_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI2_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI1_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI1_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI0_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI0_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;

tsetup_SBDATI7_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI7_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI6_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI6_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI5_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI5_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI4_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI4_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI3_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI3_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI2_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI2_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI1_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI1_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI0_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI0_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;

tsetup_SDAI_SCLO_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SDAI_SCLO_negedge_posedge    : VitalDelayType    := 0 ns;

tsetup_SDAI_SCLI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SDAI_SCLI_negedge_posedge    : VitalDelayType    := 0 ns;


-----HOLD TIME

thold_SBRWI_SBCLKI_negedge_posedge    : VitalDelayType       := 0 ns;
thold_SBRWI_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBSTBI_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBSTBI_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI7_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI7_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI6_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI6_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI5_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI5_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI4_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI4_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns ;
thold_SBADRI3_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI3_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI2_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI2_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI1_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI1_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI0_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI0_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;


thold_SBDATI7_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI7_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI6_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI6_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI5_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI5_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI4_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI4_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns ;
thold_SBDATI3_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI3_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI2_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI2_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI1_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI1_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI0_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI0_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SDAI_SCLO_posedge_posedge    : VitalDelayType    := 0 ns;
thold_SDAI_SCLO_negedge_posedge    : VitalDelayType    := 0 ns;
thold_SDAI_SCLI_posedge_posedge    : VitalDelayType    := 0 ns;
thold_SDAI_SCLI_negedge_posedge    : VitalDelayType    := 0 ns


-------SETUPHOLD WIDTH-----------
);

Port(
	    SBCLKI  : in  std_logic;
         SBRWI  : in  std_logic;
         SBSTBI  : in  std_logic;
         SBADRI7  : in  std_logic;
         SBADRI6  : in  std_logic;
         SBADRI5  : in  std_logic;
         SBADRI4  : in  std_logic;
         SBADRI3  : in  std_logic;
         SBADRI2  : in  std_logic;
         SBADRI1  : in  std_logic;
         SBADRI0  : in  std_logic;
         SBDATI7  : in  std_logic;
         SBDATI6  : in  std_logic;
         SBDATI5  : in  std_logic;
         SBDATI4  : in  std_logic;
         SBDATI3  : in  std_logic;
         SBDATI2  : in  std_logic;
         SBDATI1  : in  std_logic;
         SBDATI0  : in  std_logic;
         SCLI  : in  std_logic;
         SDAI  : in  std_logic;

        SBDATO7  : out  std_logic;
        SBDATO6  : out  std_logic;
        SBDATO5  : out  std_logic;
        SBDATO4  : out  std_logic;
        SBDATO3  : out  std_logic;
        SBDATO2  : out  std_logic;
        SBDATO1  : out  std_logic;
        SBDATO0  : out  std_logic;
        SBACKO  : out  std_logic;
        i2ciRQ  : out  std_logic;
        I2CWKUP  : out  std_logic;
        SCLO  : inout  std_logic;
        SCLOE  : out  std_logic;
        SDAO  : out  std_logic;
        SDAOE  : out  std_logic
);
END COMPONENT;


-- 

component SB_SPI  is 
--define kinds of delay timing paras default value
	generic(
	BUS_ADDR74 : string := "0b0000" ;
	---------------------------------------------------------------
----VITAL PARAMETER	
--	------------------------------------------
TimingChecksOn  : boolean := true;
	Xon   : boolean := true;			    
    	MsgOn : boolean := false;
	--Vital path delay
Tipd_SBCLKI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBRWI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBSTBI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI7 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI6 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI5 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI4 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI3 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI2 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI1 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBADRI0 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI7 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI6 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI5 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI4 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI3 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI2 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI1 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SBDATI0 : VitalDelayType01 := (0 ns, 0 ns);
Tipd_MI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SCKI : VitalDelayType01 := (0 ns, 0 ns);
Tipd_SCSNI : VitalDelayType01 := (0 ns, 0 ns);

--Vital path delay
tpd_SCKO_MO_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MO_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);	-----------------
tpd_SCKO_MOE_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNO3_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNO2_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNO1_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNO0_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNOE3_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNOE2_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNOE1_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKO_MCSNOE0_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SCKI_SO_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);	
tpd_SCKI_SO_negedge: VitalDelayType01 := (0.000 ns, 0.000 ns); ----------------
tpd_SCKI_SOE_posedge: VitalDelayType01 := (0.000 ns, 0.000 ns);
--Vital clk-to-output path delay
--tpd_SBCLKI_SCKO : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO1_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO2_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO3_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO4_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO5_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO6_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBDATO7_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SBACKO_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SPIIRQ_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
tpd_SBCLKI_SPIWKUP_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns); 

----VITAL setup time
tsetup_SBRWI_SBCLKI_posedge_posedge  : VitalDelayType     := 0 ns;
tsetup_SBRWI_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBSTBI_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBSTBI_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI7_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI7_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI6_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI6_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBADRI5_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI5_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI4_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI4_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI3_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI3_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI2_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI2_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI1_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI1_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI0_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBADRI0_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI7_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI7_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI6_SBCLKI_posedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI6_SBCLKI_negedge_posedge    : VitalDelayType   := 0 ns;
tsetup_SBDATI5_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI5_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI4_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI4_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI3_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI3_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI2_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI2_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI1_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI1_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI0_SBCLKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SBDATI0_SBCLKI_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_MI_SCKO_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_MI_SCKO_negedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SI_SCKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SI_SCKI_negedge_posedge    : VitalDelayType    := 0 ns;								 
tsetup_SCSNI_SCKI_posedge_posedge    : VitalDelayType    := 0 ns;
tsetup_SCSNI_SCKI_negedge_posedge    : VitalDelayType    := 0 ns; 
---------------------------added---------------------------------
tsetup_MI_SCKO_posedge_negedge    : VitalDelayType    := 0 ns;
tsetup_MI_SCKO_negedge_negedge    : VitalDelayType    := 0 ns;
tsetup_SI_SCKI_posedge_negedge    : VitalDelayType    := 0 ns;
tsetup_SI_SCKI_negedge_negedge    : VitalDelayType    := 0 ns;								 
tsetup_SCSNI_SCKI_posedge_negedge    : VitalDelayType    := 0 ns;
tsetup_SCSNI_SCKI_negedge_negedge    : VitalDelayType    := 0 ns; 
-----------------------------------------------------------------

-----HOLD TIME

thold_SBRWI_SBCLKI_negedge_posedge    : VitalDelayType       := 0 ns;
thold_SBRWI_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBSTBI_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBSTBI_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI7_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI7_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI6_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI6_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBADRI5_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI5_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI4_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI4_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns ;
thold_SBADRI3_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI3_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI2_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI2_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI1_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI1_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI0_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBADRI0_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;


thold_SBDATI7_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI7_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI6_SBCLKI_negedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI6_SBCLKI_posedge_posedge    : VitalDelayType        := 0 ns;
thold_SBDATI5_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI5_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI4_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI4_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns ;
thold_SBDATI3_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI3_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI2_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI2_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI1_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI1_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI0_SBCLKI_negedge_posedge    : VitalDelayType         := 0 ns;
thold_SBDATI0_SBCLKI_posedge_posedge    : VitalDelayType         := 0 ns;
thold_MI_SCKO_posedge_posedge    : VitalDelayType    := 0 ns;
thold_MI_SCKO_negedge_posedge    : VitalDelayType    := 0 ns;					  
thold_SI_SCKI_posedge_posedge    : VitalDelayType    := 0 ns;
thold_SI_SCKI_negedge_posedge    : VitalDelayType    := 0 ns;
thold_SCSNI_SCKI_posedge_posedge    : VitalDelayType    := 0 ns;
thold_SCSNI_SCKI_negedge_posedge    : VitalDelayType    := 0 ns;
---------------------------added---------------------------------
thold_MI_SCKO_posedge_negedge    : VitalDelayType    := 0 ns;
thold_MI_SCKO_negedge_negedge    : VitalDelayType    := 0 ns;
thold_SI_SCKI_posedge_negedge    : VitalDelayType    := 0 ns;
thold_SI_SCKI_negedge_negedge    : VitalDelayType    := 0 ns;								 
thold_SCSNI_SCKI_posedge_negedge    : VitalDelayType    := 0 ns;
thold_SCSNI_SCKI_negedge_negedge    : VitalDelayType    := 0 ns 
-----------------------------------------------------------------
--
-------SETUPHOLD WIDTH-----------
);


Port(
	    SBCLKI  : in  std_logic;
         SBRWI  : in  std_logic;
         SBSTBI  : in  std_logic;
         SBADRI7  : in  std_logic;
         SBADRI6  : in  std_logic;
         SBADRI5  : in  std_logic;
         SBADRI4  : in  std_logic;
         SBADRI3  : in  std_logic;
         SBADRI2  : in  std_logic;
         SBADRI1  : in  std_logic;
         SBADRI0  : in  std_logic;
         SBDATI7  : in  std_logic;
         SBDATI6  : in  std_logic;
         SBDATI5  : in  std_logic;
         SBDATI4  : in  std_logic;
         SBDATI3  : in  std_logic;
         SBDATI2  : in  std_logic;
         SBDATI1  : in  std_logic;
         SBDATI0  : in  std_logic;
         MI  : in  std_logic;
         SI  : in  std_logic;
	      SCKI: in  std_logic;
         SCSNI : in  std_logic;


        SBDATO7  : out  std_logic;
        SBDATO6  : out  std_logic;
        SBDATO5  : out  std_logic;
        SBDATO4  : out  std_logic;
        SBDATO3  : out  std_logic;
        SBDATO2  : out  std_logic;
        SBDATO1  : out  std_logic;
        SBDATO0  : out  std_logic;
        SBACKO  : out  std_logic;
        SPIIRQ  : out  std_logic;
        SPIWKUP  : out  std_logic;
        SO  : out  std_logic;
        SOE  : out  std_logic;
        MO  : out  std_logic;
        MOE  : out  std_logic;
        SCKO  : out  std_logic;
        SCKOE  : out  std_logic;
        MCSNO3  : out  std_logic;
       
		MCSNO2  : out  std_logic;
		MCSNO1  : out  std_logic;
		MCSNO0  : out  std_logic;
		MCSNOE3  : out  std_logic;
		MCSNOE2  : out  std_logic;
		MCSNOE1  : out  std_logic;
		MCSNOE0  : out  std_logic


);

end component;


component  SB_HSOSC  is 
	generic(
	Xon   : boolean := true;
	MsgOn : boolean := true;

	tipd_ENACLKM: VitalDelayType01 := (0.000 ns, 0.000 ns);
	tpd_ENACLKM_CLKM : VitalDelayType01 := (0.000 ns, 0.000 ns)
	 ); 
port(
	CLKM : out std_logic;
	ENACLKM : in std_logic
 );

end component;


component  SB_LSOSC  is 
	generic(
	Xon   : boolean := true;
    	MsgOn : boolean := true;

	tipd_ENACLKK: VitalDelayType01 := (0.000 ns, 0.000 ns);
      	tpd_ENACLKK_CLKK : VitalDelayType01 := (0.000 ns, 0.000 ns)
 ); 
port(
    CLKK : out std_logic;
    ENACLKK : in std_logic
    );

end component;

-- ICE5LP components 

component SB_IO_OD is
	generic(
		TimingChecksOn : boolean := true;
		Xon   : boolean := true;
		MsgOn : boolean := true;
		tipd_DOUT1: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_DOUT0: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_CLOCKENABLE: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_LATCHINPUTVALUE: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_INPUTCLK: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_OUTPUTENABLE: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_OUTPUTCLK: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_PACKAGEPIN: VitalDelayType01 := (0.000 ns, 0.000 ns);
			
		tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_PACKAGEPIN_DIN1  : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_DIN1  : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_DIN0_posedge 			: VitalDelayType01 := (0.000 ns, 0.000 ns);
        tpd_INPUTCLK_DIN1_negedge 			: VitalDelayType01 := (0.000 ns, 0.000 ns);	
		tpd_OUTPUTCLK_PACKAGEPIN_posedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN_negedge 		: VitalDelayType01 := (0.000 ns, 0.000 ns);	
		
		tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_PACKAGEPIN_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_negedge_negedgee  : VitalDelayType     := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_negedge_negedge  : VitalDelayType     := 0 ns;
		tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_CLOCKENABLE_INPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_CLOCKENABLE_INPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_INPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_INPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_INPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_INPUTCLK_negedge_negedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_PACKAGEPIN_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_DOUT0_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_DOUT0_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_DOUT0_OUTPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		thold_DOUT0_OUTPUTCLK_negedge_negedge  : VitalDelayType     := 0 ns;
		thold_DOUT1_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_DOUT1_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;
		thold_DOUT1_OUTPUTCLK_posedge_negedge  : VitalDelayType     := 0 ns;
		thold_DOUT1_OUTPUTCLK_negedge_negedge  : VitalDelayType     := 0 ns;
		thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge  : VitalDelayType     := 0 ns;
		thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge  : VitalDelayType     := 0 ns;

		NEG_TRIGGER : bit						:=	'0';
		PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000"
		);
	port 
		(
		DOUT1 		    : in std_logic := 'L' ;
		DOUT0 		    : in std_logic := 'L' ;
		CLOCKENABLE		: in std_logic := 'H' ;
		LATCHINPUTVALUE	: in std_logic;
		INPUTCLK			: in std_logic;
		DIN1				: out std_logic;
		DIN0				: out std_logic;
		OUTPUTENABLE		: in std_logic	:='H';
		OUTPUTCLK			: in std_logic;
		PACKAGEPIN			: inout	std_ulogic
		); 
end component;

component SB_HFOSC  is 
	generic( 
		CLKHF_DIV: string:="0b00";
		Xon   : boolean := true;
		MsgOn : boolean := true;
		tipd_CLKHFEN: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_CLKHFPU: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_CLKHFEN_CLKHF : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_CLKHFPU_CLKHF : VitalDelayType01 := (0.000 ns, 0.000 ns)
		); 
	port(
		CLKHF : out std_logic;
		CLKHFEN  :in std_logic;
	    	CLKHFPU : in std_logic
	    );
end  component;


component SB_LFOSC  is 
	generic	(	
	    	Xon   : boolean := true;
	    	MsgOn : boolean := true;
		tipd_CLKLFEN: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_CLKLFPU: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_CLKLFEN_CLKLF : VitalDelayType01 := (0.000 ns, 0.000 ns);
    		tpd_CLKLFPU_CLKLF : VitalDelayType01 := (0.000 ns, 0.000 ns)
 		); 
	port	(
		CLKLF : out std_logic;
		CLKLFEN  :in std_logic;
		CLKLFPU : in std_logic
		);
end component;

component  SB_IR_DRV   
	generic( 
		TimingChecksOn : boolean := true;
        	Xon            : boolean := false;
	        MsgOn          : boolean := false;
		tipd_IRLEDEN: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_IRPU: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_IRPWM: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_IRPWM_IRLED : VitalDelayType01 := (0.000 ns, 0.000 ns);
		IR_CURRENT: string:="0b0000000000"
       	); 
	port	(
		IRLED : out std_logic;
		IRLEDEN  :in std_logic;
		IRPU  :in std_logic;						 
   		IRPWM : in std_logic
	    	);
end component ;

component SB_LEDD_IP  is 
	generic (
		TimingChecksOn  	: boolean := true;
		Xon   			: boolean := true;
		MsgOn 			: boolean := true;

		tipd_LEDDCS:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDCLK:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT7:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT6:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT5:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT4:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT3:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT2:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT1:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDAT0:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDADDR3:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDADDR2:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDADDR1:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDADDR0:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDDEN:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDEXE:VitalDelayType01 := (0 ns, 0 ns);
		tipd_LEDDRST:VitalDelayType01 := (0 ns, 0 ns);
		tpd_LEDDCLK_LEDDON_posedge :VitalDelayType01 := (100 ns, 100 ns);
		tpd_LEDDCLK_PWMOUT0_posedge :VitalDelayType01 := (100 ns, 100 ns);
		tpd_LEDDCLK_PWMOUT1_posedge :VitalDelayType01 := (100 ns, 100 ns);
		tpd_LEDDCLK_PWMOUT2_posedge :VitalDelayType01 := (100 ns, 100 ns);
		
		tsetup_LEDDCS_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		tsetup_LEDDCS_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDEN_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		tsetup_LEDDDEN_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDEXE_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		tsetup_LEDDEXE_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR0_LEDDCLK_negedge_posedge :VitalDelayType := 0 ns;
		tsetup_LEDDADDR1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDADDR3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	
		tsetup_LEDDDAT0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT0_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT4_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT4_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT5_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT5_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT6_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT6_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT7_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		tsetup_LEDDDAT7_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		
		thold_LEDDCS_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		thold_LEDDCS_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDEN_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		thold_LEDDDEN_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDEXE_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
		thold_LEDDEXE_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR0_LEDDCLK_negedge_posedge :VitalDelayType := 0 ns;
		thold_LEDDADDR1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDADDR3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		
		thold_LEDDDAT0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT0_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT4_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT4_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT5_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT5_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT6_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT6_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT7_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
		thold_LEDDDAT7_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns
		);
	port	(
		PWMOUT0 : out std_logic;	
		PWMOUT1 : out std_logic;
		PWMOUT2 : out std_logic;
		LEDDON : out std_logic; 
		LEDDCS:in std_logic;
		LEDDCLK:in std_logic;
		LEDDDAT7:in std_logic;
		LEDDDAT6:in std_logic;
		LEDDDAT5:in std_logic;
		LEDDDAT4:in std_logic;
		LEDDDAT3:in std_logic;
		LEDDDAT2:in std_logic;
		LEDDDAT1:in std_logic;
		LEDDDAT0:in std_logic;
		LEDDADDR3:in std_logic;
		LEDDADDR2:in std_logic;
		LEDDADDR1:in std_logic;
		LEDDADDR0:in std_logic;
		LEDDDEN:in std_logic;
		LEDDEXE:in std_logic;
		LEDDRST:in std_logic
	 	);
end component;


component SB_RGB_DRV  is 
	generic(
		TimingChecksOn : boolean := true;
        Xon            : boolean := false;
        MsgOn          : boolean := false;
		tipd_RGBLEDEN: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_RGB0PWM: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_RGB1PWM: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_RGB2PWM: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_RGBPU: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_RGB0PWM_RGB0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_RGB1PWM_RGB1: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_RGB2PWM_RGB2 : VitalDelayType01 := (0.000 ns, 0.000 ns);	
		RGB0_CURRENT: string:="0b000000"; 
		RGB1_CURRENT: string:="0b000000";
		RGB2_CURRENT: string:="0b000000");   
port(
	RGB0: out std_logic;  
	RGB1: out std_logic;
	RGB2: out std_logic;
	RGBLEDEN  :in std_logic;
	RGB0PWM  :in std_logic;
	RGB1PWM:in std_logic;
	RGB2PWM :in std_logic;
    RGBPU : in std_logic
    );

end component;

component SB_LED_DRV_CUR 
	generic( 
		TimingChecksOn : boolean := true;
        Xon            : boolean := false;
        MsgOn          : boolean := false;
		tipd_EN: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_EN_LEDPU : VitalDelayType01 := (0.000 ns, 0.000 ns));
	Port 	( 
		EN : in  STD_LOGIC;
	        LEDPU : out  STD_LOGIC
		);
end component;

component ICE_IO_OD
	generic (
		NEG_TRIGGER : bit						:=	'0';
		PIN_TYPE	: bit_vector (5 downto 0)	:=	"010000";
		--PULLUP		: bit						:=	'0';
		--IO_STANDARD	: string					:=	"SB_LVCMOS";
		----------------------------------------------------------------------------------
		--VITAL PARAMETER
		---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;
 	        MsgOn : boolean := false;
		--- VITAL path delay
		tipd_DOUT1       : VitalDelayType01 := (0 ns, 0 ns);
   	        tipd_DOUT0       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_CLOCKENABLE        : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_LATCHINPUTVALUE       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_INPUTCLK        : VitalDelayType01 := (0 ns, 0 ns);
		tipd_OUTPUTENABLE       : VitalDelayType01 := (0 ns, 0 ns);
            	tipd_OUTPUTCLK       : VitalDelayType01 := (0 ns, 0 ns);
		tipd_PACKAGEPIN      : VitalDelayType01 := (0 ns, 0 ns);
            	--- VITAL path delay
            	tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_PACKAGEPIN_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_INPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
		--  VITAL clk-to-output path delay
		tpd_INPUTCLK_DIN0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
            	tpd_INPUTCLK_DIN1_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
		tpd_OUTPUTCLK_PACKAGEPIN_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
		--- VITAL setup time
		tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            	tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            	tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            	tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		tsetup_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	tsetup_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		tsetup_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            	tsetup_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
		tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		--- VITAL hold time 
		thold_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            	thold_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		thold_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	thold_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
		thold_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            	thold_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
		thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            	thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns
	     	);
	port 
	    	(
		DOUT1 		    	: in std_logic;
		DOUT0 		    	: in std_logic;
		CLOCKENABLE		: in std_logic;
		LATCHINPUTVALUE		: in std_logic;
		INPUTCLK		: in std_logic;		
		DIN1			: out std_logic;
		DIN0			: out std_logic;
		OUTPUTENABLE		: in std_logic;
		OUTPUTCLK		: in std_logic;
		PACKAGEPIN		: inout	std_logic
		); 	
end component;


COMPONENT  SB_BARCODE_DRV  
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tpd_BARCODEPWM_BARCODE : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_BARCODEEN_BARCODE : VitalDelayType01 := (0 ns, 0 ns);

  		BARCODE_CURRENT :string := "0b0000";
 		CURRENT_MODE :string := "0b0";

  		tipd_BARCODEEN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_BARCODEPWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_CURREN 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        BARCODEEN : in std_logic;
		 BARCODEPWM : in std_logic;
		 CURREN : in std_logic;
        BARCODE : out std_logic
	);	 
END COMPONENT;




COMPONENT  SB_IR400_DRV 
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tpd_IRLEDEN_IRLED : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRPWM_IRLED : VitalDelayType01 := (0 ns, 0 ns);

  		CURRENT_MODE :string := "0b0";
 		IR400_CURRENT :string := "0b00000000";

  		tipd_CURREN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRLEDEN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRPWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        CURREN : in std_logic;
		 IRLEDEN : in std_logic;
		 IRPWM : in std_logic;
        IRLED : out std_logic
	);	 
END COMPONENT;


COMPONENT  SB_IR500_DRV  
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tpd_IRPWM_IRLED1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRLEDEN_IRLED1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRPWM_IRLED2 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRLEDEN_IRLED2 : VitalDelayType01 := (0 ns, 0 ns);

  		CURRENT_MODE :string := "0b0";
 		IR500_CURRENT :string := "0b000000000000";

  		tipd_CURREN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRLEDEN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRPWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        CURREN : in std_logic;
		 IRLEDEN : in std_logic;
		 IRPWM : in std_logic;
        IRLED1 : out std_logic;
		 IRLED2 : out std_logic
	);	 
END COMPONENT;



COMPONENT  SB_RGBA_DRV  
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tpd_RGB0PWM_RGB0 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_RGBLEDEN_RGB0 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_RGB1PWM_RGB1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_RGBLEDEN_RGB1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_RGB2PWM_RGB2 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_RGBLEDEN_RGB2 : VitalDelayType01 := (0 ns, 0 ns);

  		CURRENT_MODE :string := "0b0";
 		RGB0_CURRENT :string := "0b000000";
 		RGB1_CURRENT :string := "0b000000";
 		RGB2_CURRENT :string := "0b000000";

  		tipd_CURREN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_RGB0PWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_RGB1PWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_RGB2PWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_RGBLEDEN 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        CURREN : in std_logic;
		 RGB0PWM : in std_logic;
		 RGB1PWM : in std_logic;
		 RGB2PWM : in std_logic;
		 RGBLEDEN : in std_logic;
        RGB0 : out std_logic;
		 RGB1 : out std_logic;
		 RGB2 : out std_logic
	);	 
END COMPONENT;




component  SB_I2C_FIFO  
 generic ( 
	TimingChecksOn  : boolean := true;
    Xon   : boolean := true;					   
    MsgOn : boolean := false;
	
		tsetup_SDAI_SCLO_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_SDAI_SCLO_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_SDAI_SCLO_negedge_posedge : VitalDelayType := 0 ns;
 		thold_SDAI_SCLO_posedge_posedge : VitalDelayType:= 0 ns;
		tsetup_SDAI_SCLI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_SDAI_SCLI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_SDAI_SCLI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_SDAI_SCLI_posedge_posedge : VitalDelayType:= 0 ns;
  		tsetup_CSI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_CSI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_CSI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_CSI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_STBI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_STBI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_STBI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_STBI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WEI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WEI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WEI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WEI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_FIFORST_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_FIFORST_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_FIFORST_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_FIFORST_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_SDAI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_SDAI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_SDAI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_SDAI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI4_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI4_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI4_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI4_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI5_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI5_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI5_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI5_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI6_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI6_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI6_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI6_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI7_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI7_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI7_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI7_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI8_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI8_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI8_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI8_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DATI9_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DATI9_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DATI9_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DATI9_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_SCLO_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_SCLO_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_SCLO_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_SCLO_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_SCLI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_SCLI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_SCLI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_SCLI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;

  		tpw_CLKI_posedge : VitalDelayType := 0 ns;
 		tpw_CLKI_negedge : VitalDelayType := 0 ns;

  		tpd_CLKI_SCLO : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_SCLO_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_ACKO : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_ACKO_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO0 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO0_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO1 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO1_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO2 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO2_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO3 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO3_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO4 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO4_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO5 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO5_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO6 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO6_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO7 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO7_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO8 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO8_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DATO9 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DATO9_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_I2CIRQ : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_I2CIRQ_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_I2CWKUP : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_I2CWKUP_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_SCLOE : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_SCLOE_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_SDAO : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_SDAO_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_SCLO_SDAO_posedge : VitalDelayType01 := (0 ns, 0 ns);
        	tpd_SCLO_SDAO_negedge : VitalDelayType01 := (0 ns, 0 ns);
			tpd_SCLI_SDAO_posedge : VitalDelayType01 := (0 ns, 0 ns);
        	tpd_SCLI_SDAO_negedge : VitalDelayType01 := (0 ns, 0 ns);
 		 --tpd_CLKI_SDAO_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_SDAOE : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_SDAOE_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_SCLO_SDAOE_posedge : VitalDelayType01 := (0 ns, 0 ns);
        	tpd_SCLO_SDAOE_negedge : VitalDelayType01 := (0 ns, 0 ns);
			tpd_SCLI_SDAOE_posedge : VitalDelayType01 := (0 ns, 0 ns);
        	tpd_SCLI_SDAOE_negedge : VitalDelayType01 := (0 ns, 0 ns);
 		 --tpd_CLKI_SDAOE_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_SRWO : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_SRWO_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		 
         tpd_CLKI_TXFIFOEMPTY_posedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_TXFIFOAEMPTY_posedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_TXFIFOFULL_posedge : VitalDelayType01 := (0 ns, 0 ns);

         tpd_CLKI_RXFIFOEMPTY_posedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_RXFIFOAFULL_posedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_RXFIFOFULL_posedge : VitalDelayType01 := (0 ns, 0 ns);

         tpd_CLKI_TXFIFOEMPTY_negedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_TXFIFOAEMPTY_negedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_TXFIFOFULL_negedge : VitalDelayType01 := (0 ns, 0 ns);

         tpd_CLKI_RXFIFOEMPTY_negedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_RXFIFOAFULL_negedge : VitalDelayType01 := (0 ns, 0 ns);
         tpd_CLKI_RXFIFOFULL_negedge : VitalDelayType01 := (0 ns, 0 ns);

  		I2C_SLAVE_ADDR :string := "0b1111100001";

  		tipd_ADRI0 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI1 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI2 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI3 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_CLKI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_CSI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI0 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI1 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI2 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI3 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI4 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI5 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI6 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI7 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI8 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DATI9 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_FIFORST 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_SCLI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_SDAI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_STBI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
		tipd_SCLO 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WEI 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        ADRI0 : in std_logic;
	ADRI1 : in std_logic;
	ADRI2 : in std_logic;
	ADRI3 : in std_logic;
	CLKI : in std_logic;
	CSI : in std_logic;
	DATI0 : in std_logic :='L';
	 DATI1 : in std_logic :='L';
	 DATI2 : in std_logic :='L';
	 DATI3 : in std_logic :='L';
	 DATI4 : in std_logic :='L';
	 DATI5 : in std_logic :='L';
	 DATI6 : in std_logic :='L';
	 DATI7 : in std_logic :='L';
	 DATI8 : in std_logic :='L';
	 DATI9 : in std_logic :='L';
	 FIFORST : in std_logic;
	 SCLI : in std_logic;
	 SDAI : in std_logic;
	 STBI : in std_logic;
	 WEI : in std_logic;
        ACKO : out std_logic;
	 DATO0 : out std_logic;
	 DATO1 : out std_logic;
	 DATO2 : out std_logic;
	 DATO3 : out std_logic;
	 DATO4 : out std_logic;
	 DATO5 : out std_logic;
	 DATO6 : out std_logic;
	 DATO7 : out std_logic;
	 DATO8 : out std_logic;
	 DATO9 : out std_logic;
	 I2CIRQ : out std_logic;
	 I2CWKUP : out std_logic;
	 MRDCMPL : out std_logic;
	 RXFIFOAFULL : out std_logic;
	 RXFIFOEMPTY : out std_logic;
	 RXFIFOFULL : out std_logic;
	 SCLO : out std_logic;
	 SCLOE : out std_logic;
	 SDAO : out std_logic;
	 SDAOE : out std_logic;
	 SRWO : out std_logic;
	 TXFIFOAEMPTY : out std_logic;
	 TXFIFOEMPTY : out std_logic;
	 TXFIFOFULL : out std_logic
	);	 
end component;


COMPONENT  SB_IR_IP
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tsetup_CSI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_CSI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_CSI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_CSI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_DENI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_DENI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_DENI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_DENI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WEI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WEI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WEI_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WEI_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_ADRI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_ADRI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_ADRI0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_ADRI0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
		tsetup_WDATA0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA0_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA0_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA1_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA1_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA2_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA2_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA3_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA3_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA4_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA4_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA4_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA4_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA5_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA5_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA5_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA5_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA6_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA6_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA6_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA6_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_WDATA7_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_WDATA7_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_WDATA7_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_WDATA7_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_EXE_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_EXE_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_EXE_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_EXE_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		tsetup_LEARN_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		tsetup_LEARN_CLKI_posedge_posedge : VitalDelayType:= 0 ns;
 		thold_LEARN_CLKI_negedge_posedge : VitalDelayType := 0 ns;
 		thold_LEARN_CLKI_posedge_posedge : VitalDelayType:= 0 ns;

  		tpw_CLKI_posedge : VitalDelayType := 0 ns;
 		tpw_CLKI_negedge : VitalDelayType := 0 ns;

  		tpd_CLKI_BUSY : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_BUSY_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_DRDY : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_DRDY_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_ERR : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_ERR_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_IROUT : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_IROUT_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA0 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA0_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA1 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA1_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA2 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA2_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA3 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA3_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA4 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA4_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA5 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA5_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA6 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA6_posedge : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_CLKI_RDATA7 : VitalDelayType01 := (0 ns, 0 ns);
 		 tpd_CLKI_RDATA7_posedge : VitalDelayType01 := (0 ns, 0 ns);
  		tipd_ADRI0 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI1 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI2 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_ADRI3 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_CLKI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_CSI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_DENI 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_EXE 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_LEARN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_RST 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA0 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA1 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA2 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA3 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA4 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA5 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA6 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WDATA7 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_WEI 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        ADRI0 : in std_logic;
		 ADRI1 : in std_logic;
		 ADRI2 : in std_logic;
		 ADRI3 : in std_logic;
		 CLKI : in std_logic;
		 CSI : in std_logic;
		 DENI : in std_logic;
		 EXE : in std_logic;
		 IRIN : in std_logic;
		 LEARN : in std_logic;
		 RST : in std_logic;
		 WDATA0 : in std_logic;
		 WDATA1 : in std_logic;
		 WDATA2 : in std_logic;
		 WDATA3 : in std_logic;
		 WDATA4 : in std_logic;
		 WDATA5 : in std_logic;
		 WDATA6 : in std_logic;
		 WDATA7 : in std_logic;
		 WEI : in std_logic;
        BUSY : out std_logic;
		 DRDY : out std_logic;
		 ERR : out std_logic;
		 IROUT : out std_logic;
		 RDATA0 : out std_logic;
		 RDATA1 : out std_logic;
		 RDATA2 : out std_logic;
		 RDATA3 : out std_logic;
		 RDATA4 : out std_logic;
		 RDATA5 : out std_logic;
		 RDATA6 : out std_logic;
		 RDATA7 : out std_logic
	);	 
END COMPONENT;





COMPONENT  ICE_IR500_DRV  
Generic 
(
		TimingChecksOn  : boolean := true;
		Xon   : boolean := true;					   
		MsgOn : boolean := false;
  		tpd_IRPWM_IRLED1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRLEDEN_IRLED1 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRPWM2_IRLED2 : VitalDelayType01 := (0 ns, 0 ns);
 		tpd_IRLEDEN2_IRLED2 : VitalDelayType01 := (0 ns, 0 ns);

  		CURRENT_MODE :string := "0b0";
 		IR500_CURRENT :string := "0b000000000000";

  		tipd_CURREN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRLEDEN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRLEDEN2 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRPWM 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
 		tipd_IRPWM2 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port (
        CURREN : in std_logic;
		 IRLEDEN : in std_logic;
		 IRLEDEN2 : in std_logic;
		 IRPWM : in std_logic;
		 IRPWM2 : in std_logic;
        IRLED1 : out std_logic;
		 IRLED2 : out std_logic
	);	 
END COMPONENT;




component  SB_RGB_IP  
port (
CLK: in std_logic;
RST: in std_logic;
PARAMSOK: in std_logic;
RGBCOLOR: in std_logic_vector (3 downto 0); 
BRIGHTNESS: in std_logic_vector (3 downto 0); 
BREATHRAMP: in std_logic_vector (3 downto 0); 
BLINKRATE: in std_logic_vector (3 downto 0); 
REDPWM: out std_logic;
GREENPWM:out std_logic;
BLUEPWM:out std_logic
  ); 
end component;

component  SB_LEDDA_IP   

generic (
	TimingChecksOn  	: boolean := true;
	Xon   			: boolean := true;
	MsgOn 			: boolean := true;

	tipd_LEDDCS:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDCLK:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT7:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT6:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT5:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT4:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT3:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT2:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT1:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDAT0:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDADDR3:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDADDR2:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDADDR1:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDADDR0:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDDEN:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDEXE:VitalDelayType01 := (0 ns, 0 ns);
	tipd_LEDDRST:VitalDelayType01 := (0 ns, 0 ns);
	tpd_LEDDCLK_LEDDON_posedge :VitalDelayType01 := (100 ns, 100 ns);
	tpd_LEDDCLK_PWMOUT0_posedge :VitalDelayType01 := (100 ns, 100 ns);
	tpd_LEDDCLK_PWMOUT1_posedge :VitalDelayType01 := (100 ns, 100 ns);
	tpd_LEDDCLK_PWMOUT2_posedge :VitalDelayType01 := (100 ns, 100 ns);
	
	tsetup_LEDDCS_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	tsetup_LEDDCS_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDEN_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	tsetup_LEDDDEN_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDEXE_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	tsetup_LEDDEXE_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR0_LEDDCLK_negedge_posedge :VitalDelayType := 0 ns;
	tsetup_LEDDADDR1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDADDR3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	
	tsetup_LEDDDAT0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT0_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT4_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT4_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT5_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT5_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT6_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT6_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT7_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	tsetup_LEDDDAT7_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	
	thold_LEDDCS_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	thold_LEDDCS_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDEN_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	thold_LEDDDEN_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDEXE_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;	
	thold_LEDDEXE_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR0_LEDDCLK_negedge_posedge :VitalDelayType := 0 ns;
	thold_LEDDADDR1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDADDR3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	
	thold_LEDDDAT0_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT0_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT1_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT1_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT2_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT2_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT3_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT3_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT4_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT4_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT5_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT5_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT6_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT6_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT7_LEDDCLK_posedge_posedge : VitalDelayType := 0 ns;
	thold_LEDDDAT7_LEDDCLK_negedge_posedge : VitalDelayType := 0 ns
	
);
 
port(
	PWMOUT0 : out std_logic;	
	PWMOUT1 : out std_logic;
	PWMOUT2 : out std_logic;
	LEDDON : out std_logic; 
	LEDDCS:in std_logic;
	LEDDCLK:in std_logic;
	LEDDDAT7:in std_logic;
	LEDDDAT6:in std_logic;
	LEDDDAT5:in std_logic;
	LEDDDAT4:in std_logic;
	LEDDDAT3:in std_logic;
	LEDDDAT2:in std_logic;
	LEDDDAT1:in std_logic;
	LEDDDAT0:in std_logic;
	LEDDADDR3:in std_logic;
	LEDDADDR2:in std_logic;
	LEDDADDR1:in std_logic;
	LEDDADDR0:in std_logic;
	LEDDDEN:in std_logic;
	LEDDEXE:in std_logic;
	LEDDRST:in std_logic
    );
end component ;


component SMCCLK is
	Port (  CLK : out  std_logic ); 
end component;

-- SPRAM256

component sadslspk4s1p16384x16m16b4w1c0p1d0t0 is
	port (
		CLK 	: in std_logic ;	
		ADR 	: in std_logic_vector(13 downto 0); 
		D  	: in std_logic_vector(15 downto 0); 
		WEM 	: in std_logic_vector(15 downto 0); 
		WE	: in std_logic; 
		ME	: in std_logic ; 
		LS	: in std_logic; 
		DS	: in std_logic; 
		SD	: in std_logic; 
		Q	: out std_logic_vector(15 downto 0);
		TEST1	: in  std_logic ;
		RME	: in  std_logic; 
		RM	: in   std_logic_vector(3 downto 0)
		);
end component; 


component SB_SPRAM256KA is
			generic (	
		----------------------------------------------------------------------------------
		--VITAL PARAMETER
		---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
		Xon   		: boolean := true;
	        MsgOn 		: boolean := false;
		-- VITAL port delay
	        tipd_CLOCK  	: VitalDelayType01                   := ( 0 ns, 0 ns);
        	tipd_CHIPSELECT : VitalDelayType01                   := ( 0 ns, 0 ns);
		tipd_WREN    	: VitalDelayType01                   := ( 0 ns, 0 ns);
		tipd_STANDBY    : VitalDelayType01                   := ( 0 ns, 0 ns);
		tipd_SLEEP    	: VitalDelayType01                   := ( 0 ns, 0 ns);
		tipd_POWEROFF   : VitalDelayType01                   := ( 0 ns, 0 ns);
           	tipd_ADDRESS	: VitalDelayArrayType01(13 downto 0)  := (others => (0 ns, 0 ns));
           	tipd_DATAIN	: VitalDelayArrayType01(15 downto 0)  := (others => (0 ns, 0 ns));
           	tipd_MASKWREN	: VitalDelayArrayType01(3 downto 0)  := (others => (0 ns, 0 ns));
	         --- VITAL path delay
		--  VITAL clk-to-output path delay
		tpd_CLOCK_DATAOUT_posedge 		: VitalDelayArrayType01(15 downto 0) := (others => (0.000 ns, 0.000 ns));
       		tpd_SLEEP_DATAOUT_posedge 		: VitalDelayArrayType01(15 downto 0) := (others => (0.000 ns, 0.000 ns));
		--- VITAL setup time
		tsetup_ADDRESS_CLOCK_negedge_posedge   	: VitalDelayArrayType(13 downto 0) := (others => 0 ns );
	        tsetup_ADDRESS_CLOCK_posedge_posedge   	: VitalDelayArrayType(13 downto 0) := (others => 0 ns );
	        tsetup_DATAIN_CLOCK_negedge_posedge    	: VitalDelayArrayType(15 downto 0) := (others => 0 ns );
	        tsetup_DATAIN_CLOCK_posedge_posedge    	: VitalDelayArrayType(15 downto 0) := (others => 0 ns );
		tsetup_MASKWREN_CLOCK_negedge_posedge  	: VitalDelayArrayType(3 downto 0) := (others => 0 ns );
	        tsetup_MASKWREN_CLOCK_posedge_posedge  	: VitalDelayArrayType(3 downto 0) := (others => 0 ns );

       		tsetup_WREN_CLOCK_negedge_posedge 	: VitalDelayType := 0 ns;
	        tsetup_WREN_CLOCK_posedge_posedge 	: VitalDelayType := 0 ns;
	        tsetup_CHIPSELECT_CLOCK_posedge_posedge	: VitalDelayType := 0 ns;
	        tsetup_CHIPSELECT_CLOCK_negedge_posedge	: VitalDelayType := 0 ns;

		tsetup_STANDBY_CLOCK_negedge_posedge   	: VitalDelayType := 0 ns;
           	tsetup_STANDBY_CLOCK_posedge_posedge   	: VitalDelayType := 0 ns;
		tsetup_SLEEP_CLOCK_negedge_posedge 	: VitalDelayType := 0 ns;
           	tsetup_SLEEP_CLOCK_posedge_posedge 	: VitalDelayType := 0 ns;

		--- VITAL hold time
		thold_ADDRESS_CLOCK_negedge_posedge   	: VitalDelayArrayType(13 downto 0) := (others => 0 ns );
	        thold_ADDRESS_CLOCK_posedge_posedge   	: VitalDelayArrayType(13 downto 0) := (others => 0 ns );
	        thold_DATAIN_CLOCK_negedge_posedge    	: VitalDelayArrayType(15 downto 0) := (others => 0 ns );
	        thold_DATAIN_CLOCK_posedge_posedge    	: VitalDelayArrayType(15 downto 0) := (others => 0 ns );
		thold_MASKWREN_CLOCK_negedge_posedge  	: VitalDelayArrayType(3 downto 0) := (others => 0 ns );
	        thold_MASKWREN_CLOCK_posedge_posedge  	: VitalDelayArrayType(3 downto 0) := (others => 0 ns );

       		thold_WREN_CLOCK_negedge_posedge 	: VitalDelayType := 0 ns;
	        thold_WREN_CLOCK_posedge_posedge 	: VitalDelayType := 0 ns;
	        thold_CHIPSELECT_CLOCK_posedge_posedge	: VitalDelayType := 0 ns;
	        thold_CHIPSELECT_CLOCK_negedge_posedge	: VitalDelayType := 0 ns;

		thold_STANDBY_CLOCK_negedge_posedge   	: VitalDelayType := 0 ns;
           	thold_STANDBY_CLOCK_posedge_posedge   	: VitalDelayType := 0 ns;
		thold_SLEEP_CLOCK_negedge_posedge 	: VitalDelayType := 0 ns;
		thold_SLEEP_CLOCK_posedge_posedge 	: VitalDelayType := 0 ns
		);

	Port (  CLOCK 	: in std_logic ;	
		ADDRESS : in std_logic_vector(13 downto 0); 
		DATAIN  : in std_logic_vector(15 downto 0); 
		MASKWREN : in std_logic_vector(3 downto 0); 
		WREN	: in std_logic; 
		CHIPSELECT: in std_logic ; 
		STANDBY	: in std_logic; 
		SLEEP	: in std_logic; 
		POWEROFF: in std_logic; 
		DATAOUT	: out std_logic_vector(15 downto 0)		
	     ); 

end component;

component SB_IO_I3C is
 generic (
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"000000";
			PULLUP		: bit						:=	'0';
			WEAK_PULLUP	: bit						:=  '0'; 
			IO_STANDARD	: string					:=	"SB_LVCMOS"
			);
	port 
		(
		D_OUT_1 		    : in std_logic;
		D_OUT_0 		    : in std_logic;
		CLOCK_ENABLE		: in std_logic;
		LATCH_INPUT_VALUE	: in std_logic;
		INPUT_CLK			: in std_logic;			
		D_IN_1				: out std_logic;
		D_IN_0				: out std_logic;
		OUTPUT_ENABLE		: in std_logic	:='H';
		OUTPUT_CLK			: in std_logic;			
		PU_ENB				: in std_logic ; 
		WEAK_PU_ENB			: in std_logic; 		
		PACKAGE_PIN			: inout	std_ulogic
		); 
end component;


component ICE_IO_I3C is
	generic (
			NEG_TRIGGER : bit						:=	'0';
			PIN_TYPE	: bit_vector (5 downto 0)	:=	"010000";
			PULLUP		: bit						:=	'0';
			WEAK_PULLUP	: bit 						:=  '0'; 
			IO_STANDARD	: string					:=	"SB_LVCMOS";
			----------------------------------------------------------------------------------
			--VITAL PARAMETER
			---------------------------------------------------------------------------------
			TimingChecksOn  : boolean := true;
			Xon   : boolean := true;
            MsgOn : boolean := false;
			--- VITAL path delay
			tipd_DOUT1       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_DOUT0       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_CLOCKENABLE        : VitalDelayType01 := (0 ns, 0 ns);
            tipd_LATCHINPUTVALUE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_INPUTCLK        : VitalDelayType01 := (0 ns, 0 ns);
			tipd_OUTPUTENABLE       : VitalDelayType01 := (0 ns, 0 ns);
            tipd_OUTPUTCLK       : VitalDelayType01 := (0 ns, 0 ns);
			tipd_PACKAGEPIN      : VitalDelayType01 := (0 ns, 0 ns);
			tipd_PUENB     		 : VitalDelayType01 := (0 ns, 0 ns);
			tipd_WEAKPUENB	     : VitalDelayType01 := (0 ns, 0 ns);			
            --- VITAL path delay
            tpd_PACKAGEPIN_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_PACKAGEPIN_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_DOUT0_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_DOUT1_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_OUTPUTENABLE_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_LATCHINPUTVALUE_DIN0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_LATCHINPUTVALUE_DIN1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_INPUTCLK_PACKAGEPIN  : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--  VITAL clk-to-output path delay
			tpd_INPUTCLK_DIN0_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
            tpd_INPUTCLK_DIN1_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_posedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			tpd_OUTPUTCLK_PACKAGEPIN_negedge : VitalDelayType01 := (0.000 ns, 0.000 ns);
			--- VITAL setup time
			tsetup_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			tsetup_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            tsetup_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			tsetup_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            tsetup_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			--- VITAL hold time 
			thold_CLOCKENABLE_INPUTCLK_negedge_posedge    : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_INPUTCLK_posedge_posedge    : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_posedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_posedge_negedge : VitalDelayType                   := 0 ns;
            thold_PACKAGEPIN_INPUTCLK_negedge_negedge : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_CLOCKENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT0_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_DOUT0_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns;
			thold_DOUT1_OUTPUTCLK_negedge_negedge   : VitalDelayType                   := 0 ns;
            thold_DOUT1_OUTPUTCLK_posedge_negedge   : VitalDelayType                   := 0 ns;
			thold_OUTPUTENABLE_OUTPUTCLK_negedge_posedge   : VitalDelayType                   := 0 ns;
            thold_OUTPUTENABLE_OUTPUTCLK_posedge_posedge   : VitalDelayType                   := 0 ns
			
 			);
	port 
		(
		DOUT1 		    : in std_logic;
		DOUT0 		    : in std_logic;
		CLOCKENABLE		: in std_logic;
		LATCHINPUTVALUE	: in std_logic;
		INPUTCLK			: in std_logic;
		
		DIN1				: out std_logic;
		DIN0				: out std_logic;
		OUTPUTENABLE		: in std_logic;
		OUTPUTCLK			: in std_logic;	 
		PUENB				: in std_logic; 
		WEAKPUENB			: in std_logic;		
		PACKAGEPIN			: inout	std_logic
		); 
end component;

component IO_PAD_I3C is
	generic	( 
	
		PULLUP          : bit                                           :=      '0';
		WEAK_PULLUP     : bit                                           :=      '0';
		IO_STANDARD     : string                                        :=      "SB_LVCMOS";
		----------------------------------------------------------------------------------
	        --VITAL PARAMETER
	     ---------------------------------------------------------------------------------
		TimingChecksOn  : boolean := true;
        Xon   		: boolean := true;
        MsgOn 		: boolean := false; 
		--- VITAL port delay
		tipd_PACKAGEPIN 	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_DIN            	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_OE              	: VitalDelayType01 := (0 ns, 0 ns);
		tipd_PUENB				: VitalDelayType01 := (0 ns, 0 ns);
		tipd_WEAKPUENB				: VitalDelayType01 := (0 ns, 0 ns);
	  	--- VITAL path delay
	    tpd_PACKAGEPIN_DOUT 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
	    tpd_DIN_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns);
        tpd_OE_PACKAGEPIN 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
		); 	    	
	port
        (
		PACKAGEPIN              : inout std_logic; 
		DOUT               	: out std_logic;
		DIN               	: in std_logic;
		OE 	             	: in std_logic;
		PUENB				: in std_logic; 
		WEAKPUENB			: in std_logic 
		);        

end component;

component SB_FILTER_50NS is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   
      tipd_FILTERIN 		: VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_FILTERIN_FILTEROUT 	: VitalDelayType01 := (0.000 ns, 0.000 ns)
    );
  port(
    FILTEROUT : out std_logic;
    FILTERIN : in std_logic
    );
end component;

end ;
