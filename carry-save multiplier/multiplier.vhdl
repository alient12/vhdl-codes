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
    component multiplyingadder is
        port (
            X: in std_logic;
            Y: in std_logic;
            Si: in std_logic;
            Ci: in std_logic;
            So: out std_logic;
            Co: out std_logic
        );
    end component;

    signal S0, S1, S2, S3, S4, S5, S6:  std_logic_vector (5 downto 0);
    signal C0, C1, C2, C3, C4, C5, C6:  std_logic_vector (5 downto 0);

begin


    MA00: multiplyingadder port map (X=>A(0), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(0), Co=>C0(0));
    MA01: multiplyingadder port map (X=>A(1), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(1), Co=>C0(1));
    MA02: multiplyingadder port map (X=>A(2), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(2), Co=>C0(2));
    MA03: multiplyingadder port map (X=>A(3), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(3), Co=>C0(3));
    MA04: multiplyingadder port map (X=>A(4), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(4), Co=>C0(4));
    MA05: multiplyingadder port map (X=>A(5), Y=>B(0), Si=>'0', Ci=>'0', So=>S0(5), Co=>C0(5));

    P(0) <= S0(0);

    MA10: multiplyingadder port map (X=>A(0), Y=>B(1), Si=>S0(1), Ci=>C0(0), So=>S1(0), Co=>C1(0));
    MA11: multiplyingadder port map (X=>A(1), Y=>B(1), Si=>S0(2), Ci=>C0(1), So=>S1(1), Co=>C1(1));
    MA12: multiplyingadder port map (X=>A(2), Y=>B(1), Si=>S0(3), Ci=>C0(2), So=>S1(2), Co=>C1(2));
    MA13: multiplyingadder port map (X=>A(3), Y=>B(1), Si=>S0(4), Ci=>C0(3), So=>S1(3), Co=>C1(3));
    MA14: multiplyingadder port map (X=>A(4), Y=>B(1), Si=>S0(5), Ci=>C0(4), So=>S1(4), Co=>C1(4));
    MA15: multiplyingadder port map (X=>A(5), Y=>B(1), Si=>'0',   Ci=>C0(5), So=>S1(5), Co=>C1(5));

    P(1) <= S1(0);
    
    MA20: multiplyingadder port map (X=>A(0), Y=>B(2), Si=>S1(1), Ci=>C1(0), So=>S2(0), Co=>C2(0));
    MA21: multiplyingadder port map (X=>A(1), Y=>B(2), Si=>S1(2), Ci=>C1(1), So=>S2(1), Co=>C2(1));
    MA22: multiplyingadder port map (X=>A(2), Y=>B(2), Si=>S1(3), Ci=>C1(2), So=>S2(2), Co=>C2(2));
    MA23: multiplyingadder port map (X=>A(3), Y=>B(2), Si=>S1(4), Ci=>C1(3), So=>S2(3), Co=>C2(3));
    MA24: multiplyingadder port map (X=>A(4), Y=>B(2), Si=>S1(5), Ci=>C1(4), So=>S2(4), Co=>C2(4));
    MA25: multiplyingadder port map (X=>A(5), Y=>B(2), Si=>'0',   Ci=>C1(5), So=>S2(5), Co=>C2(5));

    P(2) <= S2(0);
    
    MA30: multiplyingadder port map (X=>A(0), Y=>B(3), Si=>S2(1), Ci=>C2(0), So=>S3(0), Co=>C3(0));
    MA31: multiplyingadder port map (X=>A(1), Y=>B(3), Si=>S2(2), Ci=>C2(1), So=>S3(1), Co=>C3(1));
    MA32: multiplyingadder port map (X=>A(2), Y=>B(3), Si=>S2(3), Ci=>C2(2), So=>S3(2), Co=>C3(2));
    MA33: multiplyingadder port map (X=>A(3), Y=>B(3), Si=>S2(4), Ci=>C2(3), So=>S3(3), Co=>C3(3));
    MA34: multiplyingadder port map (X=>A(4), Y=>B(3), Si=>S2(5), Ci=>C2(4), So=>S3(4), Co=>C3(4));
    MA35: multiplyingadder port map (X=>A(5), Y=>B(3), Si=>'0',   Ci=>C2(5), So=>S3(5), Co=>C3(5));

    P(3) <= S3(0);
    
    MA40: multiplyingadder port map (X=>A(0), Y=>B(4), Si=>S3(1), Ci=>C3(0), So=>S4(0), Co=>C4(0));
    MA41: multiplyingadder port map (X=>A(1), Y=>B(4), Si=>S3(2), Ci=>C3(1), So=>S4(1), Co=>C4(1));
    MA42: multiplyingadder port map (X=>A(2), Y=>B(4), Si=>S3(3), Ci=>C3(2), So=>S4(2), Co=>C4(2));
    MA43: multiplyingadder port map (X=>A(3), Y=>B(4), Si=>S3(4), Ci=>C3(3), So=>S4(3), Co=>C4(3));
    MA44: multiplyingadder port map (X=>A(4), Y=>B(4), Si=>S3(5), Ci=>C3(4), So=>S4(4), Co=>C4(4));
    MA45: multiplyingadder port map (X=>A(5), Y=>B(4), Si=>'0',   Ci=>C3(5), So=>S4(5), Co=>C4(5));

    P(4) <= S4(0);

    MA50: multiplyingadder port map (X=>A(0), Y=>B(5), Si=>S4(1), Ci=>C4(0), So=>S5(0), Co=>C5(0));
    MA51: multiplyingadder port map (X=>A(1), Y=>B(5), Si=>S4(2), Ci=>C4(1), So=>S5(1), Co=>C5(1));
    MA52: multiplyingadder port map (X=>A(2), Y=>B(5), Si=>S4(3), Ci=>C4(2), So=>S5(2), Co=>C5(2));
    MA53: multiplyingadder port map (X=>A(3), Y=>B(5), Si=>S4(4), Ci=>C4(3), So=>S5(3), Co=>C5(3));
    MA54: multiplyingadder port map (X=>A(4), Y=>B(5), Si=>S4(5), Ci=>C4(4), So=>S5(4), Co=>C5(4));
    MA55: multiplyingadder port map (X=>A(5), Y=>B(5), Si=>'0',   Ci=>C4(5), So=>S5(5), Co=>C5(5));

    P(5) <= S5(0);

    MA60: multiplyingadder port map (X=>'0',   Y=>'1', Si=>S5(1), Ci=>C5(0), So=>S6(0), Co=>C6(0));
    MA61: multiplyingadder port map (X=>C6(0), Y=>'1', Si=>S5(2), Ci=>C5(1), So=>S6(1), Co=>C6(1));
    MA62: multiplyingadder port map (X=>C6(1), Y=>'1', Si=>S5(3), Ci=>C5(2), So=>S6(2), Co=>C6(2));
    MA63: multiplyingadder port map (X=>C6(2), Y=>'1', Si=>S5(4), Ci=>C5(3), So=>S6(3), Co=>C6(3));
    MA64: multiplyingadder port map (X=>C6(3), Y=>'1', Si=>S5(5), Ci=>C5(4), So=>S6(4), Co=>C6(4));
    MA65: multiplyingadder port map (X=>C6(4), Y=>'1', Si=>'0',   Ci=>C5(5), So=>S6(5), Co=>C6(5));

    P(6) <= S6(0);
    P(7) <= S6(1);
    P(8) <= S6(2);
    P(9) <= S6(3);
    P(10) <= S6(4);
    P(11) <= C6(5);

end Behavioral;