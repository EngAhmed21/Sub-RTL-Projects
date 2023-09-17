module mux_4x1_tb ();
    localparam BITS = 4;

    reg [BITS - 1 : 0] in0, in1, in2, in3;
    reg [1 : 0] sel;
    wire [BITS - 1 : 0] out;

    mux_4x1 #(.BITS(BITS)) uut (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .sel(sel), .out(out));

    initial begin
        repeat (10) begin
            {in0, in1, in2, in3, sel} = $random;
            #10 $display("in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h, sel = %0h, out = %0h", in0, in1, in2, in3, sel, out);
        end
        $stop;
    end
endmodule