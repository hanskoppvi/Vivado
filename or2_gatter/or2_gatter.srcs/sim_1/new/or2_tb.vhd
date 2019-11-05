----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2019 08:27:54
-- Design Name: 
-- Module Name: or2_tb - Behavioral
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

entity or2_tb is
--  Port ( );
end or2_tb;

architecture Behavioral of or2_tb is
 signal s_a, s_b, s_y : std_logic;

begin

   dut: entity work.or2
   port map ( a => s_a,
              b => s_b,
              y => s_y);
          
    s_a <= '0', '1' after 20 ns;
    s_b <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;  
    


end Behavioral;
