----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2019 08:36:20
-- Design Name: 
-- Module Name: quick_and_dirty - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity quick_and_dirty is
  Port ( s1 : in bit;
         s2 : in bit;
         s3 : in bit;
         s4 : in bit_vector(15 to 0);
         s5 : in bit_vector(15 downto 0);
         s6 : out bit_vector(15 downto 0);
         s7 : out bit;
         s8 : out bit 
        );
   Signal   signal_S1, signal_S2, signal_S3,signal_S7,signal_S8 : bit;
   Signal   signal_S4, signal_S5, signal_S6: bit_vector;
          
end quick_and_dirty;

entity udriver is
    Generic  (width  : positive  := 4);
    Port    ( A : in bit_vector (width-1 downto 0); 
              B : out bit_vector (width-1 downto 0));   
 end udriver;   
 
 entity udriver_tri is
    Port    ( enble : in bit;
              A : in bit_vector (0 to 3); 
              B : out bit_vector (0 to 3));   
 end udriver_tri    ;            



architecture Behavioral of quick_and_dirty is

begin
--dut: entity work.quic_and_dirty
--port map( s1 => signal_S1,
  --        s2 => signal_S2,
    --      s3 => signal_S3,
      --    s4 => signal_S4,
        --  s5 => signal_S5,
          --s6 => signal_S6,
          --s7 => signal_S7,
          --s8 => signal_S8 
          --);

             
end Behavioral;
