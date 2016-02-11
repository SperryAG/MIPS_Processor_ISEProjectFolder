`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:33 02/10/2016
// Design Name:   SHIFTRIGHTTWO_32Bit
// Module Name:   C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/SHIFTRIGHTTWO_32Bit_TF.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SHIFTRIGHTTWO_32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SHIFTRIGHTTWO_32Bit_TF;

	// Inputs
	reg [31:0] i;

	// Outputs
	wire [31:0] o;

	// Instantiate the Unit Under Test (UUT)
	SHIFTRIGHTTWO_32Bit uut (
		.i(i), 
		.o(o)
	);

	initial begin
		
		i = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		i = 32'b11111111111111111111111111111111;

		

		#100;

       
		$finish;
	end
      
endmodule

