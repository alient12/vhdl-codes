
-- VHDL Instantiation Created from source file top.vhd -- 14:36:34 10/14/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT top
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		Cin : IN std_logic;
		S : IN std_logic_vector(3 downto 0);          
		Output : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_top: top PORT MAP(
		A => ,
		B => ,
		Cin => ,
		S => ,
		Output => 
	);


