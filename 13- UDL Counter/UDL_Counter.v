module UDL_Counter #(parameter BITS = 4) (
    input clk, rstn, load, up,
    input [BITS - 1 : 0] PI,
    output [BITS - 1 : 0] Q
);
    reg [BITS - 1 : 0] Q_next, Q_reg;
    
    always @(*) begin
        if (load)
            Q_next = PI;
        else if (up)
            Q_next = Q_reg + 1;
        else
            Q_next = Q_reg - 1;
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else
            Q_reg <= Q_next; 
    end

    assign Q = Q_reg;
endmodule
