library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity register10 is
port(
    d : in std_logic_vector (9 downto 0); -- input data
    clk ,rst, ld, inc : in std_logic; -- clock and rest
    q : out std_logic_vector (9 downto 0));--output data
end register10;

architecture cct of register10 is

signal q_sig: std_logic_vector(9 downto 0);

begin
    process(rst, clk, ld)
    begin
        if (rst = '0') then --asynch reset
            q <= (others=>'0');
            q_sig <= (others=>'0');
        end if;
        if (clk'event and clk = '1') then
            if ld = '1' then
                q <= d;
                q_sig <= d;
            elsif inc = '1' then
                q <= q_sig + 1;
            end if;
        end if;
    end process;
end cct;