module Memory(clk, reset, in, address, en, out_data);
    input wire clk;
    input wire reset;
    input wire signed [511 : 0] in;
    input wire [8 : 0] address;
    input wire en;
    output wire signed [511 : 0] out_data;
    reg signed [31 : 0] memory [0 : 511];
    reg signed [511 : 0] out;
    integer i, j; 
    reg signed [31:0]tmp;
    always @(negedge clk or posedge reset) begin
            if (reset) begin
            $readmemh("memory_init.hex", memory);
        end
        else begin
            if (en) begin
                for (i = 0; i < 16; i = i + 1) begin
                    for (j = 0; j < 32; j = j + 1) begin
                        memory[(i + address) % 512][j] <= in[32 * i + j];
                    end
                end
            end
        end
    end
    always @(clk or reset or in or address or en) begin
        for (j = 0; j < 16; j = j + 1) begin
            tmp = memory[(j + address) % 512];
            for (i = 0; i < 32; i = i + 1) begin
                out[32 * j + i] <= tmp[i];
            end
        end 
    end
    assign out_data = out;
endmodule