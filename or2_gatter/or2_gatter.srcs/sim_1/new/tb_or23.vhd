library ieee;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_or23 is
--    Port ( a : in STD_LOGIC;
--           b : in STD_LOGIC;
--           y : out STD_LOGIC);
end tb_or23;

architecture Behavioral of tb_or23 is
 signal s_a, s_b, s_y : bit;
begin
   dut: entity work.or2
   port map ( a => s_a,
              b => s_b,
              y => s_y);
          
    s_a <= '0', '1' after 20 ns;
    s_b <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;  
    

end Behavioral;
