----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2019 07:04:57
-- Design Name: 
-- Module Name: test_decode - Behavioral
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

entity test_decode is

end test_decode;

architecture Behavioral of test_decode is
    signal sAddr : STD_LOGIC_VECTOR ( 3 downto 0);
    signal sSel : STD_LOGIC_VECTOR (15 downto 0);
    signal sen : STD_LOGIC;
begin

    dut : entity work.ice_rfdecode
    port map ( addr => sAddr,
               sel => sSel,
               en => sEn);
               
     sEn <= '1' , 
            '0' after 25 ns ;
     
     sAddr <= "0001",
              "0010" after 10 ns,
              "1011" after 20 ns,
              "1100" after 40 ns;
               
end Behavioral;
