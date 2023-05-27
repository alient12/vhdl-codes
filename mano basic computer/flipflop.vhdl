library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity flipflop is
port(
    d : in std_logic; -- input data
    clk ,rst, ld : in std_logic; -- clock and rest
    q : out std_logic);--output data
end flipflop;

architecture cct of flipflop is


begin
    process(rst, clk, ld)
    begin
        if (rst = '0') then --asynch reset
            q <= '0';
        elsif (clk'event and clk = '1' and ld = '1') then
            q <= d;
        end if;
    end process;
end cct;