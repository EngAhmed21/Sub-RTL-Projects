module shift_reg_tb ();
    localparam SIZE = 4;

    reg clk, rstn, SI;
    wire SO;

    shift_reg #(.SIZE(SIZE)) uut (.clk(clk), .rstn(rstn), .SI(SI), .SO(SO));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, SO = %0d", rstn, SO);

        @(negedge clk)  rstn = 1;
        repeat (20) begin
            SI = $random;
            @(negedge clk)  $display ("rstn = %0b, SI = %0d, SO = %0d", rstn, SI, SO);
        end
        $stop;
    end
endmodule