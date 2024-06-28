module REGISTER_FILE (clk, reset, in1, in2, write_addr1, write_addr2, en1,
en2, read_addr, read_data, A1, A2, A3, A4);
    input wire clk;
    input wire reset;
    input wire [511 : 0] in1;
    input wire [511 : 0] in2;
    input wire [1 : 0] write_addr1;
    input wire [1 : 0] write_addr2;
    input wire en1;
    input wire en2;
    input wire [1 : 0] read_addr;
    output wire signed [511 : 0] read_data;
    output wire signed [511 : 0] A1;
    output wire signed [511 : 0] A2;
    output wire signed [511 : 0] A3;
    output wire signed [511 : 0] A4;
    reg signed [511 : 0] register_file [0 : 3];
    localparam zero = 512'b0;
    always @(negedge clk or posedge reset) begin
        if(reset) begin
            register_file[0] = zero;
            register_file[1] = zero;
            register_file[2] = zero;
            register_file[3] = zero;
        end else begin
            if (en1)
                register_file[write_addr1] <= (in1);
            if (en2)
                register_file[write_addr2] <= (in2);
        end
    end
    assign read_data = register_file[read_addr];
    assign A1 = register_file[0];
    assign A2 = register_file[1];
    assign A3 = register_file[2];
    assign A4 = register_file[3];
endmodule