library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity pwm is
 Port (clk      : in STD_LOGIC;
       cu       : in STD_LOGIC_VECTOR(6 downto 0);
       pwm_out  : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
    constant DIV    : Integer := 100;
    signal cu_s     : integer range 0 to 100 := TO_INTEGER(unsigned(cu));
    signal contador : Integer range 0 to DIV := 0;
    signal load     : std_logic;
begin
    process(clk)
        variable count : Integer range 0 to DIV := 0;
    begin
        if(rising_edge(clk)) then
            count := count + 1;
            if(count = DIV) then
                load <= '1';
                count := 0;
            else
                load <= '0';
            end if;
            contador <= count;
        end if;
    end process;

    process(load)
    begin
        if(rising_edge(load)) then
            cu_s <= TO_INTEGER(unsigned(cu));
        end if;
    end process;

    pwm_out <= '1' WHEN contador < cu_s else '0';
    
end Behavioral;
