----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2019 08:13:03
-- Design Name: 
-- Module Name: ice_rf_gen - Behavioral
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

entity ice_rf_gen is
    generic (width : positive := 16);
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           
           rp0_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           rp0_data : out STD_LOGIC_VECTOR (width-1 downto 0);
           rp1_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           rp1_data : out STD_LOGIC_VECTOR (width-1 downto 0);
            
           wp_addr  : in  STD_LOGIC_VECTOR (3 downto 0);
           wp_data  : in  STD_LOGIC_VECTOR (width-1 downto 0);
           wp_en    : in  STD_LOGIC);
           
end ice_rf_gen;

architecture Behavioral of ice_rf_gen is

    component ice_rfdecode is
        port (addr : in  STD_LOGIC_VECTOR (3  downto 0);
              en   : in  STD_LOGIC;
              sel  : out STD_LOGIC_VECTOR (width-1 downto 0));
    end component ice_rfdecode;

    --signal s_dec_addr : STD_LOGIC_VECTOR (3 downto 0);
    --signal s_dec_en   : STD_LOGIC;
    signal s_dec_sel  : STD_LOGIC_VECTOR (width-1 downto 0);
    
 
    component ice_reg is
        Port (clk   : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              d     : in  STD_LOGIC_VECTOR (width-1 downto 0);
              q     : out STD_LOGIC_VECTOR (width-1 downto 0);
              en    : in  STD_LOGIC);
    end component ice_reg;
    
    signal s_reg_clk, s_reg_en : STD_LOGIC;
    signal s_reg_d, s_reg_q, s_wp_data : STD_LOGIC_VECTOR (width-1 downto 0);
    
    type REG_ARRAY_TYPE is array (15 downto 0) of
                                    STD_LOGIC_VECTOR (width-1 downto 0);
    signal s_rf : REG_ARRAY_TYPE;
    
begin
    
    
    ins_dec : ice_rfdecode port map ( addr => wp_addr,
                                     en   => wp_en,
                                     sel  => s_dec_sel);
    

    preg : for i in 15 downto 0 generate
        regx : ice_reg port map (clk   => clk, 
                             reset => reset,
                             d     => wp_data,
                             q     => s_rf(i),
                             en    => s_dec_sel(i));
    end generate preg;
   
    rp0_data <= s_rf(to_integer(unsigned(rp0_addr)));
    rp1_data <= s_rf(to_integer(unsigned(rp1_addr)));
    
end Behavioral;
