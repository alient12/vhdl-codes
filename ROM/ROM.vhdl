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
signal mem : mem_type ;

begin

mem_read : process (clk)
    begin
    if clk'event and clk = '1' then
        data <= mem( conv_integer( addr)) ;
    end if ;
end process mem_read;

end ROM_arch;