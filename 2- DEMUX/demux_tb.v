module demux_1x4_tb ();
    localparam BITS = 4;

    reg [BITS - 1 : 0] in;
    reg [1 : 0] sel;
    wire [BITS - 1 : 0] out0, out1, out2, out3;

    demux_1x4 #(.BITS(BITS)) uut (.in(in), .sel(sel), .out0(out0), .out1(out1), .out2(out2), .out3(out3));

    initial begin
        repeat (10) begin
            {in, sel} = $random;
            #10 $display ("in = %0h, sel = %0h, out0 = %0h, out1 = %0h, out2 = %0h, out3 = %0h", in, sel, out0, out1, out2, out3);
        end

        $stop;
    end
endmodule