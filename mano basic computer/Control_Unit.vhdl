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

    COMPONENT register16
	PORT(d : in std_logic_vector (15 downto 0);
        clk ,rst, ld, inc : in std_logic;
        q : out std_logic_vector (15 downto 0));
	END COMPONENT;

    COMPONENT register10
	PORT(d : in std_logic_vector (9 downto 0);
        clk ,rst, ld, inc : in std_logic;
        q : out std_logic_vector (9 downto 0));
	END COMPONENT;

    COMPONENT flipflop
	PORT(d : in std_logic;
        clk ,rst, ld : in std_logic;
        q : out std_logic);
	END COMPONENT;

    COMPONENT count8
	port(
		CLK	: in std_logic;
		RST: in std_logic;
		DOUT: out std_logic_vector(7 downto 0)
	);
	END COMPONENT;

    signal AC_LOAD, DR_LOAD, IR_LOAD, AR_LOAD, PC_LOAD, AC_INC, PC_INC, AC_RST: std_logic;
    signal AC_DATA, DR_DATA, IR_DATA: std_logic_vector(15 downto 0);
    signal AC, DR, IR: std_logic_vector(15 downto 0);
    signal AR_DATA, PC_DATA: std_logic_vector(9 downto 0);
    signal AR, PC: std_logic_vector(9 downto 0);
    signal E, E_DATA, E_LOAD, E_RST: STD_LOGIC;

    signal SC_T: std_logic_vector(7 downto 0);
    signal SC_RST: std_logic;

    signal we_ram: std_logic;

    signal data_rom: std_logic_vector( data_width - 1 downto 0);
    signal addr_rom: std_logic_vector( addr_width - 1 downto 0);
    signal clk_rom: std_logic;

    signal alu_op: std_logic_vector(3 downto 0);
    signal alu_out: std_logic_vector(15 downto 0);
    signal alu_en: std_logic;

    TYPE State_type IS (fetch, decode, read_mem, execute);
    signal current_state: State_Type := fetch;

    signal decoder: STD_LOGIC_VECTOR(5 downto 0);
