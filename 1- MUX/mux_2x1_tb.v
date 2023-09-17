module mux_2x1_tb ();
    localparam BITS = 4;

    reg [BITS - 1 : 0] in0, in1;
    reg sel;
    wire [BITS - 1 : 0] out;

    mux_2x1 #(.BITS(BITS)) uut (.in0(in0), .in1(in1), .sel(sel), .out(out));

    initial begin
        repeat (10) begin
            {in0, in1, sel} = $random;
            #10 $display("in0 = %0h, in1 = %0h, sel = %0h, out = %0h", in0, in1, sel, out);
        end
        $stop;
    end
endmodule