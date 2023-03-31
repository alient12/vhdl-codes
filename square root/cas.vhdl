library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity cas is
    port (
        X: in std_logic;
        Cin: in std_logic;
        PI: in std_logic;
        DI: in std_logic;
        PO: out std_logic;
        DO: out std_logic;
        R: out std_logic;
        Cout: out std_logic
    );
end cas;

architecture Behavioral of cas is
    component fulladder is
        port (
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;

    signal PD: std_logic;

begin

	PD <= PI XOR DI;
    PO <= PI;
    DO <= DI;
    FA: fulladder port map (A=>X, B=>PD, Cin=>Cin, S=>R, Cout=>Cout);

end Behavioral;