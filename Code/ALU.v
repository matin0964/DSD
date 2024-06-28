module ArithmeticProcessor (in1, in2, operation, out);
    input wire [511:0] in1, in2;
    input wire operation;
    output wire signed[1023:0] out;
    reg [1023 : 0] ans;
    reg [63:0] tmp1 = 64'b0,tmp2=64'b0;
    reg [63:0] tmp = 64'b0;
    integer i,j;
    always @(*) begin
        if(operation == 1)begin
            for (i = 0; i < 16; i = i + 1) begin
                for(j = 0; j < 32; j = j + 1) begin
                    tmp1[j] = in1[i*32+j];
                    tmp2[j] = in2[i*32+j];
                end
                for(j = 32; j < 64; j = j + 1) begin
                    tmp1[j] = tmp1[31];
                    tmp2[j] = tmp2[31];
                end
                tmp = $signed (tmp1) * $signed (tmp2);
                for (j = 0; j < 64; j = j + 1) begin
                    ans[64*i + j] = tmp[j];
                end
            end
        end
        else if (operation == 0)begin
            for (i = 0; i < 16; i = i + 1) begin
                for(j = 0; j < 32; j = j + 1) begin
                    tmp1[j] = in1[i*32+j];
                    tmp2[j] = in2[i*32+j];
                end
                for(j = 32; j < 64; j = j + 1) begin
                    tmp1[j] = tmp1[31];
                    tmp2[j] = tmp2[31];
                end
                tmp = $signed (tmp1) + $signed (tmp2);
                for (j = 0; j < 64; j = j + 1) begin
                    ans[64*i + j] = tmp[j];
                end
            end
        end
    end
    assign out = ans;
endmodule