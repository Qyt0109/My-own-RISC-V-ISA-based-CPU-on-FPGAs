module adder (
    input  wire [31:0] i_A,
    input  wire [31:0] i_B,
    output wire [31:0] o_S
);

  assign o_S = i_A + i_B;

endmodule
