library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ROM is
generic (data_width : natural := 16;
addr_width : natural := 10);
port ( clk : in std_logic;
addr : in std_logic_vector( addr_width - 1 downto 0);
data : out std_logic_vector( data_width - 1 downto 0)
);
end ROM;

architecture ROM_arch of ROM is

type mem_type is array (conv_integer(2** addr_width) downto 0) of std_logic_vector( data_width - 1 downto 0) ;
signal mem : mem_type := (
        0 => "0000110001000101",  -- Load MEM(69)
        1 => "0000010001010101",  -- Add MEM(85)
        2 => "0000100000001100",  -- Store MEM(12)
        3 => "0001010000000000",  -- Increment AC
        4 => "0010010000000000",  -- Circular Right Shift
        5 => "0011000000000000", -- SZE
        6 => "0100000000001100",  -- Multiply MEM(12)
        7 => "1000000000000000",  -- SQR
        8 => "0000010000000000",  -- And MEM(0)
        9 => "0011010000000000", -- SZA
        10 => "0001100000000000",  -- Clear AC
        11 => "0001110000000000",  -- Clear E
        others => (others => '0')
    );

begin

mem_read : process (clk)
    begin
    if clk'event and clk = '1' then
        data <= mem( conv_integer( addr)) ;
    end if ;
end process mem_read;

end ROM_arch;