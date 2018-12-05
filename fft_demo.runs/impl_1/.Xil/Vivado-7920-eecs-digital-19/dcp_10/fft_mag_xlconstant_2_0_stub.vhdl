-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_mag_xlconstant_2_0 is
  Port ( 
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

end fft_mag_xlconstant_2_0;

architecture stub of fft_mag_xlconstant_2_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
