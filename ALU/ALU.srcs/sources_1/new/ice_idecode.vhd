----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2019 18:04:07
-- Design Name: 
-- Module Name: ice_idecode - Behavioral
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

entity ice_idecode is
    Port ( imm     : in STD_LOGIC;
           grp     : in STD_LOGIC_VECTOR (2 downto 0);
           opc     : in STD_LOGIC_VECTOR (3 downto 0);
           pc_inc  : out STD_LOGIC;
           pc_load : out STD_LOGIC);
end ice_idecode;

architecture Behavioral of ice_idecode is

begin

-- pc_inc  <= '1' when grp = "000" and opc = "0000" else '0';
 --pc_load <= '1' when grp = "000" and opc = "0000" else '0';
 
 process(grp,opc)
begin
    if (grp = "000" and opc = "0000") then
         pc_inc  <='1';
         pc_load <='1' ;
   else
         pc_inc  <= '1';
         pc_load <= '0';
end if;
end process;
       

end Behavioral;
