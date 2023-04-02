LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sqrt_tb IS
END sqrt_tb;
 
ARCHITECTURE behavior OF sqrt_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sqrt
    port (
        A: in std_logic_vector(16 downto 1);
        A_Sign: in std_logic;
        q: out std_logic_vector(8 downto 1);
        R: out std_logic_vector(16 downto 1)
    );
    END COMPONENT;
    

   signal A, R: std_logic_vector(16 downto 1);
   signal q: std_logic_vector(8 downto 1);
   signal A_Sign: std_logic;
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sqrt PORT MAP (
          A=>A, R=>R, q=>q, A_Sign=>A_Sign
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      A<="0000000001000000"; -- 64
      A_Sign<='0';
      wait for 50 ns;	
      A<="0000000001000101"; -- 69
      A_Sign<='0';
      wait for 50 ns;
      A<="0010011100010000"; -- 10000
      A_Sign<='0';
      wait for 50 ns;
      A<="0010011100010000"; -- -10000
      A_Sign<='1';
      wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;