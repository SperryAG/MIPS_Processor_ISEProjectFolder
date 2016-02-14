`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:00 02/12/2016
// Design Name:   ALU_32BIT
// Module Name:   C:/Users/Andrew/Documents/ISEWorkspace/testgate/MIPS_Processor_ISEProjectFolder/ALU32_TF.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_32BIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32_TF;

	// Inputs
	reg [5:0] Func_in;
	reg [31:0] A_in;
	reg [31:0] B_in;

	// Outputs
	wire [31:0] O_out;
	wire Branch_out;

	// Instantiate the Unit Under Test (UUT)
	ALU_32BIT uut (
		.Func_in(Func_in), 
		.A_in(A_in), 
		.B_in(B_in), 
		.O_out(O_out), 
		.Branch_out(Branch_out)
	);

	initial begin
		// Initialize Inputs
		Func_in = 0;
		A_in = 0;
		B_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Func_in = 6'b111000; //BRANCH LESS THAN ZERO
		A_in = 32'b11111111111111111111111111111111;
		B_in = 32'b11111111111111111111111111111111;
		//EXPECT O_out = A_in;
		//EXPECT Branch_out = 1;
		#100;
		Func_in = 6'b111001; //BRANCH GREATER THAN OR EQUAL TO ZERO
		A_in = 32'b00000000000000000000000000000000;
		B_in = 32'b00000000000000000000000000000000;
		
		//EXPECT O_out = A_in;
		//EXPECT Branch_out = 1;
		#100;
		Func_in = 6'b111100; //BRANCH EQUAL 
		A_in = 32'b00000000000000000000000000000000;
		B_in = 32'b00000000000000000000000000000001;
		//EXPECT Branc_out = 0;
		#100;
		Func_in = 6'b111101; //BRANCH NOT EQUAL
		A_in = 32'b00000000000000000000000000000000;
		B_in = 32'b00000000000000000000000000000001;
		//EXPECT Branc_out = 1;
		#100;
		Func_in = 6'b111110; //BRANCH LESS THAN OR EQUAL TO ZERO
		A_in = 32'b00000000000000000000000000000000;
		B_in = 32'b00000000000000000000000000000000;
		
		//EXPECT Branc_out = 1;
		#100;
		Func_in = 6'b111111; //BRANCH GREATER THAN ZERO
		A_in = 32'b00000000000000000000000000001111;
		B_in = 32'b00000000000000000000000000000000;
		
		//EXPECT Branc_out = 1;
		#100;
		#100;
		Func_in = 6'b111100; //BEQ
		A_in = 32'b00000000000000000000000000000000;
		B_in = 32'b00000000000000000000000000000000;
		
		#100;
		Func_in = 6'b100001; //ADD USIGNED
		A_in = 32'b00000000000000000000000000000001;
		B_in = 32'b11111111111111111111111111111110;
		
		#100;
		Func_in = 6'b100000; //ADD SIGNED
		A_in = 32'b00000000000000000000000000000110;
		B_in = 32'b11111111111111111111111111111110;
		
		#100;
		
        
		// Add stimulus here
		$finish;
	end
      
endmodule
