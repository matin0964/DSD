library verilog;
use verilog.vl_types.all;
entity ArithmeticProcessor is
    port(
        in1             : in     vl_logic_vector(511 downto 0);
        in2             : in     vl_logic_vector(511 downto 0);
        operation       : in     vl_logic;
        \out\           : out    vl_logic_vector(1023 downto 0)
    );
end ArithmeticProcessor;
