
//-----------------------------------------------------------------------------------
//   Full-Adder (Dataflow)
//-----------------------------------------------------------------------------------
module fa_dataflow( 
               s,
               co,
               a,
               b,
               ci  );
 
output         s   ;  //sum
output         co  ;  //carry out

input          a   ;  //input a
input          b   ;  //input b
input          ci  ;  //carry in

assign         s   =  (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
assign         co  =  (a & b) + (b & ci) + (a & ci);

endmodule

//-----------------------------------------------------------------------------------
//   Full-Adder (Behavior)
//-----------------------------------------------------------------------------------
module fa_behavior( 
               s,
               co,
               a,
               b,
               ci  );
 
output         s   ;  //sum
output         co  ;  //carry out

input          a   ;  //input a
input          b   ;  //input b
input          ci  ;  //carry in

reg            s;
reg            co;

always @(*)
       begin
       s   =  (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
       co  =  (a & b) + (b & ci) + (a & ci);
end

endmodule

//-----------------------------------------------------------------------------------
//   Full-Adder (Case)
//-----------------------------------------------------------------------------------
module fa_case( 
               s,
               co,
               a,
               b,
               ci  );
 
output         s   ;  //sum
output         co  ;  //carry out

input          a   ;  //input a
input          b   ;  //input b
input          ci  ;  //carry in

reg            s;
reg            co;

always @(*)begin
       case({ci, a, b})
             3'b000 : {co, s} = 2'b00;
             3'b001 : {co, s} = 2'b01;
             3'b010 : {co, s} = 2'b01;
             3'b011 : {co, s} = 2'b10;
             3'b100 : {co, s} = 2'b01;
             3'b101 : {co, s} = 2'b10;
             3'b110 : {co, s} = 2'b10;
             3'b111 : {co, s} = 2'b11;
        endcase
end

endmodule

// -----------------------------------------------------------------------
// 1-bit Full Adder
// -----------------------------------------------------------------------
module fa(
           s,
           co,
           a,
           b,
           ci  );

output     s   ;   //sum
output     co  ;   //carry out

input      a   ;   //input a
input      b   ;   //input b
input      ci  ;   //carry in

assign     {co, s} = a + b + ci ;

endmodule

module fa4_inst( s,
                co,
                a,
                b,
                ci  );

output  [3:0]   s        ;   //sum
output          co       ;   //carry out

input   [3:0]   a        ;   //input a
input   [3:0]   b        ;   //input b
input           ci       ;   //carry in

wire    [2:0]   carry    ;   //ripple carry

fa              fa_u0(   .s   ( s[0]     ),
                         .co  ( carry[0] ),
                         .a   ( a[0]     ),
                         .b   ( b[0]     ),
                         .ci  ( ci       ));

fa              fa_u1(   .s   ( s[1]     ),
                         .co  ( carry[1] ),
                         .a   ( a[1]     ),
                         .b   ( b[1]     ),
                         .ci  ( carry[0] ));

fa              fa_u2(   .s   ( s[2]     ),
                         .co  ( carry[2] ),
                         .a   ( a[2]     ),
                         .b   ( b[2]     ),
                         .ci  ( carry[1]    ));

fa              fa_u3(   .s   ( s[3]     ),
                         .co  ( co       ),
                         .a   ( a[3]     ),
                         .b   ( b[3]     ),
                         .ci  ( carry[2] ));

endmodule

// --------------------------------------------------------------
// Multi-bit Adder
// --------------------------------------------------------------
module fa4_mbit(         s,
                         co,
                         a,
                         b,
                         ci  );

output  [3:0]   s        ;   //sum
output          co       ;   //carry out

input   [3:0]   a        ;   //input a
input   [3:0]   b        ;   //input b
input           ci       ;   //carry in

assign          {co, s}  = a + b + ci;

endmodule

// ---------------------------------------------------------------
// Mux
// ---------------------------------------------------------------
module mux2(y, d0, d1, s);

parameter N = 1         ;

output [N-1:0]      y   ;

input  [N-1:0]      d0  ;
input  [N-1:0]      d1  ;
input               s   ;

assign              y = s ? d0 : d1  ;

endmodule

// ---------------------------------------------------------------
// 4:1 MUX
// ---------------------------------------------------------------
module mux4(y, d0, d1, s)

parameter N= 2          ;

output [N-1:0]      y   ;

input  [N-1:0]      d0  ;
input  [N-1:0]      d1  ;
input               s   ;

mux2 mux2_u0

// --------------------------------------------------------------
// Counter
// --------------------------------------------------------------
module counter(cnt, clk, rst_n);

parameter N = 3            ;

output   [N-1:0]   cnt     ;
input              clk     ;
input              rst_n   ;

reg      [N-1:0]   cnt     ;
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        cnt <= 0;
    end else begin
        cnt <= cnt +1;
    end
end

endmodule
