`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 15:25:38
// Design Name: 
// Module Name: mem_tb
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
module mem_tb();

    reg clk;              
    reg rst;            
    reg wr;          
    reg rd;          
    reg [3:0] ad;     
    reg [7:0] Datain;      


    wire [7:0] Dataout;   
    mem uut (
        .clk(clk), 
        .rst(rst), 
        .wr(wr), 
        .rd(rd), 
        .ad(ad), 
        .Datain(Datain), 
        .Dataout(Dataout)
    );

  
    always #5 clk = ~clk;

    initial begin
     
        clk = 0;
        rst = 0;
        wr = 0;
        rd = 0;
        ad = 0;
        Datain = 0;
        
        $display("Applying reset...");
        rst = 1;
        #10 rst = 0;  

        $display("Test 1: Writing 8'hAA to address 0");
        ad = 4'b0000;   
        Datain = 8'hAA;  
        wr = 1;           
        rd = 0;           
        #10 wr = 0;       

        $display("Reading from address 0");
        rd = 1;           
        #10 $display("Data at address 0: %h", Dataout); 
        rd = 0;           

        
        $display("Test 2: Writing 8'hBB to address 1");
        ad = 4'b0001;   
        Datain = 8'hBB;  
        wr = 1;          
        rd = 0;           
        #10 wr = 0;       

        $display("Reading from address 1");
        rd = 1;           
        #10 $display("Data at address 1: %h", Dataout); 
        rd = 0;           

        $display("Test 3: Writing 8'hCC to address 2 (write priority test)");
        ad = 4'b0010;   
        Datain = 8'hCC;  
        wr = 1;           
        rd = 1;           
        #10 wr = 0;       
        
        rd = 0;          
        $display("Reading from address 2");
        rd = 1;           
        #10 $display("Data at address 2: %h", Dataout);
        rd = 0;          

        $display("Test completed.");
        $stop;
    end

endmodule

