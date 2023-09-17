module HA_tb ();
    reg A, B;
    wire S, C;

    HA uut (.A(A), .B(B), .S(S), .C(C));

    initial begin
        repeat (10) begin
            {A, B} = $random;
            #10 $display ("A = %0b, B = %0b, S = %0b, C = %0b", A, B, S, C);
        end
        $stop;
    end
endmodule