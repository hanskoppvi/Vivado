----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2019 08:36:07
-- Design Name: 
-- Module Name: ALU - Behavioral
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
entity ALU is
    generic ( width : positive := 16);
    
    Port ( a    : in    STD_LOGIC_VECTOR (width -1 downto 0);
           b    : in    STD_LOGIC_VECTOR (width -1 downto 0);
           anl  : in    STD_LOGIC;
           opc  : in    STD_LOGIC_VECTOR (3 downto 0);
           Y    : out   STD_LOGIC_VECTOR (width -1 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

    Y <= (a and b)  when  opc = "0000" else
         (a or b)   when  opc = "0001" else   
         (a nand b) when  opc = "0010" else
         (a nor b)  when  opc = "0011" else
         (a xor b)  when  opc = "0100" else
         (a xnor b) when  opc = "0101" else
         (not a)    when  opc = "0111" else
         a; --when others;
     
         
         
end Behavioral;
