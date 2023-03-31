library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Port ( A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           S : in STD_LOGIC_VECTOR (3 downto 0);
			  Output : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

	COMPONENT MUX
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		Cin : IN std_logic;
		S : IN std_logic_vector(3 downto 0);          
		Output : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	Inst_MUX: MUX PORT MAP(
		A => A,
		B => B,
		Cin => Cin,
		S => S,
		Output => Output
	);


end Behavioral;

