module DSP #(parameter OPERATION = "ADD") (
    input clk, rstn,
    input [17 : 0] A, B, D,
    input [47 : 0] C,
    output [47 : 0] P
);
    wire [17 : 0] A_reg, A_reg_2, B_reg, D_reg, op_1_next, op_1_reg;
    wire [47 : 0] C_reg, op_2_next, op_2_reg, P_next, P_reg;

    // Stage 1
    D_ff #(.BITS(18)) A_FF (.clk(clk), .rstn(rstn), .D(A), .Q(A_reg));
    D_ff #(.BITS(18)) B_FF (.clk(clk), .rstn(rstn), .D(B), .Q(B_reg));
    D_ff #(.BITS(18)) D_FF (.clk(clk), .rstn(rstn), .D(D), .Q(D_reg));
    D_ff #(.BITS(48)) C_FF (.clk(clk), .rstn(rstn), .D(C), .Q(C_reg));

    // Stage 2
    assign op_1_next = (OPERATION == "ADD") ? (D_reg + B_reg) : (OPERATION == "SUB") ? (D_reg - B_reg) : 0;
    D_ff #(.BITS(18)) OP_1_FF (.clk(clk), .rstn(rstn), .D(op_1_next), .Q(op_1_reg));
    D_ff #(.BITS(18)) A_FF_2 (.clk(clk), .rstn(rstn), .D(A_reg), .Q(A_reg_2));

    // Stage 3
    assign op_2_next = op_1_reg * A_reg_2;
    D_ff #(.BITS(48)) OP_2_FF (.clk(clk), .rstn(rstn), .D(op_2_next), .Q(op_2_reg));

    // Stage 4
    assign P_next = (OPERATION == "ADD") ? (op_2_reg + C_reg) : (OPERATION == "SUB") ? (op_2_reg - C_reg) : 0;
    D_ff #(.BITS(48)) P_FF (.clk(clk), .rstn(rstn), .D(P_next), .Q(P_reg));

    // Output
    assign P = P_reg;
endmodule
