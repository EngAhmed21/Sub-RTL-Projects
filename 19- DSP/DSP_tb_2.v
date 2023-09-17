module  DSP_tb_2 ();    // OPERATION = "SUB"
    localparam OPERATION = "SUB";

    reg clk, rstn;
    reg [17 : 0] A, B, D;
    reg [47 : 0] C;
    wire [47 : 0] P;

    DSP #(.OPERATION(OPERATION)) uut (.clk(clk), .rstn(rstn), .A(A), .B(B), .C(C), .D(D), .P(P));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2) clk = ~clk;

    integer i;
    initial begin
        clk = 1'b1;     rstn = 1'b0;
        A = 15;         B = 17;
        C = 38;         D = 19;

        @(negedge clk) rstn = 1'b1;

        for (i = 0; i < 15; i = i + 1) begin
            repeat(4) @(negedge clk);
            A = $urandom_range(0,100);      B = $urandom_range(0,100);
            C = $urandom_range(0,100);      D = $urandom_range(0,100);
        end
        $stop;
    end
endmodule