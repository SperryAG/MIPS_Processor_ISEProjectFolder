`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:40:08 02/03/2016
// Design Name:   MUX_2to1_5Bit
// Module Name:   C:/Users/Andrew/Documents/ISEWorkspace/testgate/MIPS_Processor_ISEProjectFolder/MUX_2to1_5Bit_tb.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_2to1_5Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_2to1_5Bit_tb;

	// Inputs
	reg [4:0] d0;
	reg [4:0] d1;
	reg sel;

	// Outputs
	wire [4:0] o;

	// Instantiate the Unit Under Test (UUT)
	MUX_2to1_5Bit uut (
		.d0(d0), 
		.d1(d1), 
		.sel(sel), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		d0 = 0; d1 = 0;
		sel = 0;

		// Wait 10 ns for global reset to finish
		#10;
		d0 = 0; d1 = 12;
		sel = 1;
      
		#10;
		d0 = 25; d1 = 1;
		sel = 0;
		
		#10;
	end
      
endmodule

