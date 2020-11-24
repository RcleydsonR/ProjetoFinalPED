library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity indicaVelocidade is
    Port ( clk2 : in STD_LOGIC;
           speed : in STD_LOGIC_VECTOR(11 downto 0);
           led : out STD_LOGIC_VECTOR(15 downto 0));
end indicaVelocidade;

architecture Behavioral of indicaVelocidade is
begin

end Behavioral;
