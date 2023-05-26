library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity register16 is
port(
    d : in std_logic_vector (15 downto 0);
    clk ,rst, ld, inc : in std_logic;
    q : out std_logic_vector (15 downto 0));
end register16;

architecture cct of register16 is

signal q_sig: std_logic_vector(15 downto 0);

begin
    process(rst, clk)
    begin
        if (rst = '0') then --asynch reset
            q <= (others=>'0');
            q_sig <= (others=>'0');
        elsif (clk'event and clk = '1' and ld = '1') then
            q <= d;
            q_sig <= d;
        elsif (clk'event and clk = '1' and inc = '1') then
            q <= q_sig + 1;
        end if;
    end process;
end cct;