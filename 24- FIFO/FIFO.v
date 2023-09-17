module FIFO #(parameter FIFO_WIDTH = 16, FIFO_DEPTH = 512)(
    input clk, rst, wen_a, ren_b,
    input [FIFO_WIDTH - 1 : 0] din_a,
    output empty, full,
    output reg [FIFO_WIDTH - 1 : 0] dout_b
);
    localparam BITS = $clog2(FIFO_DEPTH);
    
    reg [FIFO_WIDTH - 1 : 0] mem [0 : FIFO_DEPTH - 1];
    reg [BITS : 0] wr_ptr, rd_ptr;
    
    // Writing
    always @(posedge clk) begin
        if (rst) 
            wr_ptr <= 0;
        else if (wen_a && (!full)) begin
            mem [wr_ptr [BITS - 1 : 0]] <= din_a;
            wr_ptr <= wr_ptr + 1;
        end
    end

    // Reading
    always @(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            dout_b <= 0;
        end
        else if (ren_b && (!empty)) begin
            dout_b <= mem [rd_ptr [BITS - 1 : 0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

    // Flags
    assign full = ((wr_ptr [BITS - 1 : 0] == rd_ptr [BITS - 1 : 0]) && (wr_ptr[BITS] != rd_ptr[BITS]));
    assign empty = (rd_ptr == wr_ptr);
endmodule
