----------------------------------------------------------------------------------
-- Create Date:    18:13:53 01/16/2016 
-- Module Name:    RAM_512x32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY RAM_512x8Bit IS
	PORT(
		clk   : IN  STD_LOGIC;
		dsize : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		we    : IN  STD_LOGIC;
		addr  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataI : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END RAM_512x8Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF RAM_512x8Bit IS
	TYPE mem_array IS ARRAY (0 TO ((2**9)-1)) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mem: mem_array := (OTHERS => (OTHERS => '0'));
	SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(clk) 
	BEGIN
		IF (clk'EVENT AND clk='0') THEN
			IF (we = '1') THEN
				mem(CONV_INTEGER(addr(8 DOWNTO 0))) <= dataI(7 DOWNTO 0);
				IF dsize = "01" OR "10" OR "11" THEN
					mem(CONV_INTEGER(addr(8 DOWNTO 0))+1) <= dataI(15 DOWNTO 8);
				END IF;
				IF dsize = "10" OR "11" THEN
					mem(CONV_INTEGER(addr(8 DOWNTO 0))+2) <= dataI(23 DOWNTO 16);
				END IF;
				IF dsize = "11" THEN
					mem(CONV_INTEGER(addr(8 DOWNTO 0))+3) <= dataI(31 DOWNTO 24);
				END IF;
			ELSE
				temp <= (OTHERS => '0');
				temp(7 DOWNTO 0) <= mem(CONV_INTEGER(addr(8 DOWNTO 0)));
				IF dsize = "01" OR "10" OR "11" THEN
					temp(15 DOWNTO 8) <= mem(CONV_INTEGER(addr(8 DOWNTO 0))+1);
				END IF;
				IF dsize = "10" OR "11" THEN
					temp(23 DOWNTO 16) <= mem(CONV_INTEGER(addr(8 DOWNTO 0))+2);
				END IF;
				IF dsize = "11" THEN
					temp(31 DOWNTO 24) <= mem(CONV_INTEGER(addr(8 DOWNTO 0))+3);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	dataO <= temp;
END Behavioral;