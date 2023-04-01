library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

entity sqrt is
    port (
        A: in std_logic_vector(16 downto 1);
        q: out std_logic_vector(8 downto 1);
        R: out std_logic_vector(16 downto 1);
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
    

begin

    q(1) <= X1co1X1pi2;
    q(2) <= X1co2Y1pi1;
    q(3) <= Y1co1Y1pi2;
    q(4) <= Y1co2Y4pi1;
    XB1: xblock port map (A(0)=>'1', A(4 downto 1)=>A(4 downto 1), DI1=>'0', PI(1)=>'1', PI(2)=>X1co1X1pi2, CO(2)=>X1co2Y1pi1, R<=X1R, DO<=X1DO);
    XB2: xblock port map (A(0)=>X1R(4), A(4 downto 1)=>A(8 downto 5), DI1=>Y1po1X2pi1, PI(1)=>Y1po1X2pi1, PI(2)=>Y1po2X2pi2, CO=>X2CO, DO<=X2DO, R<=X2R);
    YB1: yblock port map (
        A11=>X1R(2), A12=>X1R(3), A22=>X2R(0),
        DI1=>X1DO(1), DI2=>X1DO(2),
        CI1=>X1CO(1), CI2=>X1CO(2),
        PI1=>X1co2Y1pi1, PI2=>Y1co1Y1pi2,
        PO1=>Y1po1X2pi1, PO2=>Y1po2X2pi2,
        DO1=>Y1do1Y4di1, DO2=>Y1do2Y4di2,
        CO1=>Y1co1Y1pi2, CO2=>Y1co2Y4pi1,
        S11=>Y1s22Y4a11, S21, S22
    );
    XB3: xblock port map (A(0)=>X2R(4), A(4 downto 1)=>A(12 downto 9), DI1=>Y2po1X3pi1, PI(1)=>Y2po1X3pi1, PI(2)=>Y2po2X3pi2, CO=>X3CO, DO<=X3DO, R<=X3R);

end Behavioral;