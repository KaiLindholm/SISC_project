// ECE:3350 SISC processor project
// main SISC module, part 1

`timescale 1ns/100ps  

module sisc (clk, rst_f);

  input clk, rst_f;


// TODO: declare other internal wires here

  wire rf_we, wb_sel, stat_en;
  wire [1:0] alu_op;
  wire [3:0] rd_regb, alu_sts, stat;
  wire [31:0] rega, regb, wr_dat, alu_out, ir;



// TODO: other component instantiation goes here
// TODO: Pass the additional internal wires to u1~u6 if needed

  ctrl u1 (clk, rst_f, ir[31:28], ir[27:24], stat, rf_we, alu_op, wb_sel);

  rf u2 (clk, ir[19:16], rd_regb, ir[23:20], wr_dat, rf_we, rega, regb);

  alu u3 (clk, rega, regb, ir[15:0], alu_op, alu_out, alu_sts, stat_en);

  mux4 u4 (ir[15:12], ir[23:20], 1'b0, rd_regb);

  mux32 u5 (alu_out, 32'h00000000, wb_sel, wr_dat);

  statreg u6(clk, alu_sts, stat_en, stat);





// TODO: modify the $monitor statement as defined in Part2 description. 
  initial
  $monitor($time,,"%h  %h  %h  %h  %h  %h  %b  %b  %b  %b",ir,u2.ram_array[1],u2.ram_array[2],u2.ram_array[3],u2.ram_array[4],u2.ram_array[5],alu_op,wb_sel,rf_we,stat);



endmodule


