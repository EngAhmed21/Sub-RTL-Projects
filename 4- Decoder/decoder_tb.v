module decoder_tb ();
    reg en;
    reg [1 : 0] in;
    wire [3 : 0] out;

    decoder uut (.en(en), .in(in), .out(out));

    initial begin
        en = 0;
        repeat(3) begin
            in = $random;
            #10 $display ("en = %0b, in = %0b, out = %0b", en, in, out);
        end

        en = 1;
        repeat (10) begin
            in = $random;
            #10 $display ("en = %0b, in = %0b, out = %0b", en, in, out);
        end

        $stop;
    end
endmodule