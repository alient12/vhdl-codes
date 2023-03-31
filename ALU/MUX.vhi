
-- VHDL Instantiation Created from source file MUX.vhd -- 11:05:59 10/23/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MUX
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		S : IN std_logic;          
		Output : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_MUX: MUX PORT MAP(
		A => ,
		B => ,
		S => ,
		Output => 
	);


