module asynch_counter #(parameter SIZE = 4) (
    input clk, rstn,
    output [SIZE - 1 : 0] Q
);
    wire [SIZE - 1 : 0] Q_reg, clk_reg;

    assign clk_reg = {(~Q_reg [SIZE - 2 : 0]), clk};

    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin: Stage
            T_ff FF (.clk(clk_reg[i]), .rstn(rstn), .T(1), .Q(Q_reg [i]));
        end 
    endgenerate 

    assign Q = Q_reg;
endmodule
