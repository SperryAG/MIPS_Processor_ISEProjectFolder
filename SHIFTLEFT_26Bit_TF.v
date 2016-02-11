`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:41 02/10/2016
// Design Name:   SHIFTLEFT_26Bit
// Module Name:   C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/SHIFTLEFT_26Bit_TF.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SHIFTLEFT_26Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SHIFTLEFT_26Bit_TF;

	// Inputs
	reg [25:0] i;

	// Outputs
	wire [25:0] o;

	// Instantiate the Unit Under Test (UUT)
	SHIFTLEFT_26Bit uut (
		.i(i), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		i = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		
		i = 26'b11111111111111111111111111;
		#100;
		
		i = 26'b11111111111111111111111100;
		#100;
		  
		i = 26'b00111111111111111111111111;
		#100;
		
		// Add stimulus here

		$finish;
	end
      
endmodule

