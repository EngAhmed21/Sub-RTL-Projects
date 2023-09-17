module timer_tb ();
    localparam DELAY = 16;

    reg clk, rstn;
    wire done;

    timer #(.DELAY(DELAY)) uut (.clk(clk), .rstn(rstn), .done(done));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, done = %0d", rstn, done);

        @(negedge clk)  rstn = 1;
        repeat (50) begin
            @(negedge clk)  $display ("rstn = %0b, done = %0d", rstn, done);
        end
        $stop;
    end
endmodule