module parity_encoder_tb ();
    reg [3 : 0] in;
    wire [1 : 0] out;

    parity_encoder uut (.in(in), .out(out));

    initial begin
        repeat (10) begin
            in = $random;
            #10 $display ("in = %0b, out = %0h", in, out);
        end
        $stop;
    end
endmodule