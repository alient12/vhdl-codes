LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY xblock_tb IS
END xblock_tb;
 
ARCHITECTURE behavior OF xblock_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xblock
    port (
        A: in std_logic_vector(4 downto 0);
        DI1: in std_logic;
        PI: in std_logic_vector(2 downto 1);
        DO: out std_logic_vector(2 downto 1);
        CO: out std_logic_vector(2 downto 1);
        R: out std_logic_vector(4 downto 0)
    );
    END COMPONENT;
    
   signal A, R: std_logic_vector(4 downto 0);
   signal DI1 : std_logic;
   signal PI, DO, CO : std_logic_vector(2 downto 1);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xblock PORT MAP (
          A => A,
          DI1 => DI1,
          PI => PI,
          DO => DO,
          CO => CO,
          R => R
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      A<="01010";
      DI1<='1';
      PI<="10";
      wait for 50 ns;	
      A<="10101";
      DI1<='0';
      PI<="01";
      wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;