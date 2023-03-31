LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY multiplier_tb IS
END multiplier_tb;
 
ARCHITECTURE behavior OF multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier
    PORT(
         A : IN  std_logic_vector(5 downto 0);
         B : IN  std_logic_vector(5 downto 0);
         P : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(5 downto 0) := (others => '0');
   signal B : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
        wait for 50 ns;	
		A<="001000";
		B<="000111";
		wait for 50 ns;	
		A<="001100";
		B<="000010";
        wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;