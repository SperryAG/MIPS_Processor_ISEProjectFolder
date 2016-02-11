`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:23:53 02/11/2016
// Design Name:   CONCATENATE_26to32Bit
// Module Name:   C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/CONCATENATE_26to32Bit_TF.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CONCATENATE_26to32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CONCATENATE_26to32Bit_TF;

	// Inputs
	reg [25:0] in_main;
	reg [5:0] in_conc;

	// Outputs
	wire [31:0] o;

	// Instantiate the Unit Under Test (UUT)
	CONCATENATE_26to32Bit uut (
		.in_main(in_main), 
		.in_conc(in_conc), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		in_main = 0;
		in_conc = 0;

		// Wait 100 ns for global reset to finish
		#100;
      in_main = 26'b11111111111111111111111101;
		in_conc = 6'b111111;
		#100;
      in_main = 26'b11111111111111111111111100;
		in_conc = 6'b000000;
		#100;
		// Add stimulus here

	end
      
endmodule

