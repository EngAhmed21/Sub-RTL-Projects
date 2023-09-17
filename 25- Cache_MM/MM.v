module MM (
    input clk, rst,  enable_read_mm, enable_write_mm,
    input [15 : 0] data_in_mm,
    input [4 : 0] addr_mm,
    output reg [15 : 0] data_out_mm
);

    reg [15 : 0] main_memory [0 : 19];

    // Writing
    always @(posedge clk) begin
        if (enable_write_mm)
            main_memory[addr_mm] <= data_in_mm;
    end

    // Reading
    always @(posedge clk) begin
        if (rst)
            data_out_mm <= 0;
        else if (enable_read_mm)
            data_out_mm <= main_memory[addr_mm];
    end
endmodule
