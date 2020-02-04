library ieee;
use ieee.std_logic_1164.all;


entity ice_idecode is
  port (imm        : in  std_logic;
        grp        : in  std_logic_vector(2 downto 0);
        opc        : in  std_logic_vector(3 downto 0);
        cmp_z      : in  std_logic;
        cmp_nz     : in  std_logic;
        
        pc_load    : out std_logic;
        pc_inc     : out std_logic;
        alu_anl    : out std_logic;
        rf_wp_en   : out std_logic;
        dmem_wen   : out std_logic;
        io_wr      : out std_logic;
        io_rd      : out std_logic);
end ice_idecode;


architecture behaviour of ice_idecode is
  type igroup_type is (iUDEF, iBRA, iARITH, iLOGIC, iCMP, iMEM, iSHIFT, iNOP, iRES);
  signal igroup : igroup_type;
begin

  with grp select
    igroup <= iBRA   when "000",
              iARITH when "001",
              iLOGIC when "010",
              iSHIFT when "011",
              iCMP   when "100",
              iMEM   when "101",
              IRES   when "110",
              iNOP   when "111",
              iUDEF  when others;


  process (imm, grp, opc, cmp_z, cmp_nz)
  begin
    
    pc_load             <= '0';   -- default : PC load immediate disabled
    pc_inc              <= '1';   -- default : PC increment address
    alu_anl             <= '1';   -- default : ALU in arithmetic mode
    rf_wp_en            <= '0';   -- default : RF write port disabled
    dmem_wen            <= '0';
    io_rd               <= '0';
    io_wr               <= '0';
    
    case grp is

      -- BRANCH GROUP
      
      when "000" =>
        case opc is
          when "0000" =>
            pc_inc <= '0';
            pc_load <= '1';

          when "0001" =>
            if cmp_nz = '1' then
              pc_inc              <= '0';
              pc_load             <= '1';
            end if;
            
          when "0010" =>
            if cmp_z = '1' then
              pc_inc              <= '0';
              pc_load             <= '1';
            end if;
          when others => null;
        end case;

      -- ARITHMETIC, SHIFT, COMPARE and some other GROUP
        
      when "001" =>
        alu_anl  <= '1';
        rf_wp_en <= '1';
        
      when "010" =>
        alu_anl  <= '0';
        rf_wp_en <= '1';

      when "011" => 
        rf_wp_en <= '1';
        
      when "100" =>
        rf_wp_en <= '1';


      -- MEMORY GROUP
        
      when "101" =>
        case opc is
          when "0000" =>       -- LDI : load immediate to register file;
            rf_wp_en <= '1';

           when "0001" =>      -- LDM load from data memory to register file
            rf_wp_en <= '1';

          when "0010" =>       -- STM store from register file to data memory
            dmem_wen <= '1';

          when "0011" =>       -- LDIO : load from io memory to register file
            rf_wp_en <= '1';
            io_rd    <= '1';

          when "0100" =>       -- STIO : store from register file to io memory
            io_wr <= '1';

          when others => null;
        end case;
       
      when others => null;
    end case;
  end process;
  

end behaviour;
  
