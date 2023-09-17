module D_ff (
    input clk, rstn, D,
    output Q
);
    reg Q_next, Q_reg;

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