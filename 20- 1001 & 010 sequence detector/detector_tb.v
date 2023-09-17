module detector_tb ();
    reg clk, rstn, in;
    wire out;

    detector uut (.clk(clk), .rstn(rstn), .in(in), .out(out));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    localparam X_IN = 16'b0110_1001_0010_1010;
    integer i;
    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, out = %0b", rstn, out);

        @(negedge clk)  rstn = 1;
        for (i = 0; i < 16; i = i + 1) begin
            in = X_IN[i];
            @(negedge clk)  $display ("rstn = %0b, in = %0b, out = %0b", rstn, in, out);
        end
        $stop;
    end
endmodule