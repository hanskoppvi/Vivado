----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2019 14:35:42
-- Design Name: 
-- Module Name: test_alu_pc - Behavioral
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

entity test_alu_pc is
--  Port ( );
end test_alu_pc;

architecture Behavioral of test_alu_pc is
    
    signal s_reset, s_inc, s_load : STD_LOGIC;
    signal s_clk : STD_LOGIC := '0';
    signal s_imm, s_pc : STD_LOGIC_VECTOR (11 downto 0);
    
begin

    dut: entity work.ice_pc
    port map ( clk => s_clk,
               reset => s_reset,
               inc => s_inc,
               load => s_load,
               imm => s_imm,
               pc => s_pc);
               
       s_clk <= not s_clk after 5 ns;
       
       s_reset <=  '0', 
                   '1' after 10 ns,
                   '0' after 15 ns;
                   
       s_inc <=  '1';
       s_load <=  '0', 
                  '1' after 10 ns,
                  '0' after 20 ns; 
                  
       s_imm <= "101101011010";

end Behavioral;
