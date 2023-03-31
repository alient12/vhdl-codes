library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder6 is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : in  STD_LOGIC_VECTOR (5 downto 0);
           Cin: in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
end adder6;

architecture Behavioral of adder6 is

component adder
Port (A,B,Cin : in STD_LOGIC;
       S,Cout : out STD_LOGIC);
end component;

signal c: STD_LOGIC_VECTOR (4 downto 0);

begin

adder0: adder port map( X(0), Y(0), Cin, S(0), c(0));
adder1: adder port map( X(1), Y(1), c(0), S(1), c(1));
adder2: adder port map( X(2), Y(2), c(1), S(2), c(2));
adder3: adder port map( X(3), Y(3), c(2), S(3), c(3));
adder4: adder port map( X(4), Y(4), c(3), S(4), c(4));
adder5: adder port map( X(5), Y(5), c(4), S(5), Cout);

end Behavioral;