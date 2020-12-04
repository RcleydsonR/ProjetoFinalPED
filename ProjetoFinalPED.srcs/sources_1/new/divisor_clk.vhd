library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divisor_clk is
  Port ( clk  : in STD_LOGIC;
         clk1 : out STD_LOGIC;
         clk2 : out STD_LOGIC;
         clk3 : out STD_LOGIC);
end divisor_clk;

architecture Behavioral of divisor_clk is
    constant CLK_DIV2MHZ: integer := 50; 
    constant CLK_DIV200HZ: integer := 500_000; 
    constant CLK_DIV1HZ: integer := 100_000_000; 
begin
    --Divisor de frequencia do clock para 2 MHz.
        process(clk)
        variable contador2mhz: integer := CLK_DIV2MHZ;
    begin
        if rising_edge(clk) then
            contador2mhz := contador2mhz - 1;
            if (contador2mhz = 0) then
                contador2mhz := CLK_DIV2MHZ;
                clk1 <= '1';
            else
                clk1 <= '0';
            end if;
        end if;    
    end process;
    
    --Divisor de frequencia do clock para 200 Hz.
        process(clk)
        variable contador200hz: integer := CLK_DIV200HZ;
    begin
        if rising_edge(clk) then
            contador200hz := contador200hz - 1;
            if (contador200hz = 0) then
                contador200hz := CLK_DIV200HZ;
                clk2 <= '1';
            else
                clk2 <= '0';
            end if;
        end if;    
    end process;
    
    -- Divisor de frequencia do clock para 1 Hz.
    process(clk)
        variable contador1hz: integer := CLK_DIV1HZ;
    begin
        if rising_edge(clk) then
            contador1hz := contador1hz - 1;
            if (contador1hz = 0) then
                contador1hz := CLK_DIV1HZ;
                clk3 <= '1';
            else
                clk3 <= '0';
            end if;
        end if;    
    end process;
end Behavioral;
