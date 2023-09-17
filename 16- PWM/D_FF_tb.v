module D_ff_tb ();
    reg clk, rstn, D;
    wire Q;

    D_ff uut (.clk(clk), .rstn(rstn), .D(D), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, Q = %0d", rstn, Q);

        @(negedge clk)  rstn = 1;
        repeat (10) begin
            D = $random;
            @(negedge clk)  $display ("rstn = %0b, D = %0d, Q = %0d", rstn, D, Q);
        end
        $stop;
    end
endmodule