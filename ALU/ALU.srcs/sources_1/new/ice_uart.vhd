library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ice_uart is
 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           
           brd : in STD_LOGIC_VECTOR (23 downto 0);
           din : in STD_LOGIC_VECTOR (7 downto 0) ;
           din_wen : in STD_LOGIC;
           
           txd : out STD_LOGIC;
           tx_busy : out STD_LOGIC);
end ice_uart;

architecture Behavioral of ice_uart is

    signal s_tick: STD_LOGIC;    
    signal s_brd_counter : STD_LOGIC_VECTOR(23 downto 0);
    signal s_txd, s_fifo, s_busy, s_we: STD_LOGIC;
    signal s_shift,s_shift_next, s_shift_init, s_tests : STD_LOGIC_VECTOR(9 downto 0);
    signal s_count : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    
   
        s_shift_init <= '1' & din & '0';
        s_we <= din_wen;

   process (clk,reset)
   begin
        if reset = '1' then
            s_tick <= '0';
            s_brd_counter <= (others => '0');
        elsif clk'event  and clk = '1' then
            s_brd_counter <= s_brd_counter + 1;
            s_tick<= '0';
            if s_brd_counter = brd then
                s_tick <= '1';
                s_brd_counter <= (others => '0');
            end if;
        end if;
    end process;
    
    
    process (reset,s_tick)
    begin
        if reset = '1' then
                s_txd <= '0';
                s_fifo <= '0';
                s_count <= ( others => '0');
                s_busy <= '0';
                
        elsif s_tick'event and s_tick = '1'  then
        
           if s_we = '1' and s_busy = '0' then
                s_busy <= '1';
                s_shift <= s_shift_init;
           else
           if s_we = '1' and s_busy = '1' then
                    if s_count < "1010" then
                            s_txd <= s_shift(0);
                            s_count <= s_count + 1;
                            s_shift <= '0' & s_shift(9 downto 1)   ;   
                    else
                            s_txd <=  s_shift(0);
                            s_count <= (others => '0');
                            s_busy <= '0';
                    end if;
           end if;
           end if;
       end if;
    end process;
    
    tx_busy <= s_busy;
    txd <= s_txd;
   
                
end Behavioral;
