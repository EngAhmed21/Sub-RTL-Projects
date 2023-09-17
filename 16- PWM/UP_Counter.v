module UP_counter #(parameter BITS = 4) (
    input clk, rstn, en,
    output [BITS - 1 : 0] Q
);
    reg [BITS - 1 : 0] Q_next, Q_reg;
    
    always @(*) begin
        if (en)
            Q_next = Q_reg + 1;
        else
            Q_next = Q_reg;
       
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else
            Q_reg <= Q_next; 
    end

    assign Q = Q_reg;
endmodule