library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity COUNT8 is 

 port(
		CLK	: in std_logic;
		RST: in std_logic;
		DOUT: out std_logic_vector(7 downto 0)
	);

end COUNT8;

architecture behavior of COUNT8 is

begin
  	-- notice the process statement and the variable COUNT
  	clk_proc:process(CLK, RST)
  	variable COUNT:unsigned(7 downto 0) := "10000000";
  	begin
		if RST = '1' then
			COUNT := "10000000";
		end if;
  		if (CLK'EVENT AND CLK = '1') then
  			COUNT := rotate_left(COUNT,1);
  		end if;
  		DOUT <= std_logic_vector(COUNT);
  	end process clk_proc;

end behavior;
