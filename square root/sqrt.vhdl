library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity sqrt is
    port (
        A: in std_logic_vector(16 downto 1);
        A_Sign: in std_logic;
        q: out std_logic_vector(8 downto 1);
        R: out std_logic_vector(16 downto 1)
    );
end sqrt;

architecture Behavioral of sqrt is
    component xblock is
            port (
            A: in std_logic_vector(4 downto 0);
            DI1: in std_logic;
            PI: in std_logic_vector(2 downto 1);
            DO: out std_logic_vector(2 downto 1);
            CO: out std_logic_vector(2 downto 1);
            R: out std_logic_vector(4 downto 0)
        );
    end component;

    component yblock is
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
    end component;

    -- X1 output signals
    signal X1co1X1pi2, X1co2Y1pi1: std_logic;
    signal X1R: std_logic_vector(4 downto 0);
    signal X1DO: std_logic_vector(2 downto 1);
    -- X2 output signals
    signal X2CO: std_logic_vector(2 downto 1);
    signal X2DO: std_logic_vector(2 downto 1);
    signal X2R: std_logic_vector(4 downto 0);
    -- Y1 output signals
    signal Y1po1X2pi1, Y1po2X2pi2: std_logic;
    signal Y1co1Y1pi2, Y1co2Y4pi1: std_logic;
    signal Y1do1Y4di1, Y1do2Y4di2: std_logic;
    signal Y1s22Y4a11: std_logic;
    -- X3 output signals
    signal X3CO: std_logic_vector(2 downto 1);
    signal X3DO: std_logic_vector(2 downto 1);
    signal X3R: std_logic_vector(4 downto 0);
    -- Y2 output signals
    signal Y2po1X3pi1, Y2po2X3pi2: std_logic;
    signal Y2do1Y5di1, Y2do2Y5di2: std_logic;
    signal Y2co1Y4ci1, Y2co2Y4ci2: std_logic;
    signal Y2s11Y4a22, Y2s21Y6a12, Y2s22Y5a11: std_logic;
    -- Y4 output signals
    signal Y4po1Y2pi1, Y4po2Y2pi2: std_logic;
    signal Y4do1Y6di1,Y4do2Y6di2: std_logic;
    signal Y4co1Y4pi2, Y4co2Y6pi1: std_logic;
    signal Y4s22Y6a11: std_logic;
    -- X4 output signals
    signal X4CO: std_logic_vector(2 downto 1);
    signal X4DO: std_logic_vector(2 downto 1);
    signal X4R: std_logic_vector(4 downto 0);
    -- Y3 output signals
    signal Y3po1X4pi1, Y3po2X4pi2: std_logic;
    signal Y3co1Y5ci1, Y3co2Y5ci2: std_logic;
    signal Y3s11Y5a22: std_logic;
    -- Y5 output signals
    signal Y5po1Y3pi1, Y5po2Y3pi2: std_logic;
    signal Y5co1Y6ci1, Y5co2Y6ci2: std_logic;
    signal Y5s11Y6a22: std_logic;
    -- Y6 output signals
    signal Y6po1Y5pi1, Y6po2Y5pi2: std_logic;
    signal Y6co1Y6pi2: std_logic;
    

