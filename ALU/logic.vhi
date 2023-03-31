
-- VHDL Instantiation Created from source file logic.vhd -- 13:23:08 10/14/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT logic
	PORT(
		x : IN std_logic_vector(7 downto 0);
		y : IN std_logic_vector(7 downto 0);
		S1 : IN std_logic_vector(2 downto 0);       
		lgc : INOUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_logic: logic PORT MAP(
		x => ,
		y => ,
		S1 => ,
		lgc => 
	);


