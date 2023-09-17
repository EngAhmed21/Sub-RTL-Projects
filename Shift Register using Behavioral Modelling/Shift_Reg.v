module shift_reg #(parameter SIZE = 4) (
    input clk, rstn, SI,
    output SO
);
    reg [SIZE - 1 : 0] Q_next, Q_reg;

    always @(*) begin
        Q_next = {Q_reg [SIZE - 2 : 0], SI};
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end

    assign SO = Q_reg [SIZE - 1];
endmodule
