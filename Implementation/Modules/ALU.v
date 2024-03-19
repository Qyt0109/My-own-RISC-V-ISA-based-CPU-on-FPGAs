module ALU (
    input wire [ 1:0] ALU_ctrl,
    input wire [31:0] ALU_operandA,
    input wire [31:0] ALU_operandB,

    output wire ALU_zero,
    output reg [31:0] ALU_result
);
  assign ALU_zero = (ALU_result == 0) ? 1 : 0;

  always @(ALU_ctrl, ALU_operandA, ALU_operandB) begin
    case (ALU_ctrl)
      2'b00: ALU_result = ALU_operandA + ALU_operandB;  // Add
      2'b01: ALU_result = ALU_operandA - ALU_operandB;  // Sub
      2'b10: ALU_result = ALU_operandA & ALU_operandB;  // And
      2'b11: ALU_result = ALU_operandA | ALU_operandB;  // Or

      default: ALU_result = 0;
    endcase
  end

endmodule  //ALU