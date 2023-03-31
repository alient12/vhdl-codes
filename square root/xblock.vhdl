library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity xblock is
    port (
        A: in std_logic_vector(4 downto 0);
        DI1: in std_logic;
        PI: in std_logic_vector(2 downto 1);
        DO: out std_logic_vector(2 downto 1);
        CO: out std_logic_vector(2 downto 1);
        R: out std_logic_vector(4 downto 0)
    );
end xblock;

architecture Behavioral of xblock is
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

    signal CbCa, CcCb, CeCd, CfCe, CgCf: std_logic;
    signal PaPb, PbPc, PcCc, PdPe, PePf, PfPg, PgCg: std_logic;
    signal Db, Df: std_logic;
    signal RbXd ,RcXe: std_logic;

begin

    Db <= NOT PaPb;
    Df <= NOT PePf;
    DO(1) <= DI1;
    DO(2) <= PePf;
    CAS_a: cas port map (X=>A(0), Cin=>CbCa,  PI=>PI(1), DI=>PI(1), PO=>PaPb, R=>R(0), Cout=>CO(1));
    CAS_b: cas port map (X=>A(1), Cin=>CcCb,  PI=>PaPb,  DI=>Db,    PO=>PbPc, R=>RbXd, Cout=>CbCa);
    CAS_c: cas port map (X=>A(2), Cin=>PcCc,  PI=>PbPc,  DI=>'1',   PO=>PcCc, R=>RcXe, Cout=>CcCb);
    CAS_d: cas port map (X=>RbXd, Cin=>CeCd,  PI=>PI(2), DI=>DI1,   PO=>PdPe, R=>R(1), Cout=>CO(2));
    CAS_e: cas port map (X=>RcXe, Cin=>CfCe,  PI=>PdPe,  DI=>PdPe,  PO=>PePf, R=>R(2), Cout=>CeCd);
    CAS_f: cas port map (X=>A(3), Cin=>CgCf,  PI=>PePf,  DI=>Df,    PO=>PfPg, R=>R(3), Cout=>CfCe);
    CAS_g: cas port map (X=>A(4), Cin=>PI(2), PI=>PfPg,  DI=>'1',   PO=>PgCg, R=>R(4), Cout=>CgCf);

end Behavioral;