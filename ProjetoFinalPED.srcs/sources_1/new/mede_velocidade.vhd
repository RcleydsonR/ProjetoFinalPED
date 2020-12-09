library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mede_velocidade is
    Port ( clk3     : in STD_LOGIC;
           sensor   : in STD_LOGIC;
           speed    : out STD_LOGIC_VECTOR(11 downto 0));
end mede_velocidade;

architecture Behavioral of mede_velocidade is
signal contador : INTEGER:= 0;
signal registrador : INTEGER:= 0;
signal input : std_logic := sensor or clk3;
begin


contagem: process(input)
begin
    if(rising_edge(input)) then
    if(clk3 = '1') then
        registrador <= contador*60/8;
        contador <= 0;
    elsif(sensor = '1') then
        contador <= contador + 1;
    end if;
    end if;
end process contagem;

speed <= STD_LOGIC_VECTOR(TO_UNSIGNED(registrador,speed'length));

end Behavioral;
