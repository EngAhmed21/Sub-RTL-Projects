module cache (
    input clk, rst, enable_read_cache, enable_write_cache,
    input [15 : 0] data_in_cache,
    input [1 : 0] addr_cache,
    output reg [15 : 0] data_out_cache
);

    reg [15 : 0] cache_memory [0 : 3];

    // Writing
    always @(posedge clk) begin
        if (enable_write_cache)
            cache_memory[addr_cache] <= data_in_cache;
    end

    // Reading
    always @(posedge clk) begin
        if (rst)
            data_out_cache <= 0;
        else if (enable_read_cache)
            data_out_cache <= cache_memory[addr_cache];
    end
endmodule