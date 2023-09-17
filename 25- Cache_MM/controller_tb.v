module controller_tb ();
    reg clk, rst, enable_write, enable_read;
    reg [4 : 0] addr_mm;
    reg [15 : 0] data_in;
    wire [15 : 0] data_out;

    controller uut (.clk(clk), .rst(rst), .enable_write(enable_write), .enable_read(enable_read),
    .addr_mm(addr_mm), .data_in(data_in), .data_out(data_out));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)   clk = ~clk;

    integer i;
    initial begin
        clk = 1;    rst = 1;
        enable_write = 0;
        enable_read = 0;
        addr_mm = 0;
        data_in = 0;

        @(negedge clk)  rst = 0;

        @(negedge clk)  enable_write = 1;

        for(i = 0; i < 20; i = i + 1) begin
            addr_mm = i;
            data_in = $urandom_range(0, 50);
            #(CLK_PERIOD);
        end

        enable_write = 0;

        @(negedge clk)  enable_read = 1;
        repeat (15) begin
            repeat(4) @(negedge clk);
            addr_mm = $urandom_range(0, 19);
        end

        $stop;
    end
endmodule