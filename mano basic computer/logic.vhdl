library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logic is
	Port ( x,y: in STD_LOGIC_VECTOR (15 downto 0);
			S1 : in STD_LOGIC_VECTOR (2 downto 0);
			lgc : inout STD_LOGIC_VECTOR (15 downto 0)
			);
end logic;

architecture Behavioral of logic is

begin
	with S1 select	
		lgc <=  not(x)	 when "000" ,
				not(y)   when "001",
				x and y  when "010",
				x nand y when "011",
				x or y   when "100",
			    x nor y  when "101",
				x xor y  when "110",
				x xnor y when others; 
	
end Behavioral;

