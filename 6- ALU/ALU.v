module ALU #(parameter BITS = 4) (
    input [BITS - 1 : 0] A, B,
    input [1 : 0] OP,
    output reg [BITS - 1 : 0] out
);
    localparam ADD = 2'b00;
    localparam SUB = 2'b01;
    localparam AND = 2'b10;
    localparam OR = 2'b11;

    always @(*) begin
        case (OP)
            ADD:        out = A + B;
            SUB:        out = A - B;
            AND:        out = A & B;
            OR:         out = A | B;
            default:    out = 0;
        endcase
    end
endmodule
