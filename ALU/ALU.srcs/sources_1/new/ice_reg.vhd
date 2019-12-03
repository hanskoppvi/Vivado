----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2019 09:06:51
-- Design Name: 
-- Module Name: ice_reg - Behavioral
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

entity ice_reg is
    generic ( width  : positive := 16);
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           d     : in  STD_LOGIC_VECTOR (width-1 downto 0);
           q     : out STD_LOGIC_VECTOR (width-1 downto 0);
           en    : in  STD_LOGIC);
end ice_reg;

architecture Behavioral of ice_reg is

begin

       process (clk, reset)
       begin
        if reset = '1' then
            q <= (others => '0');
        elsif clk'event and clk ='1' then
            if en = '1' then 
                q <= d;
            end if;
            end if;
        end process; 

end Behavioral;
