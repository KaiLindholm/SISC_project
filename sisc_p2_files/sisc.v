// ECE:3350 SISC processor project
// main SISC module, part 1

`timescale 1ns/100ps  

module sisc (clk, rst_f);

  input clk, rst_f;

  wire rf_we, wb_sel, stat_en, pc_sel, pc_write, pc_rst, br_sel, ir_load;
  wire [1:0] alu_op;
  wire [3:0] rd_regb, alu_sts, stat;
  wire [15:0] br_addr, pc_out, imm, read_addr;
  wire [31:0] rega, regb, wr_dat, alu_out, read_data, instr;

  ctrl u1 (clk, rst_f, instr[31:28], instr[27:24], stat, rf_we, alu_op, wb_sel, rb_sel, br_sel, pc_rst, pc_write, pc_sel, ir_load);  // added new wires to ctrl 

  rf u2 (clk, instr[19:16], rd_regb, instr[23:20], wr_dat, rf_we, rega, regb);  // no updates needed

  alu u3 (clk, rega, regb, instr[15:0], alu_op, alu_out, alu_sts, stat_en);   // no updated needed 

  mux4 u4 (instr[15:12], instr[23:20], rb_sel, rd_regb);  // changed sel to rb_sel 

  mux32 u5 (alu_out, 32'h00000000, wb_sel, wr_dat); // no updated needed 

  statreg u6(clk, alu_sts, stat_en, stat);    // no updates needed 

  pc u7(clk, br_addr, pc_sel, pc_write, pc_rst, pc_out); // done

  br u8(pc_out, instr[15:0], br_sel, br_addr);  // done

  ir u9(clk, ir_load, read_data, instr); // done

  im u10(pc_out, read_data);   // done

// TODO: modify the $monitor statement as defined in Part2 description. 
  initial
  $monitor($time,,"%h  %h  %h  %h  %h  %h  %h  %b  %b  %b  %b",instr, pc_out, u2.ram_array[1],u2.ram_array[2],u2.ram_array[3],u2.ram_array[4],u2.ram_array[5], alu_op, br_sel, pc_write, pc_sel);



endmodule


