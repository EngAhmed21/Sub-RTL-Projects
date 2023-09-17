module swapping #(parameter N = 3, BITS = 8)(
    input clk, rstn, swap, w_en,
    input [N - 1 : 0] A_addr, B_addr, w_addr, r_addr,
    input [BITS - 1 : 0] w_data,
    output [BITS - 1 : 0] r_data
);
    // Internal Signals    
    wire w;
    wire [1 : 0] sel;
    wire [N - 1 : 0] r_addr_mux, w_addr_mux;
    wire [BITS - 1 : 0] w_data_mux;
    wire w_en_reg;
    wire [BITS - 1 : 0] r_data_reg;

    // FSM
    fsm_controller control_unit(.swap(swap), .clk(clk), .rstn(rstn), .w(w), .sel(sel));
    
    // MUXs
    mux_4x1 #(.BITS(N)) read_addr(.in0(r_addr), .in1(A_addr), .in2(B_addr), .in3(3'b000), .sel(sel), .out(r_addr_mux));
    mux_4x1 #(.BITS(N)) write_addr(.in0(w_addr), .in1(3'b000), .in2(A_addr), .in3(B_addr), .sel(sel), .out(w_addr_mux));
    mux_2x1 #(.BITS(BITS)) write_data(.in0(w_data), .in1(r_data_reg), .sel(w), .out(w_data_mux));
    mux_2x1 #(.BITS(1)) write_enable(.in0(W_en), .in1(1'b1), .sel(w), .out(w_en_reg));
    
    // REG FILE
    
    reg_file #(.N(N), .BITS(BITS)) file(.w_en(w_en_reg), .clk(clk), .rstn(rstn), .w_address(w_addr_mux), .r_address(r_addr_mux), .w_data(w_data_mux), .r_data(r_data_reg));
    
    assign r_data = r_data_reg;
endmodule
