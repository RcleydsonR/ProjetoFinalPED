
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity principal is
  Port (led : OUT std_logic);
end principal;

architecture Behavioral of principal is
    signal ola_mundo : std_logic := '1';
begin
    led <= ola_mundo;
end Behavioral;
