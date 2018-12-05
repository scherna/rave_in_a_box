-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_mag_xlconcat_0_0 is
  Port ( 
    In0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end fft_mag_xlconcat_0_0;

architecture stub of fft_mag_xlconcat_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconcat,Vivado 2016.2";
begin
end;
