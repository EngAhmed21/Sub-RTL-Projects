module swapping_tb();
    localparam N = 3;
    localparam BITS = 8;
    
    reg clk, rstn, swap, w_en;
    reg [N - 1 : 0] A_addr, B_addr, w_addr, r_addr;
    reg [BITS - 1 : 0] w_data;
    wire [BITS - 1 : 0] r_data;
    
    swapping #(.N(N), .BITS(BITS)) uut(.swap(swap), .w_en(w_en), .clk(clk), .rstn(rstn), .A_addr(A_addr), .B_addr(B_addr),
    .w_addr(w_addr), .r_addr(r_addr), .w_data(w_data), .r_data(r_data));
    
    localparam T = 10;
    always
        #(T / 2) clk = ~clk;
        
    integer i;
    initial begin
        clk = 1'b1;
        rstn = 1'b0;
        w_en = 1'b0;
        swap = 1'b0;
        A_addr = 3;
        B_addr = 4;
        w_addr = 0;
        r_addr = 0;
        w_data = 0;
        
        #2 rstn = 1'b1;
        w_en = 1'b0;
        for (i = 0; i < 5; i = i + 1)
            @(negedge clk) {w_addr, r_addr, w_data} = $random;
            
        w_en = 1'b1;
        for (i = 0; i < 30; i = i + 1)
            @(negedge clk) {w_addr, r_addr, w_data} = $random;
        
        for (i = 0; i < 30; i = i +1)
            @(negedge clk) {swap, w_en, w_addr, r_addr, w_data} = $random;  
        $stop;
    end
endmodule