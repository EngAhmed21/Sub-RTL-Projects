module reg_file #(parameter BITS = 16, DEPTH = 16, ADDR = 4) (
    input clk, rstn, WE, RE1, RE2,
    input [BITS - 1 : 0] WD,
    input [ADDR - 1 : 0] WA, RA1, RA2,
    output reg [BITS - 1 : 0] RD1, RD2
);
    reg [BITS - 1 : 0] file [0 : DEPTH - 1];
    
    // Write
    integer i;
    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            for (i = 0; i < DEPTH; i = i + 1)
                file [i] <= 0;
        else if (WE)
            file[WA] <= WD;
    end

    // Read
    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            RD1 <= 0;
            RD2 <= 0;
        end
        else begin
            if (RE1)
                RD1 <= file[RA1];
            if (RE2)
                RD2 <= file[RA2];
        end
    end
endmodule
