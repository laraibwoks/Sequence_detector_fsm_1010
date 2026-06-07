`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2026 13:10:06
// Design Name: 
// Module Name: fsm_mor
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


module fsm_mor( input rst,clk,input din,output reg detected

    );
      parameter idle = 3'b000;// bcz 5 states are used
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 =3'b100;
    
      reg [2:0] ps,ns;
    
    always@(posedge clk)// ps logic seq logic<= use// more seq detector
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
        
        ns=s4;
        
        end
        end
        
        s4:begin
        if(din==1'b1)
        ns=s1;
        else
        ns=idle;
        end
        
        default : ns =idle;
        endcase       
         end
         
         always@(posedge clk)
            begin
            if(rst)
             detected<=1'b0;
             else if(ps==s4)
             detected<=1'b1;
             
             else
             detected<=1'b0;
             end
endmodule
