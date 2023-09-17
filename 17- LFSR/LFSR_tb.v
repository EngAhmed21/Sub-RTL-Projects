module LFSR_tb ();
    reg clk, rstn;
    wire [3 : 0] Q;

    LFSR uut (.clk(clk), .rstn(rstn), .Q(Q));

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