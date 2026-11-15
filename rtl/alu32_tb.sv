
module alu32_tb;

    // Testbench inputs and outputs.
    // These connect directly to the ALU module.

    logic [31:0] alu_in_a;
    logic [31:0] alu_in_b;
    logic [3:0]  alu_control;
    logic [31:0] alu_out;
    logic        zero;

    // Instantiate our ALU.
    // This creates an actual instance of the alu32 module.

    alu32 uut (
        .alu_in_a(alu_in_a),
        .alu_in_b(alu_in_b),
        .alu_control(alu_control),
        .alu_out(alu_out),
        .zero(zero)
    );

    // Apply test inputs and check the results.

    initial begin

        // TEST 1: ADD 10+20
        alu_in_a = 32'd10;
        alu_in_b = 32'd20;
        alu_control = 4'b0000;
        #10;

        $display("ADD: %0d + %0d = %0d", alu_in_a, alu_in_b, alu_out);


        // TEST 2: SUB 20-10
        alu_in_a = 32'd20;
        alu_in_b = 32'd10;
        alu_control = 4'b0001;
        #10;

        $display("SUB: %0d - %0d = %0d", alu_in_a, alu_in_b, alu_out);


        // TEST 3: SLL 1 << 4
        alu_in_a = 32'd1;
        alu_in_b = 32'd4;
        alu_control = 4'b0010;
        #10;

        $display("SLL: %0d << 4 = %0d", alu_in_a, alu_out);


        // TEST 4: SLT -5 < 3
        alu_in_a = -32'sd5;
        alu_in_b = 32'd3;
        alu_control = 4'b0011;
        #10;

        $display("SLT: -5 < 3 = %0d", alu_out);


        // TEST 5: SLTU 3 < 5
        alu_in_a = 32'd3;
        alu_in_b = 32'd5;
        alu_control = 4'b0100;
        #10;

        $display("SLTU: 3 < 5 = %0d", alu_out);


        // TEST 6: XOR 5 ^ 3
        alu_in_a = 32'd5;
        alu_in_b = 32'd3;
        alu_control = 4'b0101;
        #10;

        $display("XOR: 5 ^ 3 = %0d", alu_out);


        // TEST 7: OR 5 | 3
        alu_in_a = 32'd5;
        alu_in_b = 32'd3;
        alu_control = 4'b0110;
        #10;

        $display("OR: 5 | 3 = %0d", alu_out);


        // TEST 8: AND 5 & 3
        alu_in_a = 32'd5;
        alu_in_b = 32'd3;
        alu_control = 4'b0111;
        #10;

        $display("AND: 5 & 3 = %0d", alu_out);


        // TEST 9: SRL 32 >> 2
        alu_in_a = 32'd32;
        alu_in_b = 32'd2;
        alu_control = 4'b1000;
        #10;

        $display("SRL: 32 >> 2 = %0d", alu_out);


        // TEST 10: SRA -32 >>>
        alu_in_a = -32'sd32;
        alu_in_b = 32'd2;
        alu_control = 4'b1001;
        #10;

        $display("SRA: -32 >>> 2 = %0d", $signed(alu_out));


        // TEST 11: ZERO FLAG. If you subtract two equal things (10 - 10). It's output is zero. And since 10-10 is supposed to be zero. that is true. thus they are equal. meaning an true (1) output
        alu_in_a = 32'd10;
        alu_in_b = 32'd10;
        alu_control = 4'b0001;
        #10;

        $display("ZERO FLAG: %0d", zero);

        // TEST 12: ZERO FLAG (10 - 5)
        // Result is not zero, so the zero flag should be 0. 10 - 5 != 0

        alu_in_a = 32'd10;
        alu_in_b = 32'd5;
        alu_control = 4'b0001;
        #10;

        $display("ZERO FLAG (NON-ZERO): %0d", zero);


        $finish;

    end

endmodule
