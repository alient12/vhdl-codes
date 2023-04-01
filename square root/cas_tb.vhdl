LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cas_tb IS
END cas_tb;
 
ARCHITECTURE behavior OF cas_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cas
    port (
        X: in std_logic;
        Cin: in std_logic;
        PI: in std_logic;
        DI: in std_logic;
        PO: out std_logic;
        DO: out std_logic;
        R: out std_logic;
        Cout: out std_logic
    );
    END COMPONENT;
    

   --Inputs
   signal X, Cin, PI, DI : std_logic;

 	--Outputs
   signal PO, DO, R, Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cas PORT MAP (
          X=>X, Cin=>Cin, PI=>PI, DI=>DI, PO=>PO, DO=>DO, R=>R, Cout=>Cout
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      X<='1';
      Cin<='1';
      PI<='1';
      DI<='1';
      wait for 50 ns;	
      X<='1';
      Cin<='0';
      PI<='0';
      DI<='1';
      wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;