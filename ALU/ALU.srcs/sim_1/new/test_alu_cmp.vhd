----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 09:04:06
-- Design Name: 
-- Module Name: test_alu_cmp - Behavioral
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

entity test_alu_cmp is
--  Port ( );
end test_alu_cmp;

architecture Behavioral of test_alu_cmp is

    signal s_a, s_b, s_y : STD_LOGIC_VECTOR(15 downto 0);
    signal s_opc: STD_LOGIC_VECTOR(3 downto 0);
    signal s_z, s_nz : STD_LOGIC;
    

begin

    dut : entity work.ice_cmp
    port map ( a => s_a,
               b => s_b,
               y => s_y,
               opc => s_opc,
               z => s_z,
               nz => s_nz);
          --0123456789abcdef    
    s_a <= "0000000000000100",
           "0000100000000000" after 35 ns,
           "0000000000000001" after 60 ns;
    s_b <= "0000000000000100";
    
    s_opc <= "0000" ,
             "0001" after 10 ns,   
             "0010" after 15 ns,
             "0011" after 20 ns,
             "0100" after 25 ns,
             "0101" after 30 ns,
             "0000" after 35 ns,
             "0001" after 40 ns,
             "0010" after 45 ns,
             "0011" after 50 ns,
             "0100" after 55 ns,
             "0101" after 60 ns,
             "0000" after 65 ns,
             "0001" after 70 ns,   
             "0010" after 75 ns,
             "0011" after 80 ns,
             "0100" after 85 ns,
             "0101" after 90 ns;
      
            
end Behavioral;
