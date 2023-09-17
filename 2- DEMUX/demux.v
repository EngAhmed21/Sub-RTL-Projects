module demux_1x4 #(parameter BITS = 4) (
    input [BITS - 1 : 0] in,
    input [1 : 0] sel,
    output [BITS - 1 : 0] out0, out1, out2, out3
);
    assign out0 = (sel == 0) ? in : 0;
    assign out1 = (sel == 1) ? in : 0;
    assign out2 = (sel == 2) ? in : 0;
    assign out3 = (sel == 3) ? in : 0;
endmodule
