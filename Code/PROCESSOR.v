module PROCESSOR (clk, reset, instruction, A1, A2, A3, A4);
    input wire clk;
    input wire reset;
    input wire [15 : 0] instruction;
    output wire signed [511 : 0] A1;
    output wire signed [511 : 0] A2;
    output wire signed [511 : 0] A3;
    output wire signed [511 : 0] A4;
    integer i, j;

    reg signed [511 : 0] memory_in;
    reg [8 : 0] memory_addr;
    reg memory_write_en;
    wire signed [511 : 0] memory_out;
    Memory memory (.clk(clk), .reset(reset), .in(memory_in), .address(memory_addr),
    .en(memory_write_en), .out_data(memory_out));

    reg [511 : 0] ap_in1;
    reg [511 : 0] ap_in2;
    reg operation;
    wire signed [1023 : 0] ap_out;

    ArithmeticProcessor ap (.in1(ap_in1), .in2(ap_in2), .operation(operation), .out(ap_out));

    reg [511 : 0] RF_in_1, RF_in_2;
    reg [1 : 0] RF_write_address_1, RF_write_address_2, RF_read_address;
    reg RF_write_en1, RF_write_en2;
    wire signed [511 : 0] RF_out, RF_A1, RF_A2, RF_A3, RF_A4;
    
    REGISTER_FILE register_file (.clk(clk), .reset(reset), .in1(RF_in_1), .in2(RF_in_2), 
    .write_addr1(RF_write_address_1),.write_addr2(RF_write_address_2), .en1(RF_write_en1),
    .en2(RF_write_en2),.read_addr(RF_read_address), .read_data(RF_out), .A1(RF_A1),
    .A2(RF_A2), .A3(RF_A3), .A4(RF_A4));


    always @(posedge clk) begin
        #10
        if(instruction[15] == 0) begin
                memory_addr <= instruction[8 : 0];
                RF_write_en2 <= 0;
            if(instruction[14] == 0) begin
                memory_write_en <= 0;
                RF_write_en1 <= 1;
                RF_write_address_1 <= instruction[10 : 9];
                #10
                RF_in_1 <= memory_out;
            end
            else if(instruction[14] == 1)begin
                memory_write_en <= 1;
                RF_write_en1 <= 0;
                RF_read_address <= instruction[10 : 9];
                #10
                memory_in <= RF_out;
            end
        end
        else if (instruction[15] == 1) begin
            memory_write_en <= 0;
            RF_write_en1 <= 1;
            RF_write_en2 <= 1;
            RF_write_address_1 <= 2'b10;
            RF_write_address_2 <= 2'b11;
            ap_in1 <= RF_A1;
            ap_in2 <= RF_A2;
            if(instruction[14] == 0) begin
                operation = 1'b0;
                #10; 
            end
            else if(instruction[14] == 1)begin
                operation = 1'b1;
                #10;
            end
            for(i = 0; i < 16; i = i + 1) begin
                    for(j  = 0; j < 32; j = j + 1) begin
                    RF_in_1[32 * i + j] <= ap_out[64 * i + j];
                    RF_in_2[32 * i + j] <= ap_out[64 * i + 32 + j];
                    end
                end
        end
    end
    assign A1 = RF_A1;
    assign A2 = RF_A2;
    assign A3 = RF_A3;
    assign A4 = RF_A4;
endmodule