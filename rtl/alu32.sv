module alu32 (

// 2 32-bit input wires (a, b), a 4-bit control signal (selects the operation), and a 32-bit output register.
// The ALU performs arithmetic and logical operations.

    input logic [31:0] alu_in_a,
    input logic [31:0] alu_in_b,
    input logic [3:0] alu_control,
    output logic [31:0] alu_out,
    output logic zero
);

    // Combinational logic: output changes whenever inputs change.
    // No clock is needed since the ALU does not store data.

    always_comb begin

        alu_out = 32'b0; // Default output that prevents latch inference.

        // Selects which operation to perform based on alu_control.
        case (alu_control)

            4'b0000: alu_out = alu_in_a + alu_in_b; 
            // ADD: A + B.

            4'b0001: alu_out = alu_in_a - alu_in_b;
            // SUB: A - B.

            4'b0010: alu_out = alu_in_a << alu_in_b[4:0];
            // SLL: Shifts A left. Zeros fill empty bits.
            // Only 5 bits needed since RV32I shifts by 0-31 positions.

            4'b0011: alu_out = ($signed(alu_in_a) < $signed(alu_in_b)) ? 32'd1 : 32'd0;
            // SLT: Signed comparison. Outputs 1 if A < B.
            // $signed() interprets the inputs as two's complement integers.
            // Signed numbers can be positive or negative.
            // Unsigned numbers can only be zero or positive.

            4'b0100: alu_out = (alu_in_a < alu_in_b) ? 32'd1 : 32'd0;
            // SLTU: Unsigned comparison. Outputs 1 if A < B.

            4'b0101: alu_out = alu_in_a ^ alu_in_b;
            // XOR: Outputs 1 wherever the input bits differ.

            4'b0110: alu_out = alu_in_a | alu_in_b;
            // OR: Outputs 1 wherever either input bit is 1.

            4'b0111: alu_out = alu_in_a & alu_in_b;
            // AND: Outputs 1 wherever both input bits are 1.

            4'b1000: alu_out = alu_in_a >> alu_in_b[4:0];
            // SRL: Logical right shift. Zeros fill empty bits.

            4'b1001: alu_out = $signed(alu_in_a) >>> alu_in_b[4:0];
            // SRA: Arithmetic right shift. Preserves the sign bit.
            // performs a signed right shift when the input is signed.

            default: alu_out = 32'b0;
            // Unused control signals default to zero.

        endcase

    end

    // Zero flag: 1 (true/high) when the ALU result is zero.
    // TLDR: A zero flag gives a 1 (true) when an output/result is supposed to be zero (10-10, 20-20, -20+20, etc.). While a output of 0 (false) is given when the result is not supposed to be zero.

    assign zero = (alu_out == 32'b0);

endmodule
