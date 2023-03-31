library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity multiplier is
    port (
        A: in std_logic_vector(5 downto 0);
        B: in std_logic_vector(5 downto 0);
        P: out std_logic_vector(11 downto 0)
    );
end multiplier;

architecture Behavioral of multiplier is
    component fulladder is
        port (
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;

    component halfadder is
        port (
            A: in std_logic;
            B: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;

    signal AB0, AB1, AB2, AB3, AB4, AB5: std_logic_vector(5 downto 0);
    signal S0, S1, S2, S3, S4, S5:  std_logic_vector (4 downto 0);
    signal C0, C1, C2, C3, C4, C5:  std_logic_vector (4 downto 0);

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

    HA0: halfadder port map (A=>AB0(1), B=>AB1(0), S=>S0(0), Cout=>C0(0));
    HA1: halfadder port map (A=>AB0(2), B=>AB1(1), S=>S0(1), Cout=>C0(1));
    HA2: halfadder port map (A=>AB0(3), B=>AB1(2), S=>S0(2), Cout=>C0(2));
    HA3: halfadder port map (A=>AB0(4), B=>AB1(3), S=>S0(3), Cout=>C0(3));
    HA4: halfadder port map (A=>AB0(5), B=>AB1(4), S=>S0(4), Cout=>C0(4));

    P(1) <= S0(0);

    FA10: fulladder port map (A=>S0(1), B=>AB2(0), Cin=>C0(0), S=>S1(0), Cout=>C1(0));
    FA11: fulladder port map (A=>S0(2), B=>AB2(1), Cin=>C0(1), S=>S1(1), Cout=>C1(1));
    FA12: fulladder port map (A=>S0(3), B=>AB2(2), Cin=>C0(2), S=>S1(2), Cout=>C1(2));
    FA13: fulladder port map (A=>S0(4), B=>AB2(3), Cin=>C0(3), S=>S1(3), Cout=>C1(3));
    FA14: fulladder port map (A=>AB1(5),B=>AB2(4), Cin=>C0(4), S=>S1(4), Cout=>C1(4));

    P(2) <= S1(0);

    FA20: fulladder port map (A=>S1(1), B=>AB3(0), Cin=>C1(0), S=>S2(0), Cout=>C2(0));
    FA21: fulladder port map (A=>S1(2), B=>AB3(1), Cin=>C1(1), S=>S2(1), Cout=>C2(1));
    FA22: fulladder port map (A=>S1(3), B=>AB3(2), Cin=>C1(2), S=>S2(2), Cout=>C2(2));
    FA23: fulladder port map (A=>S1(4), B=>AB3(3), Cin=>C1(3), S=>S2(3), Cout=>C2(3));
    FA24: fulladder port map (A=>AB2(5),B=>AB3(4), Cin=>C1(4), S=>S2(4), Cout=>C2(4));

    P(3) <= S2(0);

    FA30: fulladder port map (A=>S2(1), B=>AB4(0), Cin=>C2(0), S=>S3(0), Cout=>C3(0));
    FA31: fulladder port map (A=>S2(2), B=>AB4(1), Cin=>C2(1), S=>S3(1), Cout=>C3(1));
    FA32: fulladder port map (A=>S2(3), B=>AB4(2), Cin=>C2(2), S=>S3(2), Cout=>C3(2));
    FA33: fulladder port map (A=>S2(4), B=>AB4(3), Cin=>C2(3), S=>S3(3), Cout=>C3(3));
    FA34: fulladder port map (A=>AB3(5),B=>AB4(4), Cin=>C2(4), S=>S3(4), Cout=>C3(4));

    P(4) <= S3(0);

    FA40: fulladder port map (A=>S3(1), B=>AB5(0), Cin=>C3(0), S=>S4(0), Cout=>C4(0));
    FA41: fulladder port map (A=>S3(2), B=>AB5(1), Cin=>C3(1), S=>S4(1), Cout=>C4(1));
    FA42: fulladder port map (A=>S3(3), B=>AB5(2), Cin=>C3(2), S=>S4(2), Cout=>C4(2));
    FA43: fulladder port map (A=>S3(4), B=>AB5(3), Cin=>C3(3), S=>S4(3), Cout=>C4(3));
    FA44: fulladder port map (A=>AB4(5),B=>AB5(4), Cin=>C3(4), S=>S4(4), Cout=>C4(4));

    P(5) <= S4(0);

    HA50: halfadder port map (A=>S4(1), B=>C4(0), S=>S5(0), Cout=>C5(0));
    FA51: fulladder port map (A=>S4(2), B=>S4(1), Cin=>C5(0), S=>S5(1), Cout=>C5(1));
    FA52: fulladder port map (A=>S4(3), B=>S4(2), Cin=>C5(1), S=>S5(2), Cout=>C5(2));
    FA53: fulladder port map (A=>S4(4), B=>S4(3), Cin=>C5(2), S=>S5(3), Cout=>C5(3));
    FA54: fulladder port map (A=>AB5(5), B=>S4(4), Cin=>C5(3), S=>S5(4), Cout=>C5(4));

    P(6) <= S5(0);
    P(7) <= S5(1);
    P(8) <= S5(2);
    P(9) <= S5(3);
    P(10) <= S5(4);
    P(11) <= C5(4);

end Behavioral;