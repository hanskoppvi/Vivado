library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;


entity ice_imem is
  generic (instr_width : positive := 24);
  port (clk    : in  std_logic;
        reset  : in  std_logic;

        addr  : in  std_logic_vector(11 downto 0);
        dout  : out std_logic_vector(instr_width-1 downto 0));
end ice_imem;

architecture simulation of ice_imem is
  subtype instr_type is std_logic_vector(instr_width-1 downto 0);
  type instr_mem_type is array(0 to 4095) of instr_type;
  signal instr_mem : instr_mem_type;
begin

  process (reset)

    procedure load_file is
      variable i : integer;
      file datafile : TEXT;    
      variable line_in : Line;
      variable val : std_logic_vector(instr_width-1 downto 0);
      variable ok : boolean;
      variable ch : character;
    begin
      
      file_open(datafile,"imem.dat",READ_MODE);
      i := 0;
    
      loop
        if endfile(datafile) then          
          assert false
            report "end of file encountered in imem.dat"
            severity NOTE;
          return;
        end if;

        val := (others => '0');
        readline(datafile, line_in);
      
        for i in line_in'range loop
          read(line_in, ch);
          report "huhu " & ch;
          case ch is
            when '0' => val := val(instr_width-1-4 downto 0) & "0000";
            when '1' => val := val(instr_width-1-4 downto 0) & "0001";
            when '2' => val := val(instr_width-1-4 downto 0) & "0010";
            when '3' => val := val(instr_width-1-4 downto 0) & "0011";
            when '4' => val := val(instr_width-1-4 downto 0) & "0100";
            when '5' => val := val(instr_width-1-4 downto 0) & "0101";
            when '6' => val := val(instr_width-1-4 downto 0) & "0110";
            when '7' => val := val(instr_width-1-4 downto 0) & "0111";
            when '8' => val := val(instr_width-1-4 downto 0) & "1000";
            when '9' => val := val(instr_width-1-4 downto 0) & "1001";
            when 'a' | 'A' => val := val(instr_width-1-4 downto 0) & "1010";
            when 'b' | 'B' => val := val(instr_width-1-4 downto 0) & "1011";
            when 'c' | 'C' => val := val(instr_width-1-4 downto 0) & "1100";
            when 'd' | 'D' => val := val(instr_width-1-4 downto 0) & "1101";
            when 'e' | 'E' => val := val(instr_width-1-4 downto 0) & "1110";
            when 'f' | 'F' => val := val(instr_width-1-4 downto 0) & "1111";              
            when others => null;                      
          end case;
        end loop;
        
        instr_mem(i) <= val;
        i := i + 1;
      end loop;
    end load_file;

  begin
    if reset = '1' then
      instr_mem <= (others => (others => '0'));
      load_file;
    end if;
  end process;

  dout <= instr_mem(conv_integer(addr)); -- when clk'event and clk = '1' else instr;

end simulation;       
