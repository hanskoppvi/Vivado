----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2019 13:07:28
-- Design Name: 
-- Module Name: ice_shifter - Behavioral
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

entity ice_shifter is
    Port ( a    : in  STD_LOGIC_VECTOR  (15 downto 0);
           pos  : in  STD_LOGIC_VECTOR  (3  downto 0);
           opc  : in  STD_LOGIC_VECTOR  (3  downto 0);
           y    : out STD_LOGIC_VECTOR  (15 downto 0));
           
end ice_shifter;

architecture Behavioral of ice_shifter is

    signal Layer1, Layer2, Layer3 : STD_LOGIC_VECTOR (15 downto 0);
    signal temp : STD_LOGIC_VECTOR (15 downto 0);
begin

    
    with (pos(0) & opc) select -- Layer1
        Layer1  <= 
                a(14 downto 0) & '0'            when "10000",           --LSL
                '0'            & a(15 downto 1) when "10001" | "10010", --LSR and ASL
                a(14 downto 0) & a(15)          when "10011",           --ROL
                a(0)           & a(15 downto 1) when "10100",           --ROR
                a when others;
                
     with (pos(1) & opc) select       
        Layer2 <=  
                Layer1 (13 downto 0) & "00"                  when "10000",           --LSL
                "00"                 & Layer1 (15 downto 2)  when "10001" | "10010", --LSR and ASL
                Layer1 (13 downto 0) & Layer1 (15 downto 14) when "10011",           --ROL
                Layer1 (1 downto 0)  & Layer1 (15 downto 2)  when "10100",           --ROR
                Layer1 when others;
                
     with (pos(2) & opc) select
        Layer3 <= 
                Layer2 (11 downto 0) & "0000"                when"10000",            --LSL
                "0000"               & Layer2 (15 downto 4)  when "10001" | "10010", --LSR and ASR
                Layer2 (11 downto 0) & Layer2 (15 downto 12) when "10011",           --ROL
                Layer2 (3 downto 0)  & Layer2 (15 downto 4)  when "10100",           --ROR   
                Layer2 when others;
                
      with (pos(3) & opc) select
        temp <= 
                Layer3 (7  downto 0) & "00000000"           when "10000",           --LSL
                "00000000"           & Layer3 (15 downto 8) when "10001" | "10010", --LSR and ASL
                Layer3 (7  downto 0) & Layer3 (15 downto 8) when "10011",           --ROL
                Layer3 (7 downto 0)  & Layer3 (15 downto 8) when "10100",           --ROR
                Layer3 when others;
                            
        
        Y <= a(15) & temp(14 downto 0) when opc = "0010" else temp;

end Behavioral;
