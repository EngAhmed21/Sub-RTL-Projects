module shift_reg #(parameter SIZE = 4) (
    input clk, rstn, SI,
    output SO
);
    wire [SIZE - 1 : 0] Q_next, Q_reg;

    assign Q_next = {Q_reg [SIZE - 2 : 0], SI};

    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin: Stage
            D_ff FF (.clk(clk), .rstn(rstn), .D(Q_next[i]), .Q(Q_reg[i]));
        end
    endgenerate 
      
    assign SO = Q_reg [SIZE - 1];
endmodule
