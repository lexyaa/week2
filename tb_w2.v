module tb2           ;
// ------------------------------------------------------------------
// instances
// ------------------------------------------------------------------
reg   [3:0]   a        ;
reg   [3:0]   b        ;
reg           ci       ;

wire  [3:0]   s1       ;
wire          co1      ;
wire  [3:0]   s2       ;
wire          co2      ;

fa4_inst      dut_1(   .s   ( s1    ),
                       .co  ( co1   ),
                       .a   ( a     ),
                       .b   ( b     ),
                       .ci  ( ci    ));

fa4_mbit      dut_2(   .s   ( s2    ),
                       .co  ( co2   ),
                       .a   ( a     ),
                       .b   ( b     ),
                       .ci  ( ci    ));

// --------------------------------------------------------------------
// stimulus
// --------------------------------------------------------------------
initial begin
    $display("Using Instances:  s1, co1");
    $display("Using Multi-bit:  s2, co2");
    $display("=========================================================");
    $display("  ci  a  b  s1  co1  s2  co2");
    $display("=========================================================");
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   {ci, a, b} = $random();   #(50)   $display("  %d  %d  %d  %d  %d  %d  %d", ci, a, b, s1, co1, s2, co2);
    #(50)   $finish;
end

endmodule

module tb_cnt;

parameter  N = 8;
reg            clk     ;
reg            rst_n   ;
wire   [N-1:0]   cnt     ;

counter dut(
               .cnt    ( cnt    ),
               .clk    ( clk    ),
               .rst_n  ( rst_n  ));

initial begin
    clk = 1'b0;
end

always begin
    #(10) clk = ~clk;
end

initial begin
    rst_n = 1'b0;
#(10)
    rst_n = 1'b1;
#(1000) $finish;
end

endmodule
