----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2019 08:58:05
-- Design Name: 
-- Module Name: test_alu_integration - Behavioral
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

entity test_alu_integration is
--  Port ( );
end test_alu_integration;

architecture Behavioral of test_alu_integration is

    component ice_imem
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (11 downto 0);
           dout  : out STD_LOGIC_VECTOR (23 downto 0));
    end component;
    
    component ice_pc
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inc   : in  STD_LOGIC;
           load  : in  STD_LOGIC;
           imm   : in  STD_LOGIC_VECTOR (11 downto 0);
           pc    : out STD_LOGIC_VECTOR (11 downto 0));
     end component;
     
     component ice_idecode
     Port (imm     : in STD_LOGIC;
           grp     : in STD_LOGIC_VECTOR (2 downto 0);
           opc     : in STD_LOGIC_VECTOR (3 downto 0);
           pc_inc  : out STD_LOGIC;
           pc_load : out STD_LOGIC);
     end component;
     
     
     signal s_clk : STD_LOGIC := '0';
     
     signal s_imm_de, s_load, s_inc, s_pc_inc, s_pc_load : STD_LOGIC;
     
     signal s_iaddr,s_imm, s_pc : STD_LOGIC_VECTOR (11 downto 0);
     signal s_instr : STD_LOGIC_VECTOR (23 downto 0);
     signal s_grp : STD_LOGIC_VECTOR  (2 downto 0);
     signal s_opc : STD_LOGIC_VECTOR  (3 downto 0);
     
     signal s_reset_pc, s_reset_imem : STD_LOGIC;
     
begin

    ice_imem_ins : ice_imem Port map 
    (clk   => s_clk, 
     reset => s_reset_imem,
     addr => s_iaddr,
     dout => s_instr);
    
    ice_pc_ins : ice_pc  Port map
    (clk    => s_clk,
     reset  => s_reset_pc,
     inc    => s_inc,
     load   => s_load,
     imm    => s_imm,
     pc     => s_pc);
     
     ice_idecode_ins : ice_idecode Port map
     (imm       => s_imm_de,
      grp       => s_grp,
      opc       => s_opc,
      pc_inc    => s_pc_inc,
      pc_load   => s_pc_load );
    
    s_clk <= not s_clk after 5 ns;
    
    
    
    s_reset_imem <= '1', '0' after 1 ns;
    s_reset_pc <= '1', '0' after 1 ns;

  
    s_iaddr <= s_pc;
    
    
    
    s_imm_de <= s_instr(23);
    s_grp <= s_instr(22 downto 20);
    s_opc <= s_instr(19 downto 16);
    
    s_load <= s_pc_load;
    s_inc <= s_pc_inc;
    s_imm <= s_instr(11 downto 0);
    
     
    

end Behavioral;
