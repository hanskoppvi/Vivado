----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2019 09:17:09
-- Design Name: 
-- Module Name: tb_or22 - Behavioral
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

entity tb_or22 is
--  Port ( );
end tb_or22;

architecture Behavioral of tb_or22 is   
    signal s_a, s_b, s_y : bit;
begin
    dut: entity work.or2;
    port map (std_logic a => s_a,
              std_logic b => s_b,
              std_logic y => s_y);
              
    s_a <= '0', '1' after 20 ns;
    s_b <= '0', '1' after 10 ns,
           '0' after 20 ns,
           '1' after 30 ns; 
       
end Behavioral;
