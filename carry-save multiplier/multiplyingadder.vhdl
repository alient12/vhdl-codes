library IEEE;
use IEEE.std_logic_1164.all;

entity multiplyingadder is
    port (
        X: in std_logic;
        Y: in std_logic;
        Si: in std_logic;
        Ci: in std_logic;
        So: out std_logic;
        Co: out std_logic
    );
end multiplyingadder;

architecture Behavioral of multiplyingadder is
    component fulladder is
        port (
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;

    signal bb: std_logic;

begin

    bb <= Y AND X;
    FA: fulladder port map(A=>Si, B=>bb, Cin=>Ci, S=>So, Cout=>Co);

end Behavioral;