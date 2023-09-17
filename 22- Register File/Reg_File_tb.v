module reg_file_tb ();
    localparam BITS = 4;
    localparam DEPTH = 16;
    localparam ADDR = 4;

    reg clk, rstn, WE, RE1, RE2;
    reg [BITS - 1 : 0] WD;
    reg [ADDR - 1 : 0] WA, RA1, RA2;
    wire [BITS - 1 : 0] RD1, RD2;

    reg_file #(.BITS(BITS), .DEPTH(DEPTH), .ADDR(ADDR)) uut (.clk(clk), .rstn(rstn), .WE(WE), .RE1(RE1), .RE2(RE2),
    .WD(WD), .WA(WA), .RA1(RA1), .RA2(RA2), .RD1(RD1), .RD2(RD2));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;
        rstn = 0;
        
        @(negedge clk)  rstn = 1;

        WE = 1;
        RE1 = 0;
        RE2 = 0;      
        repeat (30) begin
            {WA, WD} = $random;
            @(negedge clk);
        end

        RE1 = 1;
        RE2 = 1;
        repeat (30) begin
           {RA1, RA2} = $random;
           @(negedge clk); 
        end
        
        $stop;
    end
endmodule