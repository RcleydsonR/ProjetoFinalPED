library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity display is
    Port     ( clk2  : in  STD_LOGIC;
               dig0  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig1  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig2  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig3  : in  STD_LOGIC_VECTOR(3 downto 0);
               an    : out STD_LOGIC_VECTOR(3 downto 0);
               seg   : out STD_LOGIC_VECTOR(6 downto 0));
end display;

architecture Behavioral of display is

begin


end Behavioral;
