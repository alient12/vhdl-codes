library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithic is
	Port ( x,y: in STD_LOGIC_VECTOR (7 downto 0);
			cin : in STD_LOGIC ;
			S1 : in STD_LOGIC_VECTOR (2 downto 0);
			arthc : inout STD_LOGIC_VECTOR (7 downto 0)
			);
	
end arithic;

architecture Behavioral of arithic is

begin
	with S1 select
	arthc <= x	when "000" ,
			   x + '1' when "001",
	         x - '1'  when "010",
			   y when "011",
	    	   y + '1'  when "100",
			   y - '1'  when "101",
		 		x + y when "110",
	         x + y + cin when others; 
end Behavioral;

