library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
    Port ( A,B : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end halfadder;

architecture Behavioral of halfadder is

begin

S<= A XOR B;
Cout<= A AND B;

end Behavioral;