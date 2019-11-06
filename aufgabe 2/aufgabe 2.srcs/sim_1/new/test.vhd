----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2019 17:49:49
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    --Port ( testA : in STD_LOGIC;
          -- testB : in STD_LOGIC;
        --   testY : out STD_LOGIC);
end test;

architecture Behavioral of test is

signal x,d : bit_vector(3 downto 0);
signal z : bit; 

begin

dut: entity work.neq4
port map( A => x,  
          b => d,
          Y => z);


x <= "0000",
     "1111" after 10 ns,
     "1010" after 20 ns,
     "0101" after 30 ns,
     "1100" after 40 ns;
     
d <= "0000",
     "1111" after 10 ns,
     "0101" after 20 ns,
     "1010" after 30 ns,
     "0011" after 40 ns;

end Behavioral;
