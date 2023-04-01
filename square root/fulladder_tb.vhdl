LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fulladder_tb IS
END fulladder_tb;
 
ARCHITECTURE behavior OF fulladder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component fulladder is
        port (
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic
        );
    end component;
    

   --Inputs
   signal A : std_logic;
   signal B : std_logic;
   signal Cin : std_logic;

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fulladder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      A<='1';
      B<='1';
      Cin<='1';
		  wait for 50 ns;	
      A<='1';
      B<='0';
      Cin<='1';
      wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;