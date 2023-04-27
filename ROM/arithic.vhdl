library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.all;

entity arithic is
	Port ( x,y: in STD_LOGIC_VECTOR (7 downto 0);
			S1 : in STD_LOGIC_VECTOR (2 downto 0);
			cout: out STD_LOGIC;
			arthc : inout STD_LOGIC_VECTOR (7 downto 0)
			);
	
end arithic;

architecture Behavioral of arithic is

signal temp: STD_LOGIC_VECTOR (8 downto 0);

begin
	-- with S1 select
	-- arthc <= x * y		 when "000",
	-- 		 x + y 			 when "001",
	--       x - y  		 when "010",
	-- 		 x + '1' 		 when "011",
	--     	 shift_left(x)   when "100",
	-- 		 shift_right(x)  when "101",
	-- 	 	 rotate_left(x)  when "110",
	--       rotate_right(x) when others;
	process
	begin
	CASE S1 is
		when "000"=>
			arthc <= x * y;
		when "001"=>
			temp <= '0' & x + y;
			arthc<= temp(7 downto 0);
			cout <= temp(8);
		when "010"=>
			arthc <= x - y;
		when "011"=>
			arthc <= x + '1';
		when "100"=>
			arthc <= std_logic_vector(shift_left  (unsigned(x), conv_integer(y)));
		when "101"=>
			arthc <= std_logic_vector(shift_right (unsigned(x), conv_integer(y)));
		when "110"=>
			arthc <= std_logic_vector(rotate_left (unsigned(x), conv_integer(y)));
		when others=>
			arthc <= std_logic_vector(rotate_right(unsigned(x), conv_integer(y)));
	END CASE;
	end process;

end Behavioral;

