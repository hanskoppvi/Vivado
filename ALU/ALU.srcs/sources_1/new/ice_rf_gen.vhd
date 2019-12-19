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
           reset    : in  STD_LOGIC_VECTOR (width-1 downto 0);
           rp0_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           rp0_data : out STD_LOGIC_VECTOR (width-1 downto 0);
           rp1_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           rp1_data : out STD_LOGIC_VECTOR (width-1 downto 0);
           wp_addr  : in  STD_LOGIC_VECTOR (3 downto 0);
           wp_data  : in  STD_LOGIC_VECTOR (width-1 downto 0);
           wp_en    : in  STD_LOGIC);
end ice_rf_gen;

architecture Behavioral of ice_rf_gen is

    signal s_dec_addr : STD_LOGIC_VECTOR (3 downto 0);
    signal s_dec_en   : STD_LOGIC;
    signal s_dec_sel  : STD_LOGIC_VECTOR (width-1 downto 0);
    signal s_q, s_d   : STD_LOGIC_VECTOR (width-1 downto 0);
    

    component dec is
        port (addr : in  STD_LOGIC_VECTOR (3  downto 0);
              en   : in  STD_LOGIC;
              sel  : out STD_LOGIC_VECTOR (width-1 downto 0));
    end component dec;

    component reg is
        Port (clk   : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              d     : in  STD_LOGIC_VECTOR (width-1 downto 0);
              q     : out STD_LOGIC_VECTOR (width-1 downto 0);
              en    : in  STD_LOGIC);
    end component reg;
    
    signal s_reg_clk, s_reg_reset, s_reg_en : STD_LOGIC;
    signal s_reg_d, s_reg_q : STD_LOGIC_VECTOR (width-1 downto 0);
    
    type REG_ARRAY_TYPE is array (15 downto 0) of
                                    STD_LOGIC_VECTOR (width-1 downto 0);
    signal s_rf : REG_ARRAY_TYPE;
begin

    ins_dec : dec port map ( addr => s_dec_addr,
                             en   => s_dec_en,
                             sel  => s_dec_sel);
    s_dec_addr <= wp_addr;
    s_dec_en   <= wp_en;
    
    preg : for i in 0 to 15 generate
        regx : reg port map (clk   => s_reg_clk, 
                             reset => reset(i),
                             d     => wp_data,
                             q     => s_rf(i),
                             en    => s_dec_sel(i));
    end generate preg;
    
    
    rp0_data <= s_rf(to_integer(unsigned(rp0_addr)));
    rp1_data <= s_rf(to_integer(unsigned(rp1_addr)));
    
    
    
        
        
        


end Behavioral;
