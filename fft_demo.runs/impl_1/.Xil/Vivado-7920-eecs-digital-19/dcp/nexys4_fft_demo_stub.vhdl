-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nexys4_fft_demo is
  Port ( 
    CLK100MHZ : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BTNC : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    BTNL : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    BTND : in STD_LOGIC;
    AD3P : in STD_LOGIC;
    AD3N : in STD_LOGIC;
    VGA_R : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_B : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_HS : out STD_LOGIC;
    VGA_VS : out STD_LOGIC;
    AUD_PWM : out STD_LOGIC;
    AUD_SD : out STD_LOGIC;
    LED16_B : out STD_LOGIC;
    LED16_G : out STD_LOGIC;
    LED16_R : out STD_LOGIC;
    LED17_B : out STD_LOGIC;
    LED17_G : out STD_LOGIC;
    LED17_R : out STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SEG : out STD_LOGIC_VECTOR ( 7 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end nexys4_fft_demo;

architecture stub of nexys4_fft_demo is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
