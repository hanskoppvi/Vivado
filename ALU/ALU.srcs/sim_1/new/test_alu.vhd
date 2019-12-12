----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 08:21:28
-- Design Name: 
-- Module Name: test_alu - Behavioral
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

entity test_alu is
--  Port ( );
end test_alu;

architecture Behavioral of test_alu is

    signal s_a, s_b, s_Y : STD_LOGIC_VECTOR (15 downto 0);
    signal s_anl : STD_LOGIC;
    signal s_opc : STD_LOGIC_VECTOR (3 downto 0); 

begin

    dut : entity work.ALU
        port map ( a => s_a,
                   b => s_b,
                   Y => s_Y,
                   anl => s_anl,
                   opc => s_opc);
          --0123456789abcdef         
    s_a <= "0000000000000011";
    s_b <= "0000000000000010";
    
    s_anl <= '0',
             '1' after 31 ns;
    s_opc <= "0000",
             "0001" after 5 ns,   
             "0010" after 10 ns,
             "0011" after 15 ns,
             "0100" after 20 ns,
             "0101" after 25 ns,    
             "0110" after 30 ns,
             "0000" after 35 ns,
             "0001" after 40 ns,   
             "0010" after 45 ns,
             "0011" after 50 ns,
             "1000" after 52 ns;   

end Behavioral;
