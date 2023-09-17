module controller (
    input clk, rst, enable_write, enable_read,
    input [4 : 0] addr_mm,
    input [15 : 0] data_in,
    output [15 : 0] data_out
);
    // internal signals  
    reg enable_read_cache, enable_write_cache;
    wire [15 : 0] data_out_mm;
    wire [1 : 0] addr_cache;

    // Adresses
    assign addr_cache = addr_mm % 4;

    // Enables
    always @(posedge clk) begin
        if (rst || (!enable_read))
            enable_write_cache <= 0;
        else if (enable_read)
            enable_write_cache <= ~enable_write_cache;
    end

    always @(posedge clk) begin
        if (rst || (!enable_read))
            enable_read_cache <= 0;
        else if (enable_write_cache)
            enable_read_cache <= ~enable_read_cache;
    end

    // Main Memory Instantiation
    MM main (.clk(clk), .rst(rst), .enable_read_mm(enable_read), .enable_write_mm(enable_write),
    .data_in_mm(data_in), .addr_mm(addr_mm), .data_out_mm(data_out_mm));

    // Cache Instantiation
    cache C (.clk(clk), .rst(rst), .enable_read_cache(enable_read_cache), .enable_write_cache(enable_write_cache),
    .data_in_cache(data_out_mm), .addr_cache(addr_cache), .data_out_cache(data_out));
endmodule