----------------------------------------------------------------------------------
-- Create Date:    18:38:32 01/16/2016 
-- Module Name:    ROM_512x32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
use IEEE.NUMERIC_STD.all;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ROM_512x32Bit IS
	PORT(
		addr   : IN    std_logic_vector(31 DOWNTO 0);
		dataIO : INOUT std_logic_vector(31 DOWNTO 0)
	);
END ROM_512x32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of ROM_512x32Bit is
begin
	-- pragma synthesis_off
	process is
		file mem_file: TEXT;
		variable L: line;
		variable ch: character;
		variable i, index, result: integer;
		type ramtype is array (511 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
		variable mem: ramtype;
	begin
		-- initialize memory from file
		for i in 0 to 511 loop -- set all contents low
			mem(i) := (others => '0');
		end loop;

		index := 0;
		FILE_OPEN (mem_file, "memfile.dat", READ_MODE);
		while not endfile(mem_file) loop
		readline(mem_file, L);
		result := 0;

		for i in 1 to 8 loop
			read (L, ch);
			if '0' <= ch and ch <= '9' then
				result := character'pos(ch) - character'pos('0');
			elsif 'a' <= ch and ch <= 'f' then
				result := character'pos(ch) - character'pos('a')+10;
			else report "Format error on line" & integer'
				image(index) severity error;
			end if;
			if i = 1 then
				mem(index+3)(7 downto 4) := std_logic_vector(to_unsigned(result,4));
			elsif i = 2 then
				mem(index+3)(3 downto 0) := std_logic_vector(to_unsigned(result,4));
			elsif i = 3 then
				mem(index+2)(7 downto 4) := std_logic_vector(to_unsigned(result,4));
			elsif i = 4 then
				mem(index+2)(3 downto 0) := std_logic_vector(to_unsigned(result,4));
			elsif i = 5 then
				mem(index+1)(7 downto 4) := std_logic_vector(to_unsigned(result,4));
			elsif i = 6 then
				mem(index+1)(3 downto 0) := std_logic_vector(to_unsigned(result,4));
			elsif i = 7 then
				mem(index)(7 downto 4) := std_logic_vector(to_unsigned(result,4));
			elsif i = 8 then
				mem(index)(3 downto 0) := std_logic_vector(to_unsigned(result,4));
			end if;
		end loop;
			index := index + 4;
		end loop;
		-- read memory
		loop
			dataIO(7 DOWNTO 0)   <= mem(to_integer(unsigned(addr(8 DOWNTO 0))));
			dataIO(15 DOWNTO 8)  <= mem(to_integer(unsigned(addr(8 DOWNTO 0)))+1);
			dataIO(23 DOWNTO 16) <= mem(to_integer(unsigned(addr(8 DOWNTO 0)))+2);
			dataIO(31 DOWNTO 24) <= mem(to_integer(unsigned(addr(8 DOWNTO 0)))+3);
			wait on addr;
		end loop;
	end process;
	-- pragma synthesis_on
end;