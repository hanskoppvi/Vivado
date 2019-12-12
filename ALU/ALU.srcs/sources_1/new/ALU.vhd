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
use IEEE.STD_LOGIC_SIGNED.ALL;    
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

    signal temp_Y: STD_LOGIC_VECTOR (width -1 downto 0);

begin

    process(anl,opc)
        begin
        if anl = '0' then
        case (opc) is 
            when "0000" => 
                temp_Y <= (a and b);
            when "0001" => 
                temp_Y <= (a or b);   
            when "0010" =>
                temp_Y <= (a nand b);  
            when "0011" =>
                temp_Y <= (a nor b);
            when "0100" =>
                temp_Y <= (a xor b);
            when "0101" =>
                temp_Y <= (a xnor b);     
            when "0110" =>
                temp_Y <=  (not a);
            when others =>
                temp_Y <= a; 
           end case;     
         else
          case (opc) is 
            when "0000" => 
                temp_Y <= (a + b);
            when "0001" => 
                temp_Y <= (a - b);   
            when "0010" =>
                temp_Y <= (a + 1);  
            when "0011" =>
                temp_Y <= (a - 1);
             when others =>
                temp_Y <= a;
           end case;
           end if;   
     end process;
     
     Y <= temp_Y;
         
         
end Behavioral;
