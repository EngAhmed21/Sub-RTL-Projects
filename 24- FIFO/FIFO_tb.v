module FIFO_tb ();
    localparam FIFO_DEPTH = 512;
    localparam FIFO_WIDTH = 16;

    reg clk, rst, wen_a, ren_b;
    reg [FIFO_WIDTH - 1 : 0] din_a;
    wire [FIFO_WIDTH - 1 : 0] dout_b;
    wire full, empty;

    FIFO #(.FIFO_DEPTH(FIFO_DEPTH), .FIFO_WIDTH(FIFO_WIDTH)) uut (
    .clk(clk), .rst(rst), .wen_a(wen_a), .ren_b(ren_b), .din_a(din_a),
    .dout_b(dout_b), .full(full), .empty(empty));

   localparam CLK_PERIOD = 2;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;     rst = 1;
        wen_a = 0;   ren_b = 0;
        din_a = 0;

        @(negedge clk)  rst = 1'b0;

        repeat(20) begin
            @(negedge clk)  {wen_a, ren_b} = $random;
            din_a = $urandom_range(0, 100);    
        end

        @(negedge clk)  {wen_a, ren_b} = 2'b10;

        repeat(515) @(negedge clk);

        $stop;
    end
endmodule