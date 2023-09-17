module FA_tb ();
    reg A, B, Cin;
    wire S, Cout;

    FA uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin
        repeat (10) begin
            {A, B, Cin} = $random;
            #10 $display ("A = %0b, B = %0b, Cin = %0b, S = %0b, Cout = %0b", A, B, Cin, S, Cout);
        end
        $stop;
    end
endmodule