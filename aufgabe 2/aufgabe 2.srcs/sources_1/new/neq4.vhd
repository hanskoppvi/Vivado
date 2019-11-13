----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2019 08:22:33
-- Design Name: 
-- Module Name: neq4 - Behavioral
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

entity neq4 is
    Port ( A : in bit_vector (3 downto 0);
           B : in bit_vector (3 downto 0);
           Y : out bit);
           
end neq4;


architecture behavior of neq4 is

begin
 process (A,B)
    begin 
        if B /= A then
            Y <= '1';
        else
            Y <= '0';
        end if;
 end process;
    

end behavior;

architecture dataflow of neq4 is

begin

    Y <= '0' when A = B else '1';


end dataflow;

architecture logic of neq4 is

begin

    --Y <= A xor B;
    y <= (A(0) xor B(0)) or
         (A(1) xor B(1)) or
         (A(2) xor B(2)) or
         (A(3) xor B(3));

end logic;

architecture netlist of neq4 is

    component xor22 
        Port (X1,X2 : in bit; XY : out bit); 
     end component;
    signal temp : bit_vector( 3 downto 0);
   
begin  
    xor_instance1 : xor22 port map (A(0), B(0), temp(0));
    xor_instance2 : xor22 port map (A(1), B(1), temp(1));
    xor_instance3 : xor22 port map (A(2), B(2), temp(2));
    xor_instance4 : xor22 port map (A(3), B(3), temp(3));

Y <= temp(0) or temp(1) or temp(2) or temp(3);
  
end netlist;


