// ECE:3350 SISC processor project
// main SISC module, part 1

`timescale 1ns/100ps  

module sisc (clk, rst_f, ir);

  input clk, rst_f;
  input [31:0] ir;

// TODO: declare all internal wires here



// TODO: component instantiation goes here


  initial
  $monitor($time,,"%h  %h  %h  %h  %h  %h  %b  %b  %b  %b",ir,u2.ram_array[1],u2.ram_array[2],u2.ram_array[3],u2.ram_array[4],u2.ram_array[5],alu_op,wb_sel,rf_we,stat);



endmodule


