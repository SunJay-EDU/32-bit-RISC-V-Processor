module register_file (

    // 2 read addresses, 1 write address, write data, write enable and 2 outputs.

    input logic clk,
    input logic reg_write,
    input logic [4:0] read_addr_1,
    input logic [4:0] read_addr_2,
    input logic [4:0] write_addr,
    input logic [31:0] write_data,

    output logic [31:0] read_data_1,
    output logic [31:0] read_data_2

);

    // 32 registers, each holding 32 bits of data.

    logic [31:0] registers [0:31];

    // Read ports retrieve values from selected registers.

    assign read_data_1 = (read_addr_1 == 5'd0) ? 32'd0 : registers[read_addr_1];
    assign read_data_2 = (read_addr_2 == 5'd0) ? 32'd0 : registers[read_addr_2];

  // The "?" statements are Ternary operations. Basically a compressed if else statement
  // For the line with "(read_addr_1 == 5'd0)", this part essentially asks "hey is the first 5 bits equal to zero?" if so, the output should be 32'd0 (the "? 32'd0" part is the output if the first 5 bits = 0)
  // However if read_addr_1 doesnt have its 5 bits as all zeroes, then it should give back the register address of read_addr_1. 
  // All of this logic for read_addr_1 follows for read_addr_2 stuff.

  // NOTE: These 2 lines right here builds a 2-to-1 Multiplexer (MUX). Will be explained in readme file

    // Write port stores data on the rising clock edge.

    always_ff @(posedge clk) begin

        if (reg_write && (write_addr != 5'd0)) begin
            registers[write_addr] <= write_data;
        end

    end

endmodule
