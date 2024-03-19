module rom #(
    parameter NUMBER_OF_ADDRESS_BITS = 10,  //bits
    parameter NUMBER_OF_DATA_BITS = 32  // bits
) (
    input wire [NUMBER_OF_ADDRESS_BITS - 1 : 0] addr,
    output wire [NUMBER_OF_DATA_BITS - 1 : 0] read_data
);
  reg [NUMBER_OF_DATA_BITS-1 : 0] memory[0 : 2 ** (NUMBER_OF_ADDRESS_BITS-2) - 1]; // NUMBER_OF_ADDRESS_BITS-2 for word addressable memory

  initial begin
    $readmemh("test_asm.txt", memory);
  end

  assign read_data = memory[addr[NUMBER_OF_ADDRESS_BITS-1 : 2]];  // [NUMBER_OF_ADDRESS_BITS - 1:2]

endmodule
