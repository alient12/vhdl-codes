library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (5 downto 0);
			  P : out  STD_LOGIC_VECTOR (11 downto 0));
end multiplier;

architecture Behavioral of multiplier is

	COMPONENT adder6
	Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : in  STD_LOGIC_VECTOR (5 downto 0);
           Cin: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
	END COMPONENT;

    signal AB0, AB1, AB2, AB3, AB4, AB5: std_logic_vector(5 downto 0);
    signal X0, X1, X2, X3, X4:  std_logic_vector (5 downto 0);

begin

	AB0(0) <= A(0) AND B(0);
	AB0(1) <= A(1) AND B(0);
	AB0(2) <= A(2) AND B(0);
	AB0(3) <= A(3) AND B(0);
	AB0(4) <= A(4) AND B(0);
	AB0(5) <= A(5) AND B(0);

    AB1(0) <= A(0) AND B(1);
	AB1(1) <= A(1) AND B(1);
	AB1(2) <= A(2) AND B(1);
	AB1(3) <= A(3) AND B(1);
    AB1(4) <= A(4) AND B(1);
	AB1(5) <= A(5) AND B(1);

    AB2(0) <= A(0) AND B(2);
	AB2(1) <= A(1) AND B(2);
	AB2(2) <= A(2) AND B(2);
	AB2(3) <= A(3) AND B(2);
    AB2(4) <= A(4) AND B(2);
	AB2(5) <= A(5) AND B(2);

    AB3(0) <= A(0) AND B(3);
	AB3(1) <= A(1) AND B(3);
	AB3(2) <= A(2) AND B(3);
	AB3(3) <= A(3) AND B(3);
    AB3(4) <= A(4) AND B(3);
	AB3(5) <= A(5) AND B(3);

    AB4(0) <= A(0) AND B(4);
	AB4(1) <= A(1) AND B(4);
	AB4(2) <= A(2) AND B(4);
	AB4(3) <= A(3) AND B(4);
    AB4(4) <= A(4) AND B(4);
	AB4(5) <= A(5) AND B(4);

    AB5(0) <= A(0) AND B(5);
	AB5(1) <= A(1) AND B(5);
	AB5(2) <= A(2) AND B(5);
	AB5(3) <= A(3) AND B(5);
    AB5(4) <= A(4) AND B(5);
	AB5(5) <= A(5) AND B(5);

    P(0) <= AB0(0);
    X0 <= ('0', AB0(5), AB0(4), AB0(3), AB0(2), AB0(1));

    ADD0: adder6 port map (X=>X0, Y=>AB1, Cin=>'0', Cout=>X1(5), S(5)=>X1(4), S(4)=>X1(3), S(3)=>X1(2), S(2)=>X1(1), S(1)=>X1(0), S(0)=>P(1));
    ADD1: adder6 port map (X=>X1, Y=>AB2, Cin=>'0', Cout=>X2(5), S(5)=>X2(4), S(4)=>X2(3), S(3)=>X2(2), S(2)=>X2(1), S(1)=>X2(0), S(0)=>P(2));
    ADD2: adder6 port map (X=>X2, Y=>AB3, Cin=>'0', Cout=>X3(5), S(5)=>X3(4), S(4)=>X3(3), S(3)=>X3(2), S(2)=>X3(1), S(1)=>X3(0), S(0)=>P(3));
    ADD3: adder6 port map (X=>X3, Y=>AB4, Cin=>'0', Cout=>X4(5), S(5)=>X4(4), S(4)=>X4(3), S(3)=>X4(2), S(2)=>X4(1), S(1)=>X4(0), S(0)=>P(4));
    --ADD4: adder6 port map (X=>X4, Y=>AB5, Cin=>'0', Cout=>P(11), S(5)=>P(10 downto 5));
    ADD4: adder6 port map (X=>X4, Y=>AB5, Cin=>'0', Cout=>P(11), S(5)=>P(10), S(4)=>P(9), S(3)=>P(8), S(2)=>P(7), S(1)=>P(6), S(0)=>P(5));

end Behavioral;