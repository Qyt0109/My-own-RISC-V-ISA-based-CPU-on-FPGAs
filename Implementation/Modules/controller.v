module controller (
    input wire [6:0] opcode,  // Instruction
    input wire [2:0] funct3,  // Instruction
    input wire funct7_bit5,  // Instruction
    input wire ALU_zero,  // ALU decoder

    output wire ALU_src,  // ALU decoder
    output wire [1:0] ALU_ctrl,  // ALU decoder
    output wire [1:0] PC_src,
    output wire [1:0] imm_src,
    output wire [1:0] result_src,
    output wire register_write,
    output wire memory_write
);
  wire [1:0] ALU_opcode;
  wire jump;
  wire jalr;
  wire branch;
  wire new_ALU_zero;

  assign new_ALU_zero = (funct3[0] && opcode == 7'b1100011) ? !ALU_zero : ALU_zero;
  assign PC_src = {jalr, (new_ALU_zero & branch) | jump};

  ALU_decoder ALU_decoder_inst (
      .ALU_opcode(ALU_opcode),
      .funct3(funct3),
      .funct7_bit5(funct7_bit5),
      .opcode_bit5(opcode[5]),
      .ALU_ctrl(ALU_ctrl)
  );

endmodule  //controller
