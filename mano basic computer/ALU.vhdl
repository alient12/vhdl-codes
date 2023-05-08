library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
	Port ( A,B: in STD_LOGIC_VECTOR (15 downto 0);
			S : in STD_LOGIC_VECTOR (3 downto 0);
			Cout : out STD_LOGIC;
			Output : out STD_LOGIC_VECTOR (15 downto 0)
			);
end ALU;

architecture Behavioral of ALU is

	COMPONENT arithic
	PORT(
		x : IN std_logic_vector(15 downto 0);
		y : IN std_logic_vector(15 downto 0);
		S1 : IN std_logic_vector(2 downto 0);       
		cout : OUT std_logic;
		arthc : INOUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX
	PORT(
		A : INOUT std_logic_vector(15 downto 0);
		B : INOUT std_logic_vector(15 downto 0);
		S : IN std_logic;          
		Output : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT logic
	PORT(
		x : IN std_logic_vector(15 downto 0);
		y : IN std_logic_vector(15 downto 0);
		S1 : IN std_logic_vector(2 downto 0);       
		lgc : INOUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	signal I0,I1 : STD_LOGIC_VECTOR (15 downto 0);
begin

	Inst_arithic: arithic PORT MAP(
		x => A ,
		y => B,
		cout => cout,
		S1 => S(2 downto 0),
		arthc => I0
	);
	
	Inst_logic: logic PORT MAP(
		x => A,
		y => B,
		S1 => S(2 downto 0),
		lgc => I1
	);
	
	Inst_MUX: MUX PORT MAP(
		A => I0,
		B => I1,
		S => S(3),
		Output => Output
	);


end Behavioral;

