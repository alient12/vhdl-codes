library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MUX is
	Port ( A,B: inout STD_LOGIC_VECTOR (15 downto 0);
			S : in STD_LOGIC;
			Output : out STD_LOGIC_VECTOR (15 downto 0)
			);
end MUX;

architecture Behavioral of MUX is


begin

with S select
	Output <= A when '0' ,
		B when others;
end Behavioral;

