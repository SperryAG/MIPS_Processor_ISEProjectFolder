----------------------------------------------------------------------------------
-- Create Date:    13:09:50 01/18/2016 
-- Module Name:    ALU_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ALU_32BIT IS
    PORT( 
        Func_in    : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
        A_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        B_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        O_out      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Branch_out : OUT STD_LOGIC;
        Jump_out   : OUT STD_LOGIC 
    );
END ALU_32BIT;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ALU_32BIT IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
SIGNAL Jo : STD_LOGIC;
SIGNAL Bo : STD_LOGIC;
BEGIN
	process(Func_in)
	begin
	case Func_in is
		when "100000" =>
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) + unsigned(B_in));
			Jo <= '0';
			Bo <= '0';
		when "100001" =>
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) + unsigned(B_in));
			Jo <= '0';
			Bo <= '0';		
		when "100010" =>
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) - unsigned(B_in));
			Jo <= '0';
			Bo <= '0';
		when "100011"	=>
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) - unsigned(B_in));
			Jo <= '0';
			Bo <= '0';
		when "100100" =>
			wire <=  A_in AND B_in;
			Jo <= '0';
			Bo <= '0';
		when "100101" =>
			wire <=  A_in OR B_in;
			Jo <= '0';
			Bo <= '0';
		when "100110" =>
			wire <= A_in XOR B_in;
			Jo <= '0';
			Bo <= '0';
		when "100111" =>
			wire <= A_in NOR B_in;
			Jo <= '0';
			Bo <= '0';
		when "101000" =>
			if signed(A_in) < signed(B_in) then
				wire <= "00000000000000000000000000000001";
			else
				wire <= (OTHERS => '0');
			end if;
				Jo <= '0';
				Bo <= '0';
		when "101001" =>
			if unsigned(A_in) < unsigned(B_in) then
				wire <= "00000000000000000000000000000001";
			else
				wire <= (OTHERS => '0');
			end if;
				Jo <= '0';
				Bo <= '0';
		when "111000" =>
			wire <= A_in; --BRANCH LESS THAN ZERO (A<0)
			Jo <= '0';
			if to_integer(signed(A_in)) < 0 then
				Bo <= '1'; --MAY NEED TO CONVERT TO INT
			else
				Bo <= '0';
			end if;
		when "111001" =>
			wire <= A_in; --BRANCH GREATER THAN OR EQUAL TO ZERO (A >= 0)
			Jo <= '0';
			if to_integer(signed(A_in)) >= 0 then 
				Bo <= '1';
			else
				Bo <= '0';
			end if;	
		when "111010" =>
			wire <= A_in; --JUMP
			Jo <= '1';
			Bo <= '0';
		when "111011" =>
			wire <= A_in; --JUMP
			Jo <= '1';
			Bo <= '0';
		when "111100" =>
			wire <= A_in; --Branch Equal
			Jo <= '0';
			if A_in = B_in then
				Bo <= '1';
			else
				Bo <= '0';
			end if;
		when "111101" =>
			wire <= A_in; --Branch Not Equal
			Jo <= '0';
			if A_in /= B_in then
				Bo <= '1';
			else
				Bo <= '0';
			end if;
		when "111110" =>
			wire <= A_in; --Branch less Than or Equal to Zero
			Jo <= '0';
			if to_integer(signed(A_in)) <= 0 then
				Bo <= '1';
			else
				Bo <= '0';
			end if;
		when "111111" =>
			wire <= A_in; --Branch Greater Than Zero
			Jo <= '0';
			if to_integer(signed(A_in)) > 0 then
				Bo <= '1';
			else
				Bo <= '0';
			end if;
		when others =>
			wire <= (OTHERS => '0');
	end case;
	end process;
	 O_out <= wire;
	 Branch_out <= bo;
	 Jump_out <= jo;

END behavioral;

