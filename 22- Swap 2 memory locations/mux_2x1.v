module mux_2x1 #(parameter BITS = 4) (
    input [BITS - 1 : 0] in0, in1,
    input sel,
    output [BITS - 1 : 0] out
);
   assign out = sel ? in1 : in0;
endmodule