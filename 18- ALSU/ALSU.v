module ALSU #(parameter BITS = 3, INPUT_PRIORITY = "A", FULL_ADDER = "ON") (
    input clk, rstn, cin, SI, sh_left, red_op_A, red_op_B, pass_A, pass_B,
    input [2 : 0] opcode,
    input [BITS - 1 : 0] A, B,
    output [(2 * BITS) - 1 : 0] out,
    output [15 : 0] leds
);
    // Internal Wires
    wire cin_reg, SI_reg, sh_left_reg, red_op_A_reg, red_op_B_reg, pass_A_reg, pass_B_reg;
    wire [BITS - 1 : 0] A_reg, B_reg;
    wire [2 : 0] opcode_reg;
    reg [(2 * BITS) - 1 : 0] out_next, out_reg;
    reg [15 : 0] leds_next, leds_reg;
    wire invalid, pass_A_c, pass_B_c, red_A_c, red_B_c;     // control signals
    
    // Input FFs
    D_ff #(.BITS(BITS)) A_FF (.clk(clk), .rstn(rstn), .D(A), .Q(A_reg));                        // A
    D_ff #(.BITS(BITS)) B_FF (.clk(clk), .rstn(rstn), .D(B), .Q(B_reg));                        // B
    D_ff #(.BITS(BITS)) opcode_FF (.clk(clk), .rstn(rstn), .D(opcode), .Q(opcode_reg));         // opcode
    D_ff #(.BITS(1)) cin_FF (.clk(clk), .rstn(rstn), .D(cin), .Q(cin_reg));                     // cin
    D_ff #(.BITS(1)) SI_FF (.clk(clk), .rstn(rstn), .D(SI), .Q(SI_reg));                        // SI
    D_ff #(.BITS(1)) sh_left_FF (.clk(clk), .rstn(rstn), .D(sh_left), .Q(sh_left_reg));         // sh_left
    D_ff #(.BITS(1)) red_op_A_FF (.clk(clk), .rstn(rstn), .D(red_op_A), .Q(red_op_A_reg));      // red_op_A
    D_ff #(.BITS(1)) red_op_B_FF (.clk(clk), .rstn(rstn), .D(red_op_B), .Q(red_op_B_reg));      // red_op_B
    D_ff #(.BITS(1)) pass_A_FF (.clk(clk), .rstn(rstn), .D(pass_A), .Q(pass_A_reg));            // pass_A
    D_ff #(.BITS(1)) pass_B_FF (.clk(clk), .rstn(rstn), .D(pass_B), .Q(pass_B_reg));            // pass_A

    // Control Signals
    assign invalid = ((opcode_reg[2] & opcode_reg[1]) || ((red_op_A_reg || red_op_B_reg) && (opcode_reg[2] | opcode_reg[1])));
    assign pass_A_c = (pass_A_reg && ((~pass_B_reg) || (INPUT_PRIORITY == "A")));
    assign pass_B_c = (pass_B_reg && ((~pass_A_reg) || (INPUT_PRIORITY == "B")));
    assign red_A_c = (red_op_A_reg && ((~red_op_B_reg) || (INPUT_PRIORITY == "A")));
    assign red_B_c = (red_op_B_reg && ((~red_op_A_reg) || (INPUT_PRIORITY == "B")));

    // OUT Next State 
    always @(*) begin
        if (invalid)
            out_next = 0;
        else if (pass_A_c)
            out_next = A_reg;
        else if (pass_B_c)
            out_next = B_reg;
        else
            case (opcode_reg)
                3'b000:                                                         // AND
                    if (red_A_c)
                        out_next = &A_reg;
                    else if (red_B_c)
                        out_next = &B_reg;
                    else
                        out_next = A_reg & B_reg;
                3'b001:                                                         // XOR         
                    if (red_A_c)
                        out_next = ^A_reg;
                    else if (red_B_c)
                        out_next = ^B_reg;
                    else
                        out_next = A_reg ^ B_reg;
                3'b010:                                                         // ADD
                    if (FULL_ADDER == "ON")
                        out_next = A_reg + B_reg + cin_reg;
                    else if (FULL_ADDER == "OFF")
                        out_next = A_reg + B_reg;
                    else
                        out_next = 0;
                3'b011:                                                         // MUL         
                    out_next = A_reg * B_reg;
                3'b100:                                                         // SHIFT         
                    if (sh_left_reg)
                        out_next = {out_reg [BITS - 2 : 0], SI};
                    else
                        out_next = {SI, out_reg [BITS - 1 : 1]};
                3'b101:                                                         // ROTATE         
                    if(sh_left_reg)
                        out_next = {out_reg [BITS - 2 : 0], out_reg [BITS - 1]};
                    else
                        out_next = {out_reg [0], out_reg [BITS - 1 : 1]};
                default:        out_next = 0;                                     // INVALID
            endcase
    end
    
    // LEDS Next State
    always @(*) begin
        if (invalid)
            leds_next = ~leds_reg;
        else
            leds_next = 0;
    end

    // Current State
    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            out_reg <= 0;
            leds_reg <= 0;
        end
        else begin    
            out_reg <= out_next;
            leds_reg <= leds_next;
        end
    end

    // output 
    assign out = out_reg;
    assign leds = leds_reg;        
endmodule
