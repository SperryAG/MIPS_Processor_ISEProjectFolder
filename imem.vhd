----------------------------------------------------------------------------------
-- Create Date:    14:47:58 01/24/2016 
-- Module Name:    imem - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

use STD.TEXTIO.all;

	entity imem is -- instruction memory
		port(
				a: in STD_LOGIC_VECTOR(5 downto 0);
				rd: out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end imem;

architecture Behavioral of imem is
begin
	process is
		file mem_file: TEXT;
		variable L: line;
		variable ch: character;
		variable i, index, result: integer;
		type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
		variable mem: ramtype;
	begin
		-- initialize memory from file
		for i in 0 to 63 loop -- set all contents low
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
			mem(index)(35-i*4 downto 32-i*4) := std_logic_vector(to_unsigned(result,4));
			end loop;
			index := index + 1;
		end loop;
		-- read memory
		loop
		rd <= mem(to_integer(unsigned(a)));
		wait on a;
		end loop;
	end process;
end;