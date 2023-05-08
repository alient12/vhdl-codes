library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Control_Unit is
generic (data_width : natural := 16;
    addr_width : natural := 10);
port ( clk : in std_logic
);
end Control_Unit;

architecture Behavioral of Control_Unit is

    COMPONENT ALU
	PORT( A,B: in STD_LOGIC_VECTOR (15 downto 0);
			S : in STD_LOGIC_VECTOR (3 downto 0);
			Cout : out STD_LOGIC;
			Output : out STD_LOGIC_VECTOR (15 downto 0)
		);
	END COMPONENT;

    COMPONENT RAM
	PORT(   clk_in : in std_logic;
            clk_out : in std_logic;
            we : in std_logic;
            addr_in : in std_logic_vector( addr_width - 1 downto 0);
            addr_out : in std_logic_vector( addr_width - 1 downto 0);
            data_in : in std_logic_vector( data_width - 1 downto 0);
            data_out : out std_logic_vector( data_width - 1 downto 0)
        );
	END COMPONENT;

    COMPONENT ROM
    port ( clk : in std_logic;
        addr : in std_logic_vector( addr_width - 1 downto 0);
        data : out std_logic_vector( data_width - 1 downto 0)
    );
    END COMPONENT;

    signal IR, TR, DR, AC: STD_LOGIC_VECTOR(15 downto 0);
    signal AR, PC: STD_LOGIC_VECTOR(11 downto 0);
    signal E: STD_LOGIC;

    signal data_ram: std_logic_vector( data_width - 1 downto 0);
    signal addr_ram: std_logic_vector( addr_width - 1 downto 0);
    signal clk_ram, we_ram: std_logic;

    signal data_rom: std_logic_vector( data_width - 1 downto 0);
    signal addr_rom: std_logic_vector( addr_width - 1 downto 0);
    signal clk_rom: std_logic;

    signal alu_op: std_logic_vector(3 downto 0);

    TYPE State_type IS (state_t0, state_t1, state_t2, state_t3);
    signal state: State_Type;

    signal decoder: STD_LOGIC_VECTOR(5 downto 0);
begin
    addr_ram <= AR;
    DR <= data_ram;

    COMP_ALU: ALU PORT MAP(
        A => AC, B => DR, output => AC, Cout => E, S => alu_op
    );
    COMP_RAM: RAM PORT MAP(
        clk_in => clk,
        we => we_ram,
        addr_in => addr_ram,
        addr_out => addr_ram,
        data_in => addr_ram,
        data_out => data_ram
    );

    PROCESS(clk)
    begin
        CASE state IS
            when state_t0 =>
                if rising_edge(clk) then
                    AR <= PC;
                end if;
                state <= state_t1;
            when state_t1 =>
                if rising_edge(clk) then
                    PC <= PC + 1;
                    addr_rom <= AR;
                    IR <= data_rom;
                end if;
                state <= state_t2;
            when state_t2 =>
                if rising_edge(clk) then
                    decoder <= IR(15 downto 10);
                    AR(9 downto 0) <= IR(9 downto 0);
                end if;
                state <= state_t3;
            when state_t3 =>
                if rising_edge(clk) then
                    case decoder is
                    when "000001" =>
                        alu_op <= "1010"; 
                    when "000010" =>
                        data_ram <= AC;
                        we_ram <= '1';
                    when "000011" =>
                        AC <= data_ram;
                        we_ram <= '0';
                    when "000100" =>
                        alu_op <= "0001";
                    when "000101" =>
                        alu_op <= "0011";
                    when "000110" =>
                        AC <= "0000000000000000";
                    when "000111" =>
                        E <= '0';
                    when "001000" =>
                        alu_op <= "0110";
                    when "001001" =>
                        alu_op <= "0111";
                    when "001010" =>
                        if AC(15) = '0' then
                            PC <= PC + 1;
                        end if;
                    when "001011" =>
                        if AC(15) = '1' then
                            PC <= PC + 1;
                        end if;
                    when "001100" =>
                        if E = '0' then
                            PC <= PC + 1;
                        end if;
                    when "001101" =>
                        if AC = "0000000000000000" then
                            PC <= PC + 1;
                        end if;
                    when "001110" =>
                        alu_op <= "0100";
                    when "001111" =>
                        alu_op <= "0101";
                    --when "010000" =>
                        -- fuck you ...
                    --when "100000" =>
                        -- fuck you ...
                    when others =>
                        null;
                    end case;
                end if;
                state <= state_t0;
        END CASE;
    END PROCESS;

end Behavioral;