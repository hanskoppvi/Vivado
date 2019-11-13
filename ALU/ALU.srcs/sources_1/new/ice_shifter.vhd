----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2019 13:07:28
-- Design Name: 
-- Module Name: ice_shifter - Behavioral
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

entity ice_shifter is
    Port ( a    : in  STD_LOGIC_VECTOR  (15 downto 0);
           pos  : in  STD_LOGIC_VECTOR  (3  downto 0);
           opc  : in  STD_LOGIC_VECTOR  (3  downto 0);
           y    : out STD_LOGIC_VECTOR  (15 downto 0));
           
end ice_shifter;

architecture Behavioral of ice_shifter is

    signal Layer1, Layer2, Layer3, ForthLayer : STD_LOGIC_VECTOR (15 downto 0);
begin

    -- Links
    Layer1  <= a      (14 downto 0)  & '0'        when pos(0) = '1' else a;
    Layer2  <= Layer1 (13 downto 0)  & "00"       when pos(1) = '1' else Layer1;
    Layer3  <= Layer2 (11 downto 0)  & "0000"     when pos(2) = '1' else Layer2;
    y       <= Layer3 (7  downto 0)  & "00000000" when pos(3) = '1' else Layer3;
    
    -- Rechts
    Layer1  <= '0'        & a      (15 downto 1) when pos(0) = '1' else a;
    Layer2  <= "00"       & Layer1 (15 downto 2) when pos(1) = '1' else Layer1;
    Layer3  <= "0000"     & Layer2 (15 downto 4) when pos(2) = '1' else Layer2;
    y       <= "00000000" & Layer3 (15 downto 8) when pos(3) = '1' else Layer3;
    


end Behavioral;
