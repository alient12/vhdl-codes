library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Control_Unit is
generic (data_width : natural := 16;
    addr_width : natural := 10);
    Port ( clk : in std_logic;
           rst : in std_logic
);

end Control_Unit;

architecture Behavioral of Control_Unit is

    COMPONENT ALU
	PORT( A,B: in STD_LOGIC_VECTOR (15 downto 0);
			S : in STD_LOGIC_VECTOR (3 downto 0);
			enable : in STD_LOGIC;
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

    signal IR, DR, AC: STD_LOGIC_VECTOR(15 downto 0);
    signal AR, PC: STD_LOGIC_VECTOR(11 downto 0);
    signal E: STD_LOGIC;

    signal we_ram: std_logic;

    signal data_rom: std_logic_vector( data_width - 1 downto 0);
    signal addr_rom: std_logic_vector( addr_width - 1 downto 0);
    signal clk_rom: std_logic;

    signal alu_op: std_logic_vector(3 downto 0);
    signal alu_en: std_logic;

    TYPE State_type IS (fetch, decode, read_mem, execute);
    signal current_state: State_Type := fetch;
    signal next_state: State_Type;

    signal decoder: STD_LOGIC_VECTOR(5 downto 0);
begin

    COMP_ALU: ALU PORT MAP(
        A => AC, B => DR, output => AC, Cout => E, S => alu_op, enable => alu_en
    );
    COMP_RAM: RAM PORT MAP(
        clk_in => clk,
        we => we_ram,
        addr_in => AR,
        addr_out => AR,
        data_in => DR,
        data_out => DR
    );

    COMP_ROM: ROM PORT MAP(
        clk => clk,
        addr => PC,
        data => IR
    );

    clockprocess : process(clk)
    begin 
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= fetch;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    state_logic: process (current_state, clk)
    begin
        CASE current_state IS
            when fetch =>
                decoder <= IR(15 downto 10);
                AR(9 downto 0) <= IR(9 downto 0);
                PC <= PC + 1;
                alu_en <= '0';
                we_ram <= '0';
                next_state <= decode;
            when decode =>
                case decoder is
                    when "000001" | "000010" | "000011" | "000100"|"010000"|"100000"  => 
                        next_state <= read_mem;
                    when "000101"|"000110"|"000111"|"001000"|"001001"|"001010"|"001011"|"001100"|"001101"|"001110"|"001111" => 
                        next_state <= execute;                        
                    when others =>
                        next_state <= fetch;
                end case;
            when read_mem =>
                we_ram <= '0';
                next_state <= execute;
            when execute =>
                case decoder is
                    when "000001" =>
                        alu_op <= "1010"; 
                        alu_en <= '1';
                    when "000010" =>
                        DR <= AC;
                        we_ram <= '1';
                    when "000011" =>
                        AC <= DR;
                        we_ram <= '0';
                    when "000100" =>
                        alu_op <= "0001";
                        alu_en <= '1';
                    when "000101" =>
                        alu_op <= "0011";
                        alu_en <= '1';
                    when "000110" =>
                        AC <= "0000000000000000";
                    when "000111" =>
                        E <= '0';
                    when "001000" =>
                        alu_op <= "0110";
                        alu_en <= '1';
                    when "001001" =>
                        alu_op <= "0111";
                        alu_en <= '1';
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
                        alu_en <= '1';
                    when "001111" =>
                        alu_op <= "0101";
                        alu_en <= '1';
                    --when "010000" =>
                        -- fuck you ...
                    --when "100000" =>
                        -- fuck you ...
                    when others =>
                        null;
                end case;
            next_state <= fetch;
        END CASE;
    END PROCESS;

end Behavioral;