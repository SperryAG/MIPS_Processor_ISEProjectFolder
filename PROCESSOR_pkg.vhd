LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE processor_pkg IS 

	COMPONENT ADDER_32Bit_Unsigned
		PORT(
			pc  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			val : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT ALU_32BIT
		 PORT( 
			  Func_in    : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			  A_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  B_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  O_out      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			  Branch_out : OUT STD_LOGIC;
			  Jump_out   : OUT STD_LOGIC 
		 );
	END COMPONENT;

	COMPONENT CONTROLLER_32Bit
		PORT(
			Func       : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			Op         : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			MemToReg   : OUT STD_LOGIC;
			MemWrite   : OUT STD_LOGIC;
			Branch     : OUT STD_LOGIC;
			ALUControl : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			ALUSrc     : OUT STD_LOGIC;
			RegDst     : OUT STD_LOGIC;
			RegWrite   : OUT STD_LOGIC
		);
	END COMPONENT;

    COMPONENT MUX_2to1_5Bit
		PORT( 
			  d0  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			  d1  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			  sel : IN  STD_LOGIC;
			  o   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	
    COMPONENT MUX_2to1_32Bit
		PORT( 
			  d0  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  d1  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  sel : IN  STD_LOGIC;
			  o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT PROG_COUNTER_32Bit
		PORT(
			clk   : IN std_logic;
			dataI : IN std_logic_vector(31 DOWNTO 0);
			dataO : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT RAM_512x32Bit
		PORT(
			clk   : IN  STD_LOGIC;
			we    : IN  STD_LOGIC;
			addr  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			dataI : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			dataO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT REGFILE_32BitX5Bit
		PORT(
			clk     : IN  STD_LOGIC;
			rst_s   : IN  STD_LOGIC;                     -- synchronous reset
			we      : IN  STD_LOGIC;                     -- write enable
			raddr_1 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- read address 1
			raddr_2 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- read address 2
			waddr   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- write address
			rdata_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- read data 1
			rdata_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- read data 2
			wdata   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0)  -- write data 1
		);
	END COMPONENT;

	COMPONENT ROM_512x32Bit
		PORT(
			addr   : IN    std_logic_vector(31 DOWNTO 0);
			dataIO : INOUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT SIGNEXTEND_16to32Bit
		PORT( 
			  i : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			  o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

END processor_pkg;
