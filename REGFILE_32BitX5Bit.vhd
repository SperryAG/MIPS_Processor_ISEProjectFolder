----------------------------------------------------------------------------------
-- Create Date:    22:48:05 01/16/2016 
-- Module Name:    REGFILE_32BitX5Bit - Behavioral 
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
ENTITY REGFILE_32BitX5Bit IS
	PORT(
		clk     : IN  STD_LOGIC;
		rst_s   : IN  STD_LOGIC;                         -- synchronous reset
		we      : IN  STD_LOGIC;                         -- write enable
		raddr_1 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- read address 1
		raddr_2 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- read address 2
		waddr   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- write address
		rdata_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- read data 1
		rdata_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- read data 2
		wdata   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0)  -- write data 1
	);
END REGFILE_32BitX5Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF REGFILE_32BitX5Bit IS
	TYPE mem_array IS ARRAY (0 TO (2**5-1)) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL mem: mem_array := (others => (others => '0'));	
BEGIN
	PROCESS(clk) 
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			IF (rst_s = '1') THEN
				FOR i IN mem' RANGE LOOP
					mem(i) <= (OTHERS => '0');
				END LOOP;
			ELSIF (we = '1') THEN
				mem(CONV_INTEGER(waddr)) <= wdata;
			END IF;
		END IF;
	END PROCESS;
	rdata_1 <= mem(CONV_INTEGER(raddr_1));
	rdata_2 <= mem(CONV_INTEGER(raddr_2));
END Behavioral;