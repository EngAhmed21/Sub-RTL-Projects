module T_ff (
    input clk, rstn, T,
    output Q
);
    localparam C2Q_DELAY = 2;   // For Simulation only

    reg Q_next, Q_reg;
       
    always @(*) begin
        if (T)  
            Q_next = ~Q_reg;
        else
            Q_next = Q_reg;
    end
 
    always @(posedge clk, negedge rstn) begin
        if (!rstn) 
            Q_reg <= 0;
        else 
            #(C2Q_DELAY) Q_reg <= Q_next;
    end

    assign Q = Q_reg;
endmodule 
