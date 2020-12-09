library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm is
 Port (clk1      : in STD_LOGIC;
       cu       : in STD_LOGIC_VECTOR(6 downto 0);
       pwm_out  : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
    constant DIV    : unsigned (6 downto 0):= "1100100";
    signal cu_s     : unsigned (6 downto 0) := unsigned(cu);
    signal contador : unsigned(6 downto 0);
    signal load     : std_logic;
begin
    process(clk1)
        variable count : unsigned(6 downto 0) := "0000000";
    begin
        if(rising_edge(clk1)) then
            count := count + 1;
            if(count = DIV) then
                count := "0000000";
                load <= '1';
            else
                load <= '0';
            end if;
            contador <= count;
        end if;
    end process;

    process(load)
    begin
        if(rising_edge(load)) then
            cu_s <= unsigned(cu);
        end if;
    end process;

    process(contador, cu_s)
    begin
        if(contador < cu_s) then
            pwm_out <= '1';
        else 
            pwm_out <= '0';
        end if;
    end process;
end Behavioral;
