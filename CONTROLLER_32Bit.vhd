----------------------------------------------------------------------------------
-- Create Date:    13:37:02 01/18/2016 
-- Module Name:    CONTROLLER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY CONTROLLER_32Bit IS
	PORT(
		Func              : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		Op                : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		JALControl        : OUT STD_LOGIC;
		RegDst            : OUT STD_LOGIC;
	   JALAddrControl    : OUT STD_LOGIC;
		JALDataControl    : OUT STD_LOGIC;
		ShiftValueControl : OUT STD_LOGIC;
		LoadControl       : OUT STD_LOGIC;
		JRControl         : OUT STD_LOGIC;
		JumpOrJRControl   : OUT STD_LOGIC;
		LUIControl        : OUT STD_LOGIC;
		Branch            : OUT STD_LOGIC;
		MemToReg          : OUT STD_LOGIC;
		MemWrite          : OUT STD_LOGIC;
		DSize             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUControl        : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALUSrc            : OUT STD_LOGIC;	
		RegWrite          : OUT STD_LOGIC
	);
END CONTROLLER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF CONTROLLER_32Bit IS
SIGNAL mtr, mw, b, as, rd, rw : STD_LOGIC := '0';
SIGNAL ac : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (Func, Op)
	BEGIN
        -- R-TYPE Instructions
        ----------------------------
		IF (Op = "000000") THEN
			mtr <= '1';
         mw  <= '0';
         b   <= '0';
         ac  <= Func;
         as  <= '0';
         rd  <= '1';
         rw  <= '1';
            
        -- J-TYPE Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 1) = "00001") THEN
			IF (Op(0) = '0') THEN
			
			ELSE
			
			END IF;
            
        -- Coprocessor Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 2) = "0100") THEN
        
        -- I-Type Instructions
        ----------------------------
		ELSE
			IF (Op = "100011") THEN --lw
				mtr <= '0';
				mw  <= '0';
				b   <= '0';
				ac  <= "100000";
				as  <= '1';
				rd  <= '0';
				rw  <= '1';
			ELSIF (Op = "101011") THEN --sw
				mtr <= '0'; -- dont care
				mw  <= '1';
				b   <= '0';
				ac  <= "100000";
				as  <= '1';
				rd  <= '0'; -- dont care
				rw  <= '0';
			ELSIF (Op = "001000") THEN --addi
				mtr <= '1';
				mw  <= '0';
				b   <= '0';
				ac  <= "100000";
				as  <= '1';
				rd  <= '0';
				rw  <= '1';		
			END IF;
       END IF;
	END PROCESS;
	MemToReg <= mtr;
	MemWrite <= mw;
	Branch <= b;
	ALUControl <= ac;
	ALUSrc <= as;
	RegDst <= rd;
	RegWrite <= rw;
END Behavioral;

