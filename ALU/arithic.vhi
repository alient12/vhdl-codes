
-- VHDL Instantiation Created from source file arithic.vhd -- 13:40:46 10/14/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT arithic
	PORT(
		x : IN std_logic_vector(7 downto 0);
		y : IN std_logic_vector(7 downto 0);
		cin : IN std_logic;
		S1 : IN std_logic_vector(2 downto 0);       
		arthc : INOUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_arithic: arithic PORT MAP(
		x => ,
		y => ,
		cin => ,
		S1 => ,
		arthc => 
	);


