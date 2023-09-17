module reg_file #(parameter N = 7, BITS = 8)(
    input w_en, clk, rstn,
    input [N - 1 : 0] w_address, r_address,
    input [BITS - 1 : 0] w_data, 
    output [BITS - 1 : 0] r_data
    );
   
    reg [BITS - 1 : 0] memory [0 : 2**N - 1];
    
    integer i;
     always @(posedge clk, negedge rstn) begin
        if (!rstn)
            for(i = 0; i < 2**N; i = i + 1)
                memory [i] <= 0;
        else if (w_en)              
            memory [w_address] <= w_data; 
     end
     
     assign r_data = memory [r_address];
endmodule
