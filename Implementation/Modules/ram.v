module ram #(
    parameter NUMBER_OF_ADDRESS_BITS = 10,  //bits
    parameter NUMBER_OF_DATA_BITS = 32  // bits
) (
    input wire clk,
    input wire rst,
    input wire write_enable,
    input wire [NUMBER_OF_ADDRESS_BITS - 1 : 0] addr,
    input wire [NUMBER_OF_DATA_BITS - 1 : 0] write_data,
    output wire [NUMBER_OF_DATA_BITS - 1 : 0] read_data
);
  reg [NUMBER_OF_DATA_BITS-1 : 0] memory[0 : 2 ** (NUMBER_OF_ADDRESS_BITS-2) - 1]; // NUMBER_OF_ADDRESS_BITS-2 for word addressable memory
  integer memory_address_value_index;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (
          memory_address_value_index = 0;
          memory_address_value_index < 2 ** (NUMBER_OF_ADDRESS_BITS - 2);
          memory_address_value_index = memory_address_value_index + 1
      ) begin
        memory[i] <= 'h0;
      end
    end else if (write_enable) begin
      memory[addr[NUMBER_OF_ADDRESS_BITS-1 : 2]] <= write_data; // NUMBER_OF_ADDRESS_BITS-2 for word addressable memory
    end
  end

  assign read_data = memory[addr[NUMBER_OF_ADDRESS_BITS-1 : 2]];  // [NUMBER_OF_ADDRESS_BITS - 1:2]

endmodule
