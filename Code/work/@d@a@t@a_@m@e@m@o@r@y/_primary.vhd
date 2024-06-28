library verilog;
use verilog.vl_types.all;
entity DATA_MEMORY is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        input_data      : in     vl_logic_vector(511 downto 0);
        data_address    : in     vl_logic_vector(8 downto 0);
        write_enable    : in     vl_logic;
        output_data     : out    vl_logic_vector(511 downto 0)
    );
end DATA_MEMORY;
