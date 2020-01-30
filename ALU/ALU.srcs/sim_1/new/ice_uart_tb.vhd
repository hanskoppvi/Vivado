library ieee;
use ieee.std_logic_1164.all;


entity ice_uart_tb is
end ice_uart_tb; 


architecture behaviour of ice_uart_tb is
  signal clk, reset   : std_logic := '0';
  signal uart_brd     : std_logic_vector(23 downto 0);
  signal uart_din     : std_logic_vector(7 downto 0);
  signal uart_din_wen : std_logic;
  signal uart_txd     : std_logic;
  signal uart_tx_busy : std_logic;
  
  
begin

  inst_uart : entity work.ice_uart 
    port map (clk      => clk,
              reset    => reset,
              brd      => uart_brd,
              din      => uart_din,
              din_wen  => uart_din_wen,
              txd      => uart_txd,
              tx_busy  => uart_tx_busy);

  clk <= not clk after 20 ns;
  reset <= '1', '0' after 100 ns;

  uart_brd     <= x"000008";
                 --01234567
  uart_din     <= "10101010";
  uart_din_wen <= '1';
  
end behaviour;
