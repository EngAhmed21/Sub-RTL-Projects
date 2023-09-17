module FA (
    input A, B, Cin,
    output S, Cout
);
    wire S1, S2, C1, C2;
       
    HA HA1 (.A(A), .B(B), .S(S1), .C(C1));
    HA HA2 (.A(S1), .B(Cin), .S(S2), .C(C2));

    assign S = S2;
    assign Cout = C1 | C2;
endmodule