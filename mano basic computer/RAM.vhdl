library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity RAM is
generic (data_width : natural := 16;
addr_width : natural := 10);
port ( clk_in : in std_logic;
we : in std_logic;
addr_in : in std_logic_vector( addr_width - 1 downto 0);
addr_out : in std_logic_vector( addr_width - 1 downto 0);
data_in : in std_logic_vector( data_width - 1 downto 0);
data_out : out std_logic_vector( data_width - 1 downto 0)
);
end RAM;

architecture RAM_arch of RAM is

type mem_type is array (conv_integer(2** addr_width) downto 0) of std_logic_vector( data_width - 1 downto 0) ;
signal mem : mem_type:= (
        68 => "0000000001000101",
        84 => "0000000001010101",
        others => (others => '0')
    );

begin

mem_write : process (clk_in)
    begin
    if clk_in'event and clk_in = '1' then
        if (we = '1') then
            mem( conv_integer( addr_in)) <= data_in ;
        end if ;
    end if ;
end process mem_write ;

mem_read : process (clk_in)
    begin
    if clk_in'event and clk_in = '1' then
        data_out <= mem( conv_integer( addr_out)) ;
    end if ;
end process mem_read;

end RAM_arch;