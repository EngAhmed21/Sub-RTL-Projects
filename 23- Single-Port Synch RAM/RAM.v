module RAM #(parameter WIDTH = 8, DEPTH = 256, ADDR = 8) (
    input clk, rstn, WE, RE,
    input [WIDTH - 1 : 0] WD,
    input [ADDR - 1 : 0] addr,
    output reg [WIDTH - 1 : 0] RD
);
    reg [WIDTH - 1 : 0] mem [0 : DEPTH - 1];

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            RD <= 0;
        else if (WE)
            mem[addr] <= WD;
        else if (RE)
            RD <= mem[addr];
    end  
endmodule
