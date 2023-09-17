module fsm_controller(
    input swap, clk, rstn,
    output w,
    output [1 : 0] sel
    );
    
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    localparam s3 = 3;
    
    reg [1 : 0] curr_state, next_state;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            curr_state <= s0;
        else
            curr_state <= next_state;
    end
    
    always @(*) begin
        case (curr_state)
            s0:         next_state = swap ? s1 : s0;         
            s1:         next_state = s2;
            s2:         next_state = s3;
            s3:         next_state = s0;
            default:    next_state = curr_state;
        endcase
    end
    
    assign sel = curr_state;
    assign w = (curr_state != s0);
endmodule