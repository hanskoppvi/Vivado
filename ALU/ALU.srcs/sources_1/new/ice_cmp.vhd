----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 08:44:39
-- Design Name: 
-- Module Name: ice_cmp - Behavioral
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

entity ice_cmp is
    generic (width : positive := 16);
    Port ( a   : in STD_LOGIC_VECTOR(width - 1 downto 0);
           b   : in STD_LOGIC_VECTOR(width - 1 downto 0);
           opc : in STD_LOGIC_VECTOR(3 downto 0);
           z   : out STD_LOGIC;
           nz  : out STD_LOGIC;
           y   : out STD_LOGIC_VECTOR(width - 1 downto 0));
end ice_cmp;

architecture Behavioral of ice_cmp is

    signal s_eq, s_agt, s_z, temp_Y : STD_LOGIC;
    
begin

    s_eq  <= '1' when a = b else '0';
    s_agt <= '1' when a > b else '0';
    s_z   <= '1' when a = "0000000000000000" else '0'; 
    
    process (opc, s_eq, s_agt)
        begin
            
            case opc is 
                when "0000" =>
                    temp_Y <= not s_agt and not s_eq;
                when "0001" =>
                    temp_Y <= not s_agt or s_eq;
                when "0010" =>
                    temp_Y <= s_agt and not s_eq;
                when "0011" => 
                    temp_Y <= s_agt or s_eq;
                when "0100" =>
                    temp_Y <= s_eq;
                when "0101" =>
                    temp_Y <= not s_eq;
                when others =>
                    temp_y <= '1';    
                end case;
        end process;
    y  <= "000000000000000" & temp_Y;
    z  <= s_z;
    nz <= not s_z;

end Behavioral;
