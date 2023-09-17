module D_ff #(parameter BITS = 4) (
    input clk, rstn,
    input [BITS - 1 : 0] D,
    output [BITS - 1 : 0] Q
);
    reg [BITS - 1 : 0] Q_next, Q_reg;

    always @(*) begin
        Q_next = D;
    end
 
    always @(posedge clk, negedge rstn) begin
        if (!rstn) 
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end

    assign Q = Q_reg;
endmodule