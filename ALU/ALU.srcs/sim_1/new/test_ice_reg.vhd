----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2019 07:36:57
-- Design Name: 
-- Module Name: test_ice_reg - Behavioral
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

entity test_ice_reg is
--  Port ( );
end test_ice_reg;

architecture Behavioral of test_ice_reg is
    
    signal s_reset, s_en : STD_LOGIC;
    signal s_clk : STD_LOGIC := '0';
    signal s_d, s_q : STD_LOGIC_VECTOR (15 downto 0);
    
begin

    dut : entity work.ice_reg
    port map (reset => s_reset,
              en => s_en,
              clk => s_clk,
              d => s_d,
              q => s_q);
              
             --0123456789abcdef
    
       s_d <= "0010010010010010";
       
       s_en <= '0',
               '1' after 20 ns;
               
       s_clk <= not s_clk after 5 ns,
                not s_clk after 10 ns,
                not s_clk after 15 ns,
                not s_clk after 20 ns,
                not s_clk after 25 ns,
                not s_clk after 30 ns;
       
       s_reset <=  '1', 
                   '0' after 1 ns;
                
                    
end Behavioral;
