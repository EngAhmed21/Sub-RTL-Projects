module add_sub #(parameter SIZE = 4) (
    input [SIZE - 1 : 0] A, B,
    input sub,
    output [SIZE - 1 : 0] S,
    output Cout
);
    wire [SIZE - 1 : 0] B_in, C_in, C_out, S_out;
      
    assign B_in = sub ? ~B : B;
    assign C_in = {C_out[SIZE - 2 : 0], sub};

    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin: Stage
            FA Block (.A(A[i]), .B(B_in[i]), .Cin(C_in[i]), .S(S_out[i]), .Cout(C_out[i]));
        end 
    endgenerate

    assign S = S_out;
    assign Cout = C_out [SIZE - 1];
endmodule
