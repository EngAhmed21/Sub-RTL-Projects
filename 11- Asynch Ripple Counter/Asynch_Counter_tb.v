module asynch_counter_tb ();
    localparam SIZE = 4;

    reg clk, rstn;
    wire [SIZE - 1 : 0] Q;

    asynch_counter #(.SIZE(SIZE)) uut (.clk(clk), .rstn(rstn), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, Q = %0d", rstn, Q);

        @(negedge clk)  rstn = 1;
        repeat (30) begin
            @(negedge clk)  $display ("rstn = %0b, Q = %0d", rstn, Q);
        end
        $stop;
    end
endmodule