LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_tb IS 
END test_tb;

ARCHITECTURE behavior OF test_tb IS

    COMPONENT Control_Unit
        PORT(clk : IN std_logic;
        rst: out std_logic);
    END COMPONENT;

   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   constant clk_period : time := 1 ns;

BEGIN

   uut: Control_Unit PORT MAP (clk => clk, rst => rst);       

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;

END;