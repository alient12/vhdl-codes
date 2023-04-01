LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY yblock_tb IS
END yblock_tb;
 
ARCHITECTURE behavior OF yblock_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT yblock
    port (
        A11, A12, A22: in std_logic;
        DI1, DI2: in std_logic;
        CI1, CI2: in std_logic;
        PI1, PI2: in std_logic;
        PO1, PO2: out std_logic;
        DO1, DO2: out std_logic;
        CO1, CO2: out std_logic;
        S11, S21, S22: out std_logic
    );
    END COMPONENT;
    

   signal A11, A12, A22, DI1, DI2, CI1, CI2, PI1, PI2 : std_logic;
   signal PO1, PO2, DO1, DO2, CO1, CO2, S11, S21, S22 : std_logic;
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: yblock PORT MAP (
          A11=>A11, A12=>A12, A22=>A22, DI1=>DI1, DI2=>DI2, CI1=>CI1, CI2=>CI2, PI1=>PI1, PI2=>PI2
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      A11<='1';
      A12<='0';
      A22<='1';
      DI1<='0';
      DI2<='1';
      CI1<='0';
      CI2<='1';
      PI1<='0';
      PI2<='1';
      wait for 50 ns;	
      A11<='0';
      A12<='1';
      A22<='0';
      DI1<='1';
      DI2<='0';
      CI1<='1';
      CI2<='0';
      PI1<='1';
      PI2<='0';
      wait for 50 ns;
      A11<='1';
      A12<='1';
      A22<='1';
      DI1<='1';
      DI2<='1';
      CI1<='1';
      CI2<='1';
      PI1<='1';
      PI2<='1';
      wait for 50 ns;
      A11<='0';
      A12<='0';
      A22<='0';
      DI1<='0';
      DI2<='0';
      CI1<='0';
      CI2<='0';
      PI1<='0';
      PI2<='0';
      wait for 50 ns;
		

     
      -- insert stimulus here 

      wait;
   end process;

END;