module synch_counter #(parameter SIZE = 4) (
    input clk, rstn,
    output [SIZE - 1 : 0] Q
);
    wire [SIZE - 1 : 0] Q_next, Q_reg;

    assign Q_next [0] = 1'b1;
    assign Q_next [SIZE - 1 : 1] = Q_reg [SIZE - 2 : 0] & Q_next [SIZE - 2 : 0];

    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin: Stage
            T_ff FF (.clk(clk), .rstn(rstn), .T(Q_next[i]), .Q(Q_reg[i]));
        end 
    endgenerate 

    assign Q = Q_reg;
endmodule
