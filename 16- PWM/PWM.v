module PWM #(parameter BITS = 4, TIMER_DELAY = 10) (
    input clk, rstn, 
    input [BITS : 0] duty,
    output pwm_out
);
    wire timer_done, out_next, out_reg;
    wire [BITS - 1 : 0] counter_out;
    
    timer #(.DELAY(TIMER_DELAY)) Timer (.clk(clk), .rstn(rstn), .done(timer_done));

    UP_counter #(.BITS(BITS)) Counter (.clk(clk), .rstn(rstn), .en(timer_done), .Q(counter_out));

    comparator_less #(.BITS(BITS)) Comparator (.operand1(counter_out), .operand2(duty), .less(out_next));

    D_ff FF (.clk(clk), .rstn(rstn), .D(out_next), .Q(out_reg));

    assign pwm_out = out_reg;
endmodule
