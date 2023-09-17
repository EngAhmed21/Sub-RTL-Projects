module mux_4x1 #(parameter BITS = 4) (
    input [BITS - 1 : 0] in0, in1, in2, in3,
    input [1 : 0] sel,
    output [BITS - 1 : 0] out
);
    wire [BITS - 1 : 0] mux1_out, mux2_out, mux3_out;

    mux_2x1 #(.BITS(BITS)) mux1 (.in0(in0), .in1(in1), .sel(sel[0]), .out(mux1_out));
    mux_2x1 #(.BITS(BITS)) mux2 (.in0(in2), .in1(in3), .sel(sel[0]), .out(mux2_out));
    mux_2x1 #(.BITS(BITS)) mux3 (.in0(mux1_out), .in1(mux2_out), .sel(sel[1]), .out(mux3_out));

    assign out = mux3_out;
endmodule