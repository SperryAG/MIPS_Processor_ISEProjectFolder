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
SIGNAL t_JALControl, t_RegDst, t_JALAddrControl, t_JALDataControl, t_ShiftValueControl,
		 t_LoadControl, t_JRControl, t_JumpOrJRControl, t_LUIControl, t_Branch, t_MemToReg, t_MemWrite,
		 t_ALUSrc, t_RegWrite : STD_LOGIC := '0';
SIGNAL t_DSize : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
SIGNAL t_ALUControl : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (Func, Op)
	BEGIN
        -- R-TYPE Instructions
        ----------------------------
		IF (Op = "000000") THEN
			t_JALControl        <= '0';
			t_RegDst            <= '1';
			t_JALAddrControl    <= '0';
			t_JALDataControl    <= '1';
			t_ShiftValueControl <= '0';
			t_LoadControl       <= '0';
			t_JRControl         <= '0';
			t_JumpOrJRControl   <= '1';
			t_LUIControl        <= '1';
			t_Branch            <= '0';
			t_MemToReg          <= '0';
			t_MemWrite          <= '0';
			t_DSize             <= "11";
			t_ALUControl        <= Func;
			t_ALUSrc            <= '0';	
			t_RegWrite          <= '1';
            
        -- J-TYPE Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 1) = "00001") THEN
			IF (Op(0) = '0') THEN -- PC <= JUMP 
				t_JALControl        <= '0';
				t_RegDst            <= '1';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '0';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '0';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '1';
			ELSE
				t_JALControl        <= '0'; --JUMPLINK
				t_RegDst            <= '1';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '1';
			END IF;
			
			-- -- -- -- -- -- -- -- -- -- -- --
				ELSIF (Op(5 DOWNTO 1) = "00100") THEN --TODO
			IF (Op(0) = '0') THEN -- PC <= JUMPREGISTER
				t_JALControl        <= '0';
				t_RegDst            <= '1';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '0';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '0';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '1';
			ELSE
				t_JALControl        <= '0'; --JUMPLINK REGISTER
				t_RegDst            <= '1';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '1';
			END IF;
	-- -- -- -- -- -- -- -- -- -- -- --- -
		      
        -- Coprocessor Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 2) = "0100") THEN
			t_JALControl        <= '0';
			t_RegDst            <= '1';
			t_JALAddrControl    <= '0';
			t_JALDataControl    <= '1';
			t_ShiftValueControl <= '0';
			t_LoadControl       <= '0';
			t_JRControl         <= '0';
			t_JumpOrJRControl   <= '1';
			t_LUIControl        <= '1';
			t_Branch            <= '0';
			t_MemToReg          <= '1';
			t_MemWrite          <= '0';
			t_DSize             <= "11";
			t_ALUControl        <= Func;
			t_ALUSrc            <= '0';	
			t_RegWrite          <= '1';
        
        -- I-Type Instructions
        ----------------------------
		ELSE
			IF (Op = "100011") THEN --lw
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '1';
				
			-- -- -- -- -- -- -- -- -- -- -- -- 
			ELSIF (Op = "100001") THEN --lw (half)
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "10";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '1';	

			ELSIF (Op = "101001") THEN --sw (half)
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1'; --dont care
				t_MemWrite          <= '1';
				t_DSize             <= "10";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '0';
				
			ELSIF (Op = "100100") THEN --lw (unsigned)
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '0';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '1';

			ELSIF (Op = "100101") THEN --lw (unsigned)(half)
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '0';
				t_Branch            <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_DSize             <= "10";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '1';				

				
				
		-- -- -- -- -- -- -- -- -- --- -- -- -- -- 		
				
				
			ELSIF (Op = "101011") THEN --sw
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '1'; --dont care
				t_MemWrite          <= '1';
				t_DSize             <= "11";
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '0';
				
			ELSIF (Op = "001000") THEN --addi
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '1';
				t_DSize             <= "11";
				t_ALUControl        <= "100000";
				t_ALUSrc            <= '1';	
				t_RegWrite          <= '1';	
		------- DP ADDED INSTRUCTION ----- 			
			ELSIF (Op = "000100") THEN --BRANCH ON EQUAL-- IS ITYPE 
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= "111100";
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '0';
				
		--		--		--		--		--		--		--
			ELSIF (Op = "000101") THEN --BRANCH NOT EQUAL-- IS ITYPE 
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= "111101";
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '0';	
				
			ELSIF (Op = "000001") THEN --BRANCH GREATER OR EQUAL TO ZERO-- IS ITYPE 
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= "111001";
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '0';

			ELSIF (Op = "000110") THEN --BRANCH LESS THAN OR EQUAL TO ZERO-- IS ITYPE 
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= "111110";
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '0';
				
			ELSIF (Op = "000111") THEN --BRANCH GREATER THAN ZERO-- IS ITYPE 
				t_JALControl        <= '0';
				t_RegDst            <= '0';
				t_JALAddrControl    <= '0';
				t_JALDataControl    <= '1';
				t_ShiftValueControl <= '0';
				t_LoadControl       <= '0';
				t_JRControl         <= '0';
				t_JumpOrJRControl   <= '1';
				t_LUIControl        <= '1';
				t_Branch            <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_DSize             <= "11";
				t_ALUControl        <= "111111";
				t_ALUSrc            <= '0';	
				t_RegWrite          <= '0';				
		--		--		--		--		--		--		--
								
			
				
			END IF;
       END IF;
	END PROCESS;
	JALControl        <= t_JALControl;
	RegDst            <= t_RegDst;
	JALAddrControl    <= t_JALAddrControl;
	JALDataControl    <= t_JALDataControl;
	ShiftValueControl <= t_ShiftValueControl;
	LoadControl       <= t_LoadControl;
	JRControl         <= t_JRControl;
	JumpOrJRControl   <= t_JumpOrJRControl;
	LUIControl        <= t_LUIControl;
	Branch            <= t_Branch;
	MemToReg          <= t_MemToReg;
	MemWrite          <= t_MemWrite;
	DSize             <= t_DSize;
	ALUControl        <= t_ALUControl;
	ALUSrc            <= t_ALUSrc;	
	RegWrite          <= t_RegWrite;
END Behavioral;

