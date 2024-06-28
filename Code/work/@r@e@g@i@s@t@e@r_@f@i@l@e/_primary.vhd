library verilog;
use verilog.vl_types.all;
entity REGISTER_FILE is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        in1             : in     vl_logic_vector(511 downto 0);
        in2             : in     vl_logic_vector(511 downto 0);
        write_addr1     : in     vl_logic_vector(1 downto 0);
        write_addr2     : in     vl_logic_vector(1 downto 0);
        en1             : in     vl_logic;
        en2             : in     vl_logic;
        read_addr       : in     vl_logic_vector(1 downto 0);
        read_data       : out    vl_logic_vector(511 downto 0);
        A1              : out    vl_logic_vector(511 downto 0);
        A2              : out    vl_logic_vector(511 downto 0);
        A3              : out    vl_logic_vector(511 downto 0);
        A4              : out    vl_logic_vector(511 downto 0)
    );
end REGISTER_FILE;
