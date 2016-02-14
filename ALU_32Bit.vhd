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
use ieee.std_logic_signed.all;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ALU_32BIT IS
    PORT( 
        Func_in    : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
        A_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        B_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        O_out      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Branch_out : OUT STD_LOGIC
		  --Jump_out	 : OUT STD_LOGIC
    );
END ALU_32BIT;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ALU_32BIT IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
SIGNAL bo   : STD_LOGIC := '0';
--SIGNAL jo   : STD_LOGIC := '0';


BEGIN
    PROCESS(Func_in, A_in, B_in) 
        BEGIN
		IF Func_in(5 DOWNTO 3) = "100" THEN
			bo <= '0';
			IF Func_in(2 DOWNTO 0) = "000" THEN 
				wire <= STD_LOGIC_VECTOR(signed(A_in) + signed(B_in));
			ELSIF Func_in(2 DOWNTO 0) = "001" THEN
				wire <= STD_LOGIC_VECTOR(unsigned(A_in) + unsigned(B_in));
			ELSIF Func_in(2 DOWNTO 0) = "010" THEN 
				wire <= STD_LOGIC_VECTOR(signed(A_in) - signed(B_in));
			ELSIF Func_in(2 DOWNTO 0) = "011" THEN
				wire <= STD_LOGIC_VECTOR(unsigned(A_in) - unsigned(B_in));
			ELSIF Func_in(2 DOWNTO 0) = "100" THEN
				wire <=  A_in AND B_in;
			ELSIF Func_in(2 DOWNTO 0) = "101" THEN
				wire <=  A_in OR B_in;
			ELSIF Func_in(2 DOWNTO 0) = "110" THEN
				wire <=  A_in XOR B_in;
			ELSIF Func_in(2 DOWNTO 0) = "111" THEN
				wire <=  A_in NOR B_in;
			END IF;
			
		ELSIF Func_in(5 DOWNTO 3) = "101" THEN
			bo <= '0';
			IF Func_in(2 DOWNTO 0) = "000" THEN
				IF signed(A_in) < signed(B_in) THEN
					wire <= "00000000000000000000000000000001";
				ELSE
					wire <= (OTHERS => '0');
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "010" THEN
				IF signed(A_in) < signed(B_in) THEN
					wire <= "00000000000000000000000000000001";
				ELSE
					wire <= (OTHERS => '0');
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "001" THEN 
				IF signed(A_in) < signed(B_in) THEN
					wire <= "00000000000000000000000000000001";
				ELSE
					wire <= (OTHERS => '0');
				END IF;
			END IF;
		
		ELSIF Func_in(5 DOWNTO 3) = "111" THEN
			IF Func_in(2 DOWNTO 0) = "000" THEN --BLT
				wire <= A_in;
				IF ( to_integer(signed(A_in)) < 0 ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "001" THEN --BGT or Equal to zero
				wire <= A_in;
				IF ( to_integer(signed(A_in))>= 0 ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "100" THEN --BRANCH EQUAL
				wire <= A_in;
				IF ( to_integer(signed(A_in)) = to_integer(signed(B_in)) ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "101" THEN --BRANCH NOT EQUAL
				wire <= A_in;
				IF ( to_integer(signed(A_in)) /= to_integer(signed(B_in)) ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "110" THEN --BLT or Equal to zero
				wire <= A_in;
				IF ( to_integer(signed(A_in))<= 0 ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			ELSIF Func_in(2 DOWNTO 0) = "111" THEN --BGT zero
				wire <= A_in;
				IF ( to_integer(signed(A_in))> 0 ) THEN
					bo <= '1';
				ELSE
					bo <= '0';
				END IF;
			END IF;
			
			
	
		ELSIF Func_in(5 DOWNTO 3) = "000" THEN
			IF Func_in(2 DOWNTO 0) = "100" THEN
				wire <= std_logic_vector(signed(A_in) sll to_integer(signed(B_in)));
				bo <= '0';
			ELSIF Func_in(2 DOWNTO 0) = "000" THEN
				wire <= std_logic_vector(signed(A_in) sll to_integer(signed(B_in)));
				bo <= '0';
			ELSIF Func_in(2 DOWNTO 0) = "110" THEN
				wire <= std_logic_vector(signed(A_in) srl to_integer(signed(B_in)));
				bo <= '0';
			ELSIF Func_in(2 DOWNTO 0) = "010" THEN
				wire <= std_logic_vector(signed(A_in) srl to_integer(signed(B_in)));
				bo <= '0';
			ELSIF Func_in(2 DOWNTO 0) = "111" THEN
				wire <=  SHR(A_in,B_in);
				bo <= '0';
			ELSIF Func_in(2 DOWNTO 0) = "011" THEN
				wire <=  SHR(A_in,B_in);
				bo <= '0';
			END IF;

		ELSE
			bo <= '0';
			--jo <= '0';
			wire <= (OTHERS => '0');
		END IF;
    END PROCESS;
	 O_out <= wire;
	 Branch_out <= bo;
	 --Jump_out <= jo;
END behavioral;