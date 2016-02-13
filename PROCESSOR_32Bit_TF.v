`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:24:20 02/12/2016
// Design Name:   PROCESSOR_32Bit
// Module Name:   C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/PROCESSOR_32Bit_TF.v
// Project Name:  testgate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR_32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_32Bit_TF;

	// Inputs
	reg ref_clk;
	reg reset;
	reg [31:0] out_pc;
	reg [31:0] out_adder_pc;
	reg [31:0] out_rom;
	reg [25:0] out_shiftleft;
	reg [5:0] out_mux_jal;
	reg [5:0] out_mux_regdst;
	reg [5:0] out_mux_jaladdr;
	reg [31:0] out_mux_jaldata;
	reg [31:0] out_concatenate;
	reg out_controller_jal;
	reg out_controller_regdst;
	reg out_controller_jaladdr;
	reg out_controller_jaldata;
	reg out_controller_shiftvalue;
	reg out_controller_load;
	reg out_controller_jr;
	reg out_controller_jumporjr;
	reg out_controller_lui;
	reg out_controller_branch;
	reg out_controller_memtoreg;
	reg out_controller_memwrite;
	reg [1:0] out_controller_dsize;
	reg [5:0] out_controller_alu;
	reg out_controller_alusrc;
	reg out_controller_regwrite;
	reg [31:0] out_regfile_rdata1;
	reg [31:0] out_regfile_rdata2;
	reg [31:0] out_signextend_a;
	reg [31:0] out_signextend_b;
	reg [31:0] out_mux_alusrc;
	reg [31:0] out_mux_shiftvalue;
	reg [31:0] out_shiftrighttwo;
	reg out_alu_branch;
	reg [31:0] out_alu;
	reg [31:0] out_adder_jump;
	reg [31:0] out_mux_jump;
	reg out_and;
	reg [31:0] out_shiftandextend;
	reg [31:0] out_splitter;
	reg [31:0] out_mux_jumporjr;
	reg [31:0] out_mux_jr;
	reg [31:0] out_ram;
	reg [31:0] out_mux_lui;
	reg [31:0] out_mux_wb;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_32Bit uut (
		.ref_clk(ref_clk), 
		.reset(reset), 
		.out_pc(out_pc), 
		.out_adder_pc(out_adder_pc), 
		.out_rom(out_rom), 
		.out_shiftleft(out_shiftleft), 
		.out_mux_jal(out_mux_jal), 
		.out_mux_regdst(out_mux_regdst), 
		.out_mux_jaladdr(out_mux_jaladdr), 
		.out_mux_jaldata(out_mux_jaldata), 
		.out_concatenate(out_concatenate), 
		.out_controller_jal(out_controller_jal), 
		.out_controller_regdst(out_controller_regdst), 
		.out_controller_jaladdr(out_controller_jaladdr), 
		.out_controller_jaldata(out_controller_jaldata), 
		.out_controller_shiftvalue(out_controller_shiftvalue), 
		.out_controller_load(out_controller_load), 
		.out_controller_jr(out_controller_jr), 
		.out_controller_jumporjr(out_controller_jumporjr), 
		.out_controller_lui(out_controller_lui), 
		.out_controller_branch(out_controller_branch), 
		.out_controller_memtoreg(out_controller_memtoreg), 
		.out_controller_memwrite(out_controller_memwrite), 
		.out_controller_dsize(out_controller_dsize), 
		.out_controller_alu(out_controller_alu), 
		.out_controller_alusrc(out_controller_alusrc), 
		.out_controller_regwrite(out_controller_regwrite), 
		.out_regfile_rdata1(out_regfile_rdata1), 
		.out_regfile_rdata2(out_regfile_rdata2), 
		.out_signextend_a(out_signextend_a), 
		.out_signextend_b(out_signextend_b), 
		.out_mux_alusrc(out_mux_alusrc), 
		.out_mux_shiftvalue(out_mux_shiftvalue), 
		.out_shiftrighttwo(out_shiftrighttwo), 
		.out_alu_branch(out_alu_branch), 
		.out_alu(out_alu), 
		.out_adder_jump(out_adder_jump), 
		.out_mux_jump(out_mux_jump), 
		.out_and(out_and), 
		.out_shiftandextend(out_shiftandextend), 
		.out_splitter(out_splitter), 
		.out_mux_jumporjr(out_mux_jumporjr), 
		.out_mux_jr(out_mux_jr), 
		.out_ram(out_ram), 
		.out_mux_lui(out_mux_lui), 
		.out_mux_wb(out_mux_wb)
	);

	initial begin
		// Initialize Inputs
		ref_clk = 0;
		reset = 0;
		out_pc = 0;
		out_adder_pc = 0;
		out_rom = 0;
		out_shiftleft = 0;
		out_mux_jal = 0;
		out_mux_regdst = 0;
		out_mux_jaladdr = 0;
		out_mux_jaldata = 0;
		out_concatenate = 0;
		out_controller_jal = 0;
		out_controller_regdst = 0;
		out_controller_jaladdr = 0;
		out_controller_jaldata = 0;
		out_controller_shiftvalue = 0;
		out_controller_load = 0;
		out_controller_jr = 0;
		out_controller_jumporjr = 0;
		out_controller_lui = 0;
		out_controller_branch = 0;
		out_controller_memtoreg = 0;
		out_controller_memwrite = 0;
		out_controller_dsize = 0;
		out_controller_alu = 0;
		out_controller_alusrc = 0;
		out_controller_regwrite = 0;
		out_regfile_rdata1 = 0;
		out_regfile_rdata2 = 0;
		out_signextend_a = 0;
		out_signextend_b = 0;
		out_mux_alusrc = 0;
		out_mux_shiftvalue = 0;
		out_shiftrighttwo = 0;
		out_alu_branch = 0;
		out_alu = 0;
		out_adder_jump = 0;
		out_mux_jump = 0;
		out_and = 0;
		out_shiftandextend = 0;
		out_splitter = 0;
		out_mux_jumporjr = 0;
		out_mux_jr = 0;
		out_ram = 0;
		out_mux_lui = 0;
		out_mux_wb = 0;

		// Wait 100 ns for global reset to finish
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		#100;
      ref_clk =1'b1;
		#100;
      ref_clk =1'b0;
		  
		  
		// Add stimulus here

	end
      
endmodule

