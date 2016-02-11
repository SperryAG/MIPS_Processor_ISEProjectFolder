`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:01:01 02/04/2016
// Design Name:   ALU_32BIT
// Module Name:   C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/ALU_TF.v
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

module ALU_TF;

	// Inputs
	reg [5:0] Func_in;
	reg [31:0] A_in;
	reg [31:0] B_in;

	// Outputs
	wire [31:0] O_out;
	wire Branch_out;
	wire Jump_out;

	// Instantiate the Unit Under Test (UUT)
	ALU_32BIT uut (
		.Func_in(Func_in), 
		.A_in(A_in), 
		.B_in(B_in), 
		.O_out(O_out), 
		.Branch_out(Branch_out), 
		.Jump_out(Jump_out)
	);

	initial begin
		// Initialize Inputs
		Func_in = 0;
		A_in = 0;
		B_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		Func_in = 6'b000000;
		A_in = 32'b01010101010101010101010101010101;
		B_in = 32'b00000000000000000000000000000011;
		
		#100;
		
		Func_in = 6'b000100;
		A_in = 32'b01010101010101010101011111111111;
		B_in = 32'b00000000000000000000000000000100;
		
		#100;
		
		Func_in = 6'b000010;
		A_in = 32'b01010101010101010101011111111111;
		B_in = 32'b00000000000000000000000000000100;

		#100;
		
		Func_in = 6'b000110;
		A_in = 32'b01010101010101010101011111111111;
		B_in = 32'b00000000000000000000000000000100;
		
		#100;
		
		Func_in = 6'b000011;
		A_in = 32'b01010101010101010101011111111111;
		B_in = 32'b00000000000000000000000000000100;
		
		#100;
		
		Func_in = 6'b000111;
		A_in = 32'b11010101010101010101011111111111;
		B_in = 32'b00000000000000000000000000000100;
		
		#100;
        
		Func_in = 6'b000000;
		A_in = 32'b01010101010101010101010101010101;
		B_in = 32'b00000000000000000000000000000011;
		
		$finish;
	end
	
      
endmodule

