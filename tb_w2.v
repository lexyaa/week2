// -----------------------------
// Assignment01
// -----------------------------
module a1;

parameter     N = 10       ;

wire          q            ;
wire          nq           ;

reg           rst_n        ;
reg           d            ;
reg           clk          ;

initial       clk = 1'b0   ;
initial       d = 1'b0     ;
always #(2*N)  clk = ~clk  ;

// -----------------
// Instances
// -----------------
dff_sr        uo( .q       (  q      ),
                  .nq      (  nq     ),
                  .rst_n   (  rst_n  ),
                  .d       (  d      ),
                  .clk     (  clk    ));

// -----------------
// Stimulus
// -----------------
initial begin
#(N)    {rst_n, d} = 2'b00           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b01           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b11           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b10           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b10           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b00           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b01           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
$finish;
end

endmodule



// -----------------------------
// Assignment02
// -----------------------------
module a2;

parameter      N = 10           ;

wire [3:0]     q                ;
wire [3:0]     nq               ;

reg            rst_n            ;
reg            d                ;
reg            clk              ;

initial        clk = 1'b0       ;
initial        d = 1'b0         ;
initial        rst_n = 1'b0     ;
always #(2*N)  clk = ~clk       ;

// ---------------------------------------
// Instances
// ---------------------------------------
cnt_dff        cnt_u0( .q     ( q     ),
                       .nq    ( nq    ),
                       .rst_n ( rst_n ),
                       .d     ( d     ),
                       .clk   ( clk   ));

// ---------------------------------------
// Stimulus
// ---------------------------------------
initial begin
#(N)    {rst_n, d} = 2'b00           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b01           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b11           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b10           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b10           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b00           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
#(N)    {rst_n, d} = 2'b01           ;     #(N)    $display(" rst_n =%b, clk = %b, D = %b, Q = %b", rst_n, clk, d, q);
$finish;
end

endmodule
