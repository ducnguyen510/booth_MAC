`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 02:59:23 PM
// Design Name: 
// Module Name: booth_v3
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


module booth_v3#(parameter N=25,M=50)(
    input wire signed [N-1:0] a,b,
    output wire signed [M-1:0] c
);
    wire signed [N-1:0] Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24;
    wire signed [N-1:0] A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24;
    wire signed [N-1:0] q0;
    assign q0[0] =1'b0;
   //wire [7:0] m;
    wire qout;
    booth_substep step1(24'd0,a,b,1'b0,A1,Q1,q0[1]);
    booth_substep step2(A1,Q1,b,q0[1],A2,Q2,q0[2]);
    booth_substep step3(A2,Q2,b,q0[2],A3,Q3,q0[3]);
    booth_substep step4(A3,Q3,b,q0[3],A4,Q4,q0[4]);
    booth_substep step5(A4,Q4,b,q0[4],A5,Q5,q0[5]);
    booth_substep step6(A5,Q5,b,q0[5],A6,Q6,q0[6]);
    booth_substep step7(A6,Q6,b,q0[6],A7,Q7,q0[7]);
    booth_substep step8(A7,Q7,b,q0[7],A8,Q8,q0[8]);
    booth_substep step9(A8,Q8,b,q0[8],A9,Q9,q0[9]);
    booth_substep step10(A9,Q9,b,q0[9],A10,Q10,q0[10]);
    booth_substep step11(A10,Q10,b,q0[10],A11,Q11,q0[11]);
    booth_substep step12(A11,Q11,b,q0[11],A12,Q12,q0[12]);
    booth_substep step13(A12,Q12,b,q0[12],A13,Q13,q0[13]);
    booth_substep step14(A13,Q13,b,q0[13],A14,Q14,q0[14]);
    booth_substep step15(A14,Q14,b,q0[14],A15,Q15,q0[15]);
    booth_substep step16(A15,Q15,b,q0[15],A16,Q16,q0[16]);
    booth_substep step17(A16,Q16,b,q0[16],A17,Q17,q0[17]);  
    booth_substep step18(A17,Q17,b,q0[17],A18,Q18,q0[18]);
    booth_substep step19(A18,Q18,b,q0[18],A19,Q19,q0[19]);
    booth_substep step20(A19,Q19,b,q0[19],A20,Q20,q0[20]);
    booth_substep step21(A20,Q20,b,q0[20],A21,Q21,q0[21]);
    booth_substep step22(A21,Q21,b,q0[21],A22,Q22,q0[22]);
    booth_substep step23(A22,Q22,b,q0[22],A23,Q23,q0[23]);
    booth_substep step24(A23,Q23,b,q0[23],A24,Q24,q0[24]);
    booth_substep step25(A24,Q24,b,q0[24],c[49:25],c[24:0],qout);
    
endmodule

module booth_substep#(parameter N=25)(
   input wire signed [N-1:0] a,Q, //a :register answer, Q :multiplier
   input wire signed [N-1:0] m,   // m: mutiplicand
   input wire q0,
   output reg signed [N-1:0] high,low, //high:N-bit first,low: N-bit last 
   output reg cq0 //change q0
   );
   wire [N-1:0] add,sub; //result add,sub
   assign add =a + m;
   assign sub =a - m;
   
   always @*
          begin
           if(Q[0]==q0) begin
                           cq0=Q[0];
                           low =Q>>1;
                            low[N-1] =a[0];
                           high =a>>1;
                           if(a[N-1]==1) //if a is negative => ans is negative
                            high[N-1] =1;
                        end
           else if(Q[0]==1 &&q0==0) begin
                                      cq0=Q[0];
                                      low = Q>>1;
                                       low[N-1] =sub[0];
                                      high =sub>>1;
                                      if(sub[N-1]==1) //if sub is negative => ans is negative
                                       high[N-1]=1;
                                    end
          else begin
                cq0=Q[0];
                low =Q>>1;
                 low[N-1]=add[0];
                high =add>>1;
                if(add[N-1]==1) //if add is negative=> ans is negative
                 high[N-1]=1;
               end
          end
        
endmodule