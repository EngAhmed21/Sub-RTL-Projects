module multi_decade (
    input clk, rstn, en,  
    output [3 : 0] ones, tens, hundreds,
    output done
);
    wire [3 : 0] Q [2 : 0];
    wire [2 : 0] en_signals, done_signals;

    assign en_signals = {(done_signals [1 : 0] & en_signals [1 : 0]), en};

    genvar i;
    generate
        for (i = 0; i < 3; i = i + 1) begin: Stage
            BCD_counter digit (.clk(clk), .rstn(rstn), .en(en_signals[i]), .Q(Q[i]), .done(done_signals[i]));
        end

    endgenerate

    assign hundreds = Q[2];
    assign tens = Q[1];
    assign ones = Q[0];
    assign done = done_signals[2] & en_signals[2];
endmodule