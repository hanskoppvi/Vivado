----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2019 14:13:54
-- Design Name: 
-- Module Name: ice_pc - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ice_pc is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inc   : in  STD_LOGIC;
           load  : in  STD_LOGIC;
           imm   : in  STD_LOGIC_VECTOR (11 downto 0);
           pc    : inout STD_LOGIC_VECTOR (11 downto 0));
end ice_pc;

architecture Behavioral of ice_pc is

    signal temp_pc :  STD_LOGIC_VECTOR (11 downto 0);
    
begin

    
    
    process (clk, reset)
  
    begin 
        
        if reset = '1' then
            temp_pc <= (others => '0');
        elsif clk'event and clk = '1' then 
            if load = '1' and inc = '1' then
                temp_pc <= imm; 
            elsif inc = '1' then
                temp_pc <= STD_LOGIC_VECTOR(unsigned(temp_pc) + 1);
        end if;            
        end if;
    end process;
    
     pc <= temp_pc;

end Behavioral;
