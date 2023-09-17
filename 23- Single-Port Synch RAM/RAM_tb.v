module RAM_tb ();
    localparam WIDTH = 4;
    localparam DEPTH = 16;
    localparam ADDR = 4;

    reg clk, rstn, WE, RE;
    reg [WIDTH - 1 : 0] WD;
    reg [ADDR - 1 : 0] addr;
    wire [WIDTH - 1 : 0] RD;

    RAM #(.WIDTH(WIDTH), .DEPTH(DEPTH), .ADDR(ADDR)) uut (.clk(clk), .rstn(rstn), .WE(WE), .RE(RE), .WD(WD), .addr(addr), .RD(RD));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;
        rstn = 0;
        
        @(negedge clk)  rstn = 1;

        WE = 1;
        RE = 1;
        repeat (30) begin
            {addr, WD} = $random;
            @(negedge clk);
        end

        WE = 0;
        repeat (30) begin
           addr = $random;
           @(negedge clk); 
        end
        
        $stop;
    end
endmodule