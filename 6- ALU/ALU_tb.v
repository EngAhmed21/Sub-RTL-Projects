module ALU_tb ();
    localparam BITS = 4;

    reg [BITS - 1 : 0] A, B;
    reg [1 : 0] OP;
    wire [BITS - 1 : 0] out;

    ALU uut (.A(A), .B(B), .OP(OP), .out(out));

    initial begin
        repeat (10) begin
            {A, B, OP} = $random;
            #10 $display ("A = %0h, B = %0h, OP = %0h, out = %0h", A, B, OP, out);
        end
        $stop;
    end
endmodule