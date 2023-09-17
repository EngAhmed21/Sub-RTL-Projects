module PWM_tb ();
    localparam BITS = 4;
    localparam TIMER_DELAY = 10;

    reg clk, rstn;
    reg [BITS : 0] duty;
    wire pwm_out;

    PWM #(.BITS(BITS), .TIMER_DELAY(TIMER_DELAY)) uut (.clk(clk), .rstn(rstn), .duty(duty), .pwm_out(pwm_out));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        duty = 8;
        #1 $display ("rstn = %0b, pwm_out = %0d", rstn, pwm_out);

        @(negedge clk)  rstn = 1;
        repeat (300) begin
            @(negedge clk)  $display ("rstn = %0b, duty = %0d, pwm_out = %0d", rstn, duty, pwm_out);
        end
        $stop;
    end
endmodule