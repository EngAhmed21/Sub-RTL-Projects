module detector (
    input clk, rstn, in,
    output out
);
    localparam S0 = 3'b000;    
    localparam S1 = 3'b001;    
    localparam S2 = 3'b010;    
    localparam S3 = 3'b011;    
    localparam S4 = 3'b100;
    localparam S5 = 3'b101;    

    reg [2 : 0] ns, cs;

    always @(*) begin
        case (cs)
            S0:         ns = in ? S1 : S2;
            S1:         ns = in ? S0 : S3;
            S2:         ns = in ? S1 : S4;
            S3:         ns = in ? S0 : S5;
            S4:         ns = in ? S5 : S4;
            S5:         ns = in ? S4 : S5;
            default:    ns = S0;
        endcase
    end

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            cs <= S0;
        else
            cs <= ns;
    end

    assign out = (cs == S5);
endmodule
