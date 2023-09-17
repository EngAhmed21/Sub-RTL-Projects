module UP_counter_tb ();
    localparam BITS = 4;

    reg clk, rstn,en;
    wire [BITS - 1 : 0] Q;

    UP_counter #(.BITS(BITS)) uut (.clk(clk), .rstn(rstn), .en(en), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;  
        rstn = 0;
        #1 $display ("rstn = %0b, Q = %0d", rstn, Q);

        @(negedge clk)  rstn = 1; 
        en = 0;
        repeat (3) begin
            @(negedge clk)  $display ("rstn = %0b, en = %0d, Q = %0d", rstn, en, Q);
        end

        en = 1;
        repeat (30) begin
            @(negedge clk)  $display ("rstn = %0b, en = %0d, Q = %0d", rstn, en, Q);
        end
        $stop;
    end
endmodule