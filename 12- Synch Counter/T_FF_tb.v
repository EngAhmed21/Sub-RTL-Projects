module T_ff_tb ();
    reg clk, rstn, T;
    wire Q;

    T_ff uut (.clk(clk), .rstn(rstn), .T(T), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, Q = %0d", rstn, Q);

        @(negedge clk)  rstn = 1;
        repeat (10) begin
            T = $random;
            @(negedge clk)  $display ("rstn = %0b, T = %0d, Q = %0d", rstn, T, Q);
        end
        $stop;
    end
endmodule