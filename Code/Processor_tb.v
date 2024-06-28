module TB;
    reg clk;
    reg reset;
    reg [15 : 0] instruction;
    wire [511 : 0] A1;
    wire [511 : 0] A2;
    wire [511 : 0] A3;
    wire [511 : 0] A4;
    PROCESSOR processor (clk, reset, instruction, A1, A2, A3, A4);
    initial
        clk = 0;
    always
        #20 clk = ~clk;

    initial begin
        // reset <= 1;
        // #50
        // reset <= 0;
        // instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        // #500
        // instruction <= 16'b00_000_01_000000001; // load next 16 to A2
        // #500
        // instruction <= 16'b10_000_00000000000; // add
        // #500
        // instruction <= 16'b01_000_10_000000000; // store A3 to the first part of memory
        // #500
        // instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        // #500
        ///////////////////////////////////////////////////////////
        // reset <= 1;
        // #50
        // reset <= 0;
        // instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        // #500
        // instruction <= 16'b00_000_01_000000001; // load next 16 to A2
        // #500
        // instruction <= 16'b11_000_00000000000; // mul
        // #500
        // instruction <= 16'b01_000_10_000000000; // store A3 to the first part of memory
        // #500
        // instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        // #500
        //////////////////////////////////////////////////////////
        reset <= 1;
        #50
        reset <= 0;
        instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        #500
        instruction <= 16'b00_000_01_000100001; // load next 16 to A2
        #500
        instruction <= 16'b11_000_00000000000; // mul
        #500
        instruction <= 16'b10_000_00000000000; // add
        #500
        instruction <= 16'b01_000_11_000010000; // store A4
        #500        
        instruction <= 16'b01_000_10_000000000; // store A3
        #500        
        instruction <= 16'b11_000_10110011000; // mul
        #500
        instruction <= 16'b00_000_00_000000000; //load first 16 to A1
        #500
        instruction <= 16'b00_000_01_000000000; //load first 16 to A2
        #500
        $stop;
    end
    initial
        $monitor($time, ":\nA1 = %h\nA2 = %h\nA3 = %h\nA4 = %h\n",
                    A1, A2, A3, A4);
endmodule
