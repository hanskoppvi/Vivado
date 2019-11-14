----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 07:56:39
-- Design Name: 
-- Module Name: RealTestShi - Behavioral
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

entity RealTestShi is
    --Port ( TestA   : in  STD_LOGIC;
      --     TestOpc : in  STD_LOGIC;
        --   Testpos : in  STD_LOGIC;
          -- TestY   : out STD_LOGIC);
end RealTestShi;

architecture Behavioral of RealTestShi is

    signal sA, sY     : STD_LOGIC_VECTOR (15 downto 0);
    signal sOpc, sPos : STD_LOGIC_VECTOR (3  downto 0);
    
begin

    dut: entity work.ice_shifter
    port map ( a => sA,
               pos => sPos,
               opc => sOpc,
               y => sY);
               
     --     0123456789abcdef
     sA <= "1010000110000001";
     
     
     sPos <= "0011";
             
     sOpc <= "0100";
     
end Behavioral;
