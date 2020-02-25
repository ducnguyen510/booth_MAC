`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 03:26:26 PM
// Design Name: 
// Module Name: booth_v3_tb
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


module booth_v3_tb(

    );
    localparam N=25,M=49;
    reg signed [N-1:0] a,b;
    wire signed [M-1:0] c;

    booth_v3 uut(.a(a),
                 .b(b),
                 .c(c));
   initial 
   begin
   a=25'b0111111111111111111111111;
   b=25'b0111111111111111111111111;
   #100;
   $stop;
   end
endmodule
