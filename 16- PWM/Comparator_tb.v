module comparator_less_tb ();
    localparam BITS = 4;

    reg [BITS - 1 : 0] operand1;
    reg [BITS : 0] operand2;
    wire less;

    comparator_less #(.BITS(BITS)) uut (.operand1(operand1), .operand2(operand2), .less(less));

    initial begin
        repeat (10) begin
            {operand1, operand2} = $random;
            #10 $display ("operand1 = %0d, operand2 = %0d, less = %0d", operand1, operand2, less);
        end
        $stop;
    end
endmodule