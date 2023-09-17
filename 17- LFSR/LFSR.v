module LFSR (
    input clk, rstn,
    output [3 : 0] Q
);
    reg [3 : 0] Q_next, Q_reg;

    always @(*) begin
        Q_next[0] = Q_reg [3];
        Q_next[1] = Q_reg[0] ^ Q_reg[3];
        Q_next [3 : 2] = Q_reg [2 : 1];
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 4'b0001;
        else
            Q_reg <= Q_next;
    end

    assign Q = Q_reg;
endmodule
