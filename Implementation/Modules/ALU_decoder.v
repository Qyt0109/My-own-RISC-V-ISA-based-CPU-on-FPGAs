module ALU_decoder (
    input wire [1:0] ALU_opcode,
    input wire [2:0] funct3,
    input wire funct7_bit5,
    input wire opcode_bit5,

    output reg [1:0] ALU_ctrl
);

  always_comb begin
    case (ALU_opcode)
      2'b00:   ALU_ctrl = 2'b00;
      2'b01:   ALU_ctrl = 2'b01;
      2'b10:   ALU_ctrl = 2'b01;
      2'b01: begin
        case (funct3)
          3'b000: begin
            if ({opcode_bit5, funct7_bit5} == 3'b011) begin
              ALU_ctrl = 2'b01;
            end else begin
              ALU_ctrl = 2'b00;
            end
          end
          3'b111:  ALU_ctrl = 2'b10;
          3'b110:  ALU_ctrl = 2'b11;
          default: ALU_ctrl = 2'bxx;
        endcase
      end
      default: ALU_ctrl = 2'bxx;
    endcase
  end

endmodule  //ALU_decode
