module main_decoder (
    input wire [6:0] opcode,

    output reg [1:0] imm_src,
    output reg [1:0] result_src,
    output reg [1:0] ALU_opcode,
    output reg ALU_src,
    output reg jump,
    output reg jalr,
    output reg branch,
    output reg register_write,
    output reg memory_write
);
  always_comb begin
    case (opcode)
      // Load instruction (I)
      7'b0000011: begin
        register_write = 1;
        imm_src = 2'b00;
        ALU_src = 1;
        memory_write = 0;
        result_src = 2'b01;
        branch = 1'b00;
        ALU_opcode = 2'b00;
        jump = 0;
        jalr = 0;
      end
      default: begin

      end
    endcase
  end

endmodule  //main_decoder
