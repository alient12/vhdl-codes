
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple is
    Port ( a,b : in  STD_LOGIC_VECTOR (5 downto 0);
           p : out  STD_LOGIC_VECTOR (11 downto 0));
end simple;

architecture Behavioral of simple is

component FA is
    Port ( in1, in2, cin : in  STD_LOGIC;
           S, cout : out  STD_LOGIC);
end component;

component adder is
    Port ( x,y : in  STD_LOGIC_VECTOR (5 downto 0);
           s : out  STD_LOGIC_VECTOR (5 downto 0);
           co : out  STD_LOGIC);
end component;

signal d : STD_LOGIC_VECTOR (58 downto 0);

begin

-------------- adder 1 ---------------

p(0) <= a(0) and b(0);
d(0) <= a(1) and b(0);
d(1) <= a(2) and b(0);
d(2) <= a(3) and b(0);
d(3) <= a(4) and b(0);
d(4) <= a(5) and b(0);
d(5) <= a(0) and b(1);
d(6) <= a(1) and b(1);
d(7) <= a(2) and b(1);
d(8) <= a(3) and b(1);
d(9) <= a(4) and b(1);
d(10) <= a(5) and b(1);

adder1 : adder port map (x(0) => d(0),x(1) => d(1),x(2) => d(2),x(3) => d(3),x(4) => d(4),x(5) => '0',
								 y(0) => d(5),y(1) => d(6),y(2) => d(7),y(3) => d(8),y(4) => d(9),y(5) => d(10),
								 s(0) => p(1),s(1) => d(11),s(2) => d(12),s(3) => d(13),s(4) => d(14),s(5) => d(15), co => d(16));
								 
-------------- adder 2 ---------------
								 
d(17) <= a(0) and b(2);
d(18) <= a(1) and b(2);
d(19) <= a(2) and b(2);
d(20) <= a(3) and b(2);
d(21) <= a(4) and b(2);
d(22) <= a(5) and b(2);

adder2 : adder port map (x(0) => d(11),x(1) => d(12),x(2) => d(13),x(3) => d(14),x(4) => d(15),x(5) => d(16),
								 y(0) => d(17),y(1) => d(18),y(2) => d(19),y(3) => d(20),y(4) => d(21),y(5) => d(22),
								 s(0) => p(2),s(1) => d(23),s(2) => d(24),s(3) => d(25),s(4) => d(26),s(5) => d(27), co => d(28));
								 
-------------- adder 3 ---------------

d(29) <= a(0) and b(3);
d(30) <= a(1) and b(3);
d(31) <= a(2) and b(3);
d(32) <= a(3) and b(3);
d(33) <= a(4) and b(3);
d(34) <= a(5) and b(3);

adder3 : adder port map (x(0) => d(23),x(1) => d(24),x(2) => d(25),x(3) => d(26),x(4) => d(27),x(5) => d(28),
								 y(0) => d(29),y(1) => d(30),y(2) => d(31),y(3) => d(32),y(4) => d(33),y(5) => d(34),
								 s(0) => p(3),s(1) => d(35),s(2) => d(36),s(3) => d(37),s(4) => d(38),s(5) => d(39), co => d(40));
								 
-------------- adder 4 ---------------
								 
d(41) <= a(0) and b(4);
d(42) <= a(1) and b(4);
d(43) <= a(2) and b(4);
d(44) <= a(3) and b(4);
d(45) <= a(4) and b(4);
d(46) <= a(5) and b(4);

adder4 : adder port map (x(0) => d(35),x(1) => d(36),x(2) => d(37),x(3) => d(38),x(4) => d(39),x(5) => d(40),
								 y(0) => d(41),y(1) => d(42),y(2) => d(43),y(3) => d(44),y(4) => d(45),y(5) => d(46),
								 s(0) => p(4),s(1) => d(47),s(2) => d(48),s(3) => d(49),s(4) => d(50),s(5) => d(51), co => d(52));
								 
-------------- adder 5 ---------------

d(53) <= a(0) and b(5);
d(54) <= a(1) and b(5);
d(55) <= a(2) and b(5);
d(56) <= a(3) and b(5);
d(57) <= a(4) and b(5);
d(58) <= a(5) and b(5);

adder5 : adder port map (x(0) => d(47),x(1) => d(48),x(2) => d(49),x(3) => d(50),x(4) => d(51),x(5) => d(52),
								 y(0) => d(53),y(1) => d(54),y(2) => d(55),y(3) => d(56),y(4) => d(57),y(5) => d(58),
								 s(0) => p(5),s(1) => p(6),s(2) => p(7),s(3) => p(8),s(4) => p(9),s(5) => p(10), co => p(11));
								 
end Behavioral;

