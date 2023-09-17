module add_sub_tb ();
    localparam SIZE = 4;

    reg [SIZE - 1 : 0] A, B;
    reg sub;
    wire [SIZE - 1 : 0] S;
    wire Cout;

    add_sub uut (.A(A), .B(B), .sub(sub), .S(S), .Cout(Cout));

    initial begin
        repeat (10) begin
            {A, B, sub} = $random;
            #10 $display ("A = %0d, B = %0d, sub = %0d, S = %0d, Cout = %0d", A, B, sub, S, Cout);
        end
        $stop;
    end
endmodule