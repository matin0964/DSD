library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        input_data_1    : in     vl_logic_vector(511 downto 0);
        input_data_2    : in     vl_logic_vector(511 downto 0);
        ALUOp           : in     vl_logic;
        output_data     : out    vl_logic_vector(1023 downto 0)
    );
end ALU;
