
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
    Port ( x,y : in  STD_LOGIC_VECTOR (5 downto 0);
           s : out  STD_LOGIC_VECTOR (5 downto 0);
           co : out  STD_LOGIC);
end adder;

architecture Behavioral of adder is

component FA is
    Port ( in1, in2, cin : in  STD_LOGIC;
           S, cout : out  STD_LOGIC);
end component;

signal k0, k1, k2, k3, k4, k5 : std_logic;

begin
	
	
	fa1 : FA port map (in1 => x(0), in2 => y(0), cin => '0', S => s(0), cout => k0);
	fa2 : FA port map (in1 => x(1), in2 => y(1), cin => k0, S => s(1), cout => k1);
	fa3 : FA port map (in1 => x(2), in2 => y(2), cin => k1, S => s(2), cout => k2);
	fa4 : FA port map (in1 => x(3), in2 => y(3), cin => k2, S => s(3), cout => k3);
	fa5 : FA port map (in1 => x(4), in2 => y(4), cin => k3, S => s(4), cout => k4);
	fa6 : FA port map (in1 => x(5), in2 => y(5), cin => k4, S => s(5), cout => k5);

	co <= k5;

end Behavioral;

