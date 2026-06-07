`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 17:29:19
// Design Name: 
// Module Name: fsm_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm_tb(

    );
    
    reg rst,clk,din;
    wire detected;
    
    fsm dut(rst,clk,din,detected);
    
    always #5 clk = ~ clk;
    
    initial
      begin
      rst=1;
      clk=0;
      #10;
      
      rst=0;
      #10;
      din=1'b1;
      #10;
      din=1'b0;
      #10;
      din<=1'b1;
      #10;
      din<=1'b0;
      #10;
      
      #100;
      $finish;
      end
      
endmodule
