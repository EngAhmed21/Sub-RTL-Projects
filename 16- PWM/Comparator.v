module comparator_less #(parameter BITS = 4) (
    input [BITS - 1 : 0] operand1,
    input [BITS : 0] operand2,
    output less
);
    assign less = (operand1 < operand2);
endmodule