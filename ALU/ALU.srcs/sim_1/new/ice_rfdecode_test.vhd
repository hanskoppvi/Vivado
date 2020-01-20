----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2020 08:39:30
-- Design Name: 
-- Module Name: ice_rfdecode_test - Behavioral
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

entity ice_rfdecode_test is
--  Port ( );
generic (width : positive := 16);
end ice_rfdecode_test;

architecture Behavioral of ice_rfdecode_test is
    
    signal s_wp_en, s_reset : STD_LOGIC;
    signal s_clk : STD_LOGIC := '0';
    signal s_rp0_addr, s_rp1_addr, s_wp_addr: STD_LOGIC_VECTOR (3 downto 0);
    signal s_rp0_data, s_rp1_data, s_wp_data:  STD_LOGIC_VECTOR (width-1 downto 0);

begin

    dut : entity work.ice_rf_gen
    port map (clk => s_clk,
              reset => s_reset,
              
              rp0_addr => s_rp0_addr,
              rp0_data => s_rp0_data,
              
              rp1_addr => s_rp1_addr,
              rp1_data => s_rp1_data,
              
              wp_addr => s_wp_addr,
              wp_data => s_wp_data,
              wp_en => s_wp_en);
    
    s_clk <= not s_clk after 2.5 ns;
    
           
    s_reset <= '1',
               '0' after 1 ns;
               
                 --0123    
    s_wp_addr  <= "0000" after 5 ns, 
                  "0001" after 10 ns,
                  "0010" after 15 ns,
                  "0011" after 20 ns,
                  "0100" after 25 ns,
                  "0101" after 30 ns,
                  "0110" after 35 ns,
                  "0111" after 40 ns,
                  "1000" after 45 ns,
                  "1001" after 50 ns,
                  "1010" after 55 ns,
                  "1011" after 60 ns,
                  "1100" after 65 ns,
                  "1101" after 70 ns,
                  "1110" after 75 ns,
                  "1111" after 80 ns;         
                  
    s_wp_en <= '1',
               '0' after 86 ns;
                 --0123456789abcdef
    s_wp_data <=  "0101010101010101" after 5 ns, 
                  "0000000000000001" after 10 ns,
                  "0000000000000011" after 15 ns,
                  "0000000000000111" after 20 ns,
                  "0000000000001111" after 25 ns,
                  "0000000000011111" after 30 ns,
                  "0000000000111111" after 35 ns,
                  "0000000001111111" after 40 ns,
                  "0000000011111111" after 45 ns,
                  "0000000111111111" after 50 ns,
                  "0000001111111111" after 55 ns,
                  "0000011111111111" after 60 ns,
                  "0000111111111111" after 65 ns,
                  "0001111111111111" after 70 ns,
                  "0011111111111111" after 75 ns,
                  "0111111111111111" after 80 ns,
                  "1111111111111111" after 85 ns;  
    
    s_rp0_addr <= "0000" after 90 ns,
                  "0001" after 91 ns,
                  "0010" after 92 ns,
                  "0011" after 93 ns,
                  "0100" after 94 ns,
                  "0101" after 95 ns,
                  "0110" after 96 ns,
                  "0111" after 97 ns,
                  "1000" after 98 ns,
                  "1001" after 99 ns,
                  "1010" after 100 ns,
                  "1011" after 101 ns,
                  "1100" after 102 ns,
                  "1101" after 103 ns,
                  "1110" after 104 ns,
                  "1111" after 105 ns; 
                                     
    s_rp1_addr <= "1111" after 90 ns,
                  "1110" after 91 ns,
                  "1101" after 92 ns,
                  "1100" after 93 ns,
                  "1011" after 94 ns,
                  "1010" after 95 ns,
                  "1001" after 96 ns,
                  "1000" after 97 ns,
                  "0111" after 98 ns,
                  "0110" after 99 ns,
                  "0101" after 100 ns,
                  "0100" after 101 ns,
                  "0011" after 102 ns,
                  "0010" after 103 ns,
                  "0001" after 104 ns,
                  "0000" after 105 ns; 
    


end Behavioral;
