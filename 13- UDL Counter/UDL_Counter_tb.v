module UDL_Counter_tb ();
    localparam BITS = 4;

    reg clk, rstn, load, up;
    reg [BITS - 1 : 0] PI;
    wire [BITS - 1 : 0] Q;

    UDL_Counter #(.BITS(BITS)) uut (.clk(clk), .rstn(rstn), .load(load), .up(up), .PI(PI), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, Q = %0d", rstn, Q);

        @(negedge clk)  rstn = 1;
        repeat (30) begin
            {load, up, PI} = $random;
            @(negedge clk)  $display ("rstn = %0b, load = %0b, up = %0b, PI = %0d, Q = %0d", rstn, load, up, PI, Q);
        end
        $stop;
    end
endmodule