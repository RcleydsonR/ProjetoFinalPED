library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity indicador_velocidade is
    Port ( clk2     : in STD_LOGIC;
           speed    : in STD_LOGIC_VECTOR(11 downto 0);
           led      : out STD_LOGIC_VECTOR(15 downto 0));
end indicador_velocidade;

architecture Behavioral of indicador_velocidade is
begin

end Behavioral;
