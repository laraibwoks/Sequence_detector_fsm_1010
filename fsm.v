`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 17:03:37
// Design Name: 
// Module Name: fsm
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


module fsm( input rst,clk, din, output reg detected 

    );// meelay
    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    reg [1:0] ps,ns;
    
    always@(posedge clk)// ps logic seq logic<= use
      begin
      if(rst)
      ps<= idle;
      else
      ps<=ns;
      end
      
      always@(*)// ns logic comb logic dont use non block <=
        begin
        
        case(ps)
        idle : begin
        
        if(din==1'b1)
        ns=s1;
        else
        ns=idle;
        end
        
        s1:begin 
        if(din==1'b0)
        ns=s2;
        else
        ns=s1;
        end
        
        s2: begin
        if(din==1'b1)
        ns=s3;
        else
        ns=idle;
        end
        
        s3:begin
        if(din==1'b1)
        ns=s1;
        
        else begin
        
        ns=idle;
        
        end
        end
        
        default : ns =idle;
        endcase       
         end
         
         always@(posedge clk)
            begin
            if(rst)
             detected<=1'b0;
             else if(ps==s3&&din==1'b0)
             detected<=1'b1;
             
             else
             detected<=1'b0;
             end
endmodule