begin

    COMP_ALU: ALU PORT MAP(
        A => AC, B => DR, output => alu_out, Cout => E_DATA, S => alu_op, enable => alu_en
    );

    COMP_RAM: RAM PORT MAP(
        clk_in => clk,
        we => we_ram,
        addr_in => AR,
        addr_out => AR,
        data_in => AC,
        data_out => DR_DATA
    );

    COMP_ROM: ROM PORT MAP(
        clk => clk,
        addr => PC,
        data => IR_DATA
    );

    COMP_AC: register16 PORT MAP(
        clk => clk,
        d => AC_DATA,
        q => AC,
        rst => AC_RST,
        ld => AC_LOAD,
        inc => AC_INC
    );

    COMP_DR: register16 PORT MAP(
        clk => clk,
        d => DR_DATA,
        q => DR,
        ld => DR_LOAD
    );

    COMP_IR: register16 PORT MAP(
        clk => clk,
        d => IR_DATA,
        q => IR,
        ld => IR_LOAD
    );

    COMP_PC: register10 PORT MAP(
        clk => clk,
        d => PC_DATA,
        q => PC,
        ld => PC_LOAD,
        inc => PC_INC
    );

    COMP_AR: register10 PORT MAP(
        clk => clk,
        d => AR_DATA,
        q => AR,
        ld => AR_LOAD
    );

    COMP_E: flipflop PORT MAP(
        clk => clk,
        d => E_DATA,
        q => E,
        rst => E_RST,
        ld => E_LOAD
    );

    COMP_SC: count8 PORT MAP(
        clk => clk,
        RST => SC_RST,
        DOUT => SC_T
    );

    AR_LOAD <= '0';
    PC_LOAD <= '0';
    AC_LOAD <= '0';
    DR_LOAD <= '0';
    IR_LOAD <= '0';
    AR_DATA <= IR(9 downto 0);
    decoder <= IR(15 downto 10);

    clockprocess : process(clk)
    begin 
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= fetch;
                SC_RST <= '1';
            end if;
        end if;
        if falling_edge(clk) then
            SC_RST <= '0';
        end if;
    end process;

    state_logic: process (current_state, clk, SC_T)
    begin
        CASE current_state IS
            when fetch =>
                if rising_edge(SC_T(0)) then    
                    AR_LOAD <= '1';
                end if;
                if rising_edge(SC_T(1)) then
                    PC_INC <= '1';
                    alu_en <= '0';
                    we_ram <= '0';
                end if;
                if falling_edge(SC_T(1)) then
                    PC_INC <= '0';
                    AR_LOAD <= '0';
                    current_state <= decode;
                end if;
            when decode =>
                case decoder is
                    when "000001" | "000010" | "000011" | "000100"|"010000"|"100000"  => 
                        current_state <= read_mem;
                    when "000101"|"000110"|"000111"|"001000"|"001001"|"001010"|"001011"|"001100"|"001101"|"001110"|"001111" => 
                        current_state <= execute;                        
                    when others =>
                        current_state <= fetch;
                end case;
            when read_mem =>
                if rising_edge(SC_T(2)) then
                    DR_LOAD <= '1';
                end if;
                if falling_edge(SC_T(2)) then
                    DR_LOAD <= '0';
                    current_state <= execute;
                end if;
            when execute =>
                case decoder is
                    when "000001" => -- AND
                        alu_op <= "1010"; 
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(3)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(3)) then
                            AC_LOAD <= '0';
                        end if;
                    when "000010" => -- STORE
                        if rising_edge(SC_T(2)) then
                            we_ram <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            we_ram <= '0';
                        end if;
                    when "000011" => -- LOAD
                        AC_DATA <= DR;
                        if rising_edge(SC_T(3)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(3)) then
                            AC_LOAD <= '0';
                        end if;
                    when "000100" => -- ADD
                        alu_op <= "0001";
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(3)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(3)) then
                            AC_LOAD <= '0';
                        end if;
                    when "000101" => -- Increment AC
                        if rising_edge(SC_T(2)) then
                            AC_INC <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_INC <= '0';
                        end if;
                    when "000110" => -- Clear AC
                        if rising_edge(SC_T(2)) then
                            AC_RST <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_RST <= '0';
                        end if;
                    when "000111" => -- Clear E
                        if rising_edge(SC_T(2)) then
                            E_RST <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            E_RST <= '0';
                        end if;
                    when "001000" => -- Circular Left Shift
                        alu_op <= "0110";
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(2)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_LOAD <= '0';
                        end if;
                    when "001001" => -- Circular Right Shift
                        alu_op <= "0111";
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(2)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_LOAD <= '0';
                        end if;
                    when "001010" => -- SPA
                        if (rising_edge(SC_T(2)) and AC(15) = '0') then
                            PC_INC <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            PC_INC <= '0';
                        end if;
                    when "001011" => -- SNA
                        if (rising_edge(SC_T(2)) and AC(15) = '1') then
                            PC_INC <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            PC_INC <= '0';
                        end if;
                    when "001100" => -- SZE
                        if (rising_edge(SC_T(2)) and E = '0') then
                            PC_INC <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            PC_INC <= '0';
                        end if;
                    when "001101" => -- SZA
                        if (rising_edge(SC_T(2)) and AC = "0000000000000000") then
                            PC_INC <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            PC_INC <= '0';
                        end if;
                    when "001110" => -- linear Left Shift
                        alu_op <= "0100";
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(2)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_LOAD <= '0';
                        end if;
                    when "001111" => -- Linear Right Shift
                        alu_op <= "0101";
                        alu_en <= '1';
                        AC_DATA <= alu_out;
                        if rising_edge(SC_T(2)) then
                            AC_LOAD <= '1';
                        end if;
                        if falling_edge(SC_T(2)) then
                            AC_LOAD <= '0';
                        end if;
                    --when "010000" =>
                        -- fuck you ...
                    --when "100000" =>
                        -- fuck you ...
                    when others =>
                        null;
                end case;
            current_state <= fetch;
        END CASE;
    END PROCESS;

end Behavioral;