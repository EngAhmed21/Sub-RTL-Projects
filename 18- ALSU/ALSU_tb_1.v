module ALSU_tb ();    // INPUT_PRIORITY = "A", FULL_ADDER = "ON"
    localparam INPUT_PRIORITY = "A";
    localparam FULL_ADDER = "ON";
    localparam BITS = 3;

    reg clk, rstn, cin, SI, sh_left, red_op_A, red_op_B, pass_A, pass_B;
    reg [BITS - 1 : 0] A, B;
    reg [2 : 0] opcode;
    wire [15 : 0] leds;
    wire [(2 * BITS) - 1 : 0] out;

    ALSU #(.BITS(BITS), .INPUT_PRIORITY(INPUT_PRIORITY), .FULL_ADDER(FULL_ADDER)) uut (.clk(clk), .rstn(rstn), .cin(cin), .SI(SI),
    .red_op_A(red_op_A), .red_op_B(red_op_B), .pass_A(pass_A), .pass_B(pass_B), .sh_left(sh_left),.A(A), .B(B), .opcode(opcode),
    .leds(leds), .out(out));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2) clk = ~clk;

    integer i;
    initial begin
        clk = 1'b1;             rstn = 1'b0;
        cin = 1'b1;             SI = 1'b1;
        red_op_A = 1'b0;        red_op_B = 1'b0;
        pass_A = 1'b0;          pass_B = 1'b0;
        sh_left = 1'b1;         A = 5;
        B = 1;                  opcode = 3'b010;
        
        @(negedge clk) rstn = 1'b1;

        for (i = 0; i < 20; i = i + 1) begin
            @(negedge clk);
            {A, B, sh_left} = $random;
            opcode = $urandom_range(0, 5);
        end

        for (i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            {red_op_A, red_op_B} = $random;
            opcode = $urandom_range(0, 1);
        end

        @(negedge clk);
        red_op_A = 1'b0;        red_op_B = 1'b0;

        for (i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            {pass_A, pass_B} = $random;
            opcode = $urandom_range(0, 5);
        end

        @(negedge clk);
        pass_A = 1'b0;          pass_B = 1'b0;
        opcode = 3'b010;        red_op_A = 1'b1;

        for (i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            opcode = $urandom_range(2, 5);
            repeat (4) @(negedge clk);
        end
        
        @(negedge clk);
        red_op_A = 1'b0;        opcode = 3'b110;
        
        for (i = 0; i < 4; i = i + 1) begin
            @(negedge clk);
            opcode = $urandom_range(6, 7);
            repeat (4) @(negedge clk);
        end
        $stop;
    end
endmodule