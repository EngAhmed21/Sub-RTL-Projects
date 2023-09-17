module shift_reg #(parameter SIZE = 4) (
    input clk, rstn, SI,
    input [1 : 0] S,
    input [SIZE - 1 : 0] PI,
    output [SIZE - 1 : 0] out
);
    localparam NO_CHANGE        = 2'b00;
    localparam SHIFT_RIGHT      = 2'b01;
    localparam SHIFT_LEFT       = 2'b10;
    localparam PARALLEL_LOAD    = 2'b11;

    reg [SIZE - 1 : 0] Q_reg, Q_next;

    always @(*) begin
        case (S)
            NO_CHANGE:          Q_next = Q_reg;                             
            SHIFT_RIGHT:        Q_next = {SI, Q_reg [SIZE - 1 : 1]};        
            SHIFT_LEFT:         Q_next = {Q_reg [SIZE - 2 : 0], SI};        
            PARALLEL_LOAD:      Q_next = PI;                                
            default:            Q_next = 0;
        endcase
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end

    assign out = Q_reg;
endmodule
