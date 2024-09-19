`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 15:24:30
// Design Name: 
// Module Name: mem
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
module mem(
    input clk,             
    input rst,             
    input wr,              
    input rd,              
    input [3:0] ad,        
    input [7:0] Datain,    
    output reg [7:0] Dataout 
);

    reg [7:0] A [0:16];
    always @ (posedge clk)
    begin
        if (rst) 
        begin
            Dataout <= 8'b0;
        end
        else 
        begin
            case ({wr, rd})
                2'b10: 
                begin
                    A[ad] <= Datain; 
                end
                2'b01: 
                begin
                    Dataout <= A[ad];
                end
                default: 
                begin
                    Dataout <= 8'bz;
                end
            endcase
        end
    end
endmodule



