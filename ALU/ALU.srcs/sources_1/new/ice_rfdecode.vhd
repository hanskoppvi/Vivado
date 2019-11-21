----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2019 17:36:01
-- Design Name: 
-- Module Name: ice_rfdecode - Behavioral
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

entity ice_rfdecode is
    Port ( addr : in  STD_LOGIC_VECTOR (3  downto 0);
           en   : in  STD_LOGIC;
           sel  : out STD_LOGIC_VECTOR (15 downto 0));
end ice_rfdecode;

architecture Behavioral of ice_rfdecode is

begin
          
            
    sel <= "0000000000000000" when addr = "0000" and en = '1' else
           "0000000000000001" when addr = "0001" and en = '1' else
           "0000000000000010" when addr = "0010" and en = '1' else
           "0000000000000100" when addr = "0011" and en = '1' else
           "0000000000001000" when addr = "0100" and en = '1' else
           "0000000000010000" when addr = "0101" and en = '1' else
           "0000000000100000" when addr = "0110" and en = '1' else
           "0000000001000000" when addr = "0111" and en = '1' else
           "0000000010000000" when addr = "1000" and en = '1' else
           "0000000100000000" when addr = "1001" and en = '1' else
           "0000001000000000" when addr = "1010" and en = '1' else
           "0000010000000000" when addr = "1011" and en = '1' else
           "0000100000000000" when addr = "1100" and en = '1' else
           "0001000000000000" when addr = "1101" and en = '1' else
           "0010000000000000" when addr = "1110" and en = '1' else
           "0100000000000000" when addr = "1111" and en = '1' else
           "0000000000000000";
           
           
end Behavioral;
