module timer #(parameter DELAY = 16) (
    input clk, rstn,
    output done
);
    localparam BITS = $clog2(DELAY);

    reg [BITS - 1 : 0] Q_next, Q_reg;

    always @(*) begin
        if (done)
            Q_next = 0;
        else
            Q_next = Q_reg + 1;
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end

    assign done = (Q_reg == (DELAY - 1));
endmodule