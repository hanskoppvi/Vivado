library ieee;
use ieee.std_logic_1164.all;

entity ice_soc is
  generic (data_width  : positive := 16;
           instr_width : positive := 24;
           addr_width  : positive := 12);
  port (clk_in   : in  std_logic;
        clk_out  : out std_logic;
        reset    : in  std_logic;
        led      : out std_logic_vector(7 downto 0);
        pc       : out std_logic_vector(7 downto 0);
		  txd_io   : out std_logic;
        txd      : out std_logic);
end ice_soc;


architecture behaviour of ice_soc is
  signal clk_dv   : std_logic;
  signal clk      : std_logic;
  signal clk90    : std_logic;
  signal dcm_lock : std_logic;
  signal io_addr  : std_logic_vector(11 downto 0);
  signal io_din   : std_logic_vector(data_width-1 downto 0);
  signal io_dout  : std_logic_vector(data_width-1 downto 0);
  signal io_rd    : std_logic;
  signal io_wr    : std_logic;
  signal s_pc     : std_logic_vector(11 downto 0);
  signal tx_busy  : std_logic;
  signal s_txd    : std_logic;
begin

  clk_out <= clk;
  txd     <= s_txd;
  txd_io  <= s_txd;
  
  pc      <= s_pc(7 downto 0);

  led(0) <= reset;
  led(1) <= dcm_lock;
  led(2) <= not s_txd;
  led(3) <= tx_busy;

  led(5 downto 4) <= (others => '0');
  
  led(7) <= io_rd;
  led(6) <= io_wr;
  
  inst_dcm0 :entity work.eds_dcm 
    port map ( CLKIN_IN        => clk_in,
               RST_IN          => reset, 
               CLKDV_OUT       => clk,
               CLKIN_IBUFG_OUT => open,
               CLK0_OUT        => open,
               CLK90_OUT       => open,
               LOCKED_OUT      => dcm_lock);
  
  clk90 <= not clk;
  
  inst_core : entity work.ice_proc(behaviour)
    port map (clk     => clk,
              clk90   => clk90,
              reset   => reset,
              pc      => s_pc,
              io_addr => io_addr,
              io_din  => io_din,
              io_dout => io_dout,
              io_rd   => io_rd,
              io_wr   => io_wr);
  

  uart : entity work.ice_uart(behaviour) 
    port map (clk      => clk,   
              reset    => reset,
              brd      => x"00411A", --x"000208", --x"001458",
              din      => io_dout(7 downto 0),
              din_wen  => io_wr,
              txd      => s_txd,
              tx_busy  => tx_busy);

  io_din <= (data_width-1 downto 1 => '0') & tx_busy;

end behaviour;
