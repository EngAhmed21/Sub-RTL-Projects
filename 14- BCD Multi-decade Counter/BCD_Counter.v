module BCD_counter (
    input clk, rstn, en,
    output [3 : 0] Q,
    output done
);
    reg [3 : 0] Q_next, Q_reg;
    
    always @(*) begin
        if (done)
            Q_next = 0;
        else
            Q_next = Q_reg + 1;
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else if (en)
            Q_reg <= Q_next; 
    end

    assign done = (Q_reg == 9);
    assign Q = Q_reg;
endmodule
