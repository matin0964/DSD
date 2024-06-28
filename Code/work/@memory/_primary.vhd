library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(511 downto 0);
        address         : in     vl_logic_vector(8 downto 0);
        en              : in     vl_logic;
        out_data        : out    vl_logic_vector(511 downto 0)
    );
end Memory;
