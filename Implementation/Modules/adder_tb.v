`timescale 1ns / 1ps

module adder_tb;
  reg [31:0] i_A, i_B;
  wire [31:0] o_S;

  adder uut (
      .i_A(i_A),
      .i_B(i_B),
      .o_S(o_S)
  );

  initial begin
    $dumpfile("./CompiledOutputs/adder.vcd");
    $dumpvars(0, adder_tb);

    // Stimulus generation
    i_A = 10;  // Assign value to input A
    i_B = 20;  // Assign value to input B

    // Wait for a few time units to observe the output
    #10;

    // Print results
    $display("Result of addition: %d", o_S);

    // Finish the simulation
    $finish;
  end

endmodule
