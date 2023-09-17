module multi_decade_tb ();
    reg clk, rstn, en;
    wire [3 : 0] ones, tens, hundreds;
    wire done;

    multi_decade uut (.clk(clk), .rstn(rstn), .en(en), .ones(ones), .tens(tens), .hundreds(hundreds), .done(done));

    localparam CLK_PERIOD = 10;
    always 
        #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, ones = %0d, tens = %0d, hundreds = %0d, done = %0b", rstn, ones, tens, hundreds, done);

        @(negedge clk)  rstn = 1;
        en = 0;
        repeat (3)
            @(negedge clk)  $display ("rstn = %0b, en = %0b, ones = %0d, tens = %0d, hundreds = %0d, done = %0b", rstn, en, ones, tens, hundreds, done);

        en = 1;
        repeat (1000) begin
            @(negedge clk)  $display ("rstn = %0b, en = %0b, ones = %0d, tens = %0d, hundreds = %0d, done = %0b", rstn, en, ones, tens, hundreds, done);
        end
        $stop;
    end

endmodule