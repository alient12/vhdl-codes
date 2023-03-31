library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity yblock is
    port (
        A11, A12, A22: in std_logic;
        DI1, DI2: in std_logic;
        CI1, CI2: in std_logic;
        PI1, PI2: in std_logic;
        PO1, PO2: out std_logic;
        DO1, DO2: out std_logic;
        CO1, CO2: out std_logic;
        S11, S21, S22: out std_logic
    );
end yblock;

architecture Behavioral of yblock is
    component cas is
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
    end component;

    signal CiCh, CkCj: std_logic;
    signal PhPi, PjPk: std_logic;
    signal RiXj: std_logic;

begin

    DO1 <= DI1;
    DO2 <= DI2;
    CAS_h: cas port map (X=>A11, Cin=>CiCh,  PI=>PI1, DI=>DI1, PO=>PhPi, R=>S11, Cout=>CO1);
    CAS_i: cas port map (X=>A12, Cin=>CI1,  PI=>PhPi, DI=>DI2, PO=>PO1, R=>RiXj, Cout=>CiCh);
    CAS_j: cas port map (X=>RiXj, Cin=>CkCj,  PI=>PI2, DI=>DI1, PO=>PjPk, R=>S21, Cout=>CO2);
    CAS_k: cas port map (X=>A22, Cin=>CI2,  PI=>PjPk, DI=>DI2, PO=>PO2, R=>S22, Cout=>CkCj);

end Behavioral;