begin

    q(1) <= X1co1X1pi2;
    q(2) <= X1co2Y1pi1;
    q(3) <= Y1co1Y1pi2;
    q(4) <= Y1co2Y4pi1;
    q(5) <= Y4co1Y4pi2;
    q(6) <= Y4co2Y6pi1;
    q(7) <= Y6co1Y6pi2;
    R(1) <= A_Sign;
    R(2) <= A_Sign;
    R(3) <= A_Sign;
    R(4) <= A_Sign;
    R(5) <= A_Sign;
    R(6) <= A_Sign;
    R(16 downto 13) <= X4R(4 downto 1);
    XB1: xblock port map (A(0)=>'1', A(4 downto 1)=>A(4 downto 1), DI1=>'0', PI(1)=>'1', PI(2)=>X1co1X1pi2, CO(1)=>X1co1X1pi2, CO(2)=>X1co2Y1pi1, R=>X1R, DO=>X1DO);
    XB2: xblock port map (A(0)=>X1R(4), A(4 downto 1)=>A(8 downto 5), DI1=>Y1po1X2pi1, PI(1)=>Y1po1X2pi1, PI(2)=>Y1po2X2pi2, CO=>X2CO, DO=>X2DO, R=>X2R);
    YB1: yblock port map (
        A11=>X1R(2), A12=>X1R(3), A22=>X2R(0),
        DI1=>X1DO(1), DI2=>X1DO(2),
        CI1=>X2CO(1), CI2=>X2CO(2),
        PI1=>X1co2Y1pi1, PI2=>Y1co1Y1pi2,
        PO1=>Y1po1X2pi1, PO2=>Y1po2X2pi2,
        DO1=>Y1do1Y4di1, DO2=>Y1do2Y4di2,
        CO1=>Y1co1Y1pi2, CO2=>Y1co2Y4pi1,
        S22=>Y1s22Y4a11
    );
    XB3: xblock port map (A(0)=>X2R(4), A(4 downto 1)=>A(12 downto 9), DI1=>Y2po1X3pi1, PI(1)=>Y2po1X3pi1, PI(2)=>Y2po2X3pi2, CO=>X3CO, DO=>X3DO, R=>X3R);
    YB2: yblock port map (
        A11=>X2R(2), A12=>X2R(3), A22=>X3R(0),
        DI1=>X2DO(1), DI2=>X2DO(2),
        CI1=>X3CO(1), CI2=>X3CO(2),
        PI1=>Y4po1Y2pi1, PI2=>Y4po2Y2pi2,
        PO1=>Y2po1X3pi1, PO2=>Y2po2X3pi2,
        DO1=>Y2do1Y5di1, DO2=>Y2do2Y5di2,
        CO1=>Y2co1Y4ci1, CO2=>Y2co2Y4ci2,
        S11=>Y2s11Y4a22, S21=>Y2s21Y6a12, S22=>Y2s22Y5a11
    );
    YB4: yblock port map (
        A11=>Y1s22Y4a11, A12=>X2R(1), A22=>Y2s11Y4a22,
        DI1=>Y1do1Y4di1, DI2=>Y1do2Y4di2,
        CI1=>Y2co1Y4ci1, CI2=>Y2co2Y4ci2,
        PI1=>Y1co2Y4pi1, PI2=>Y4co1Y4pi2,
        PO1=>Y4po1Y2pi1, PO2=>Y4po2Y2pi2,
        DO1=>Y4do1Y6di1, DO2=>Y4do2Y6di2,
        CO1=>Y4co1Y4pi2, CO2=>Y4co2Y6pi1,
        S22=>Y4s22Y6a11
    );
    XB4: xblock port map (A(0)=>X3R(4), A(4 downto 1)=>A(16 downto 13), DI1=>Y3po1X4pi1, PI(1)=>Y3po1X4pi1, PI(2)=>Y3po2X4pi2, CO=>X4CO, DO=>X4DO, R=>X4R);
    YB3: yblock port map (
        A11=>X3R(2), A12=>X3R(3), A22=>X4R(0),
        DI1=>X3DO(1), DI2=>X3DO(2),
        CI1=>X4CO(1), CI2=>X4CO(2),
        PI1=>Y5po1Y3pi1, PI2=>Y5po2Y3pi2,
        PO1=>Y3po1X4pi1, PO2=>Y3po2X4pi2,
        CO1=>Y3co1Y5ci1, CO2=>Y3co2Y5ci2,
        S11=>Y3s11Y5a22, S21=>R(11), S22=>R(12)
    );
    YB5: yblock port map (
        A11=>Y2s22Y5a11, A12=>X3R(1), A22=>Y3s11Y5a22,
        DI1=>Y2do1Y5di1, DI2=>Y2do2Y5di2,
        CI1=>Y3co1Y5ci1, CI2=>Y3co2Y5ci2,
        PI1=>Y6po1Y5pi1, PI2=>Y6po2Y5pi2,
        PO1=>Y5po1Y3pi1, PO2=>Y5po2Y3pi2,
        CO1=>Y5co1Y6ci1, CO2=>Y5co2Y6ci2,
        S11=>Y5s11Y6a22, S21=>R(9), S22=>R(10)
    );
    YB6: yblock port map (
        A11=>Y4s22Y6a11, A12=>Y2s21Y6a12, A22=>Y5s11Y6a22,
        DI1=>Y4do1Y6di1, DI2=>Y4do2Y6di2,
        CI1=>Y5co1Y6ci1, CI2=>Y5co2Y6ci2,
        PI1=>Y4co2Y6pi1, PI2=>Y6co1Y6pi2,
        PO1=>Y6po1Y5pi1, PO2=>Y6po2Y5pi2,
        CO1=>Y6co1Y6pi2, CO2=>q(8),
        S21=>R(7), S22=>R(8)
    );

end Behavioral;