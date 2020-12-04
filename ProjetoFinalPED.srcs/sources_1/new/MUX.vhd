library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX is 
    Port (sel       : in  STD_LOGIC;
          speed     : in  STD_LOGIC_VECTOR(11 downto 0);
          cu        : in  STD_LOGIC_VECTOR(6 downto 0);
          binaryout : out STD_LOGIC_VECTOR(11 downto 0));
end MUX;

architecture Behavioral of MUX is

signal k: STD_LOGIC_VECTOR(11 downto 0) := "000000000000";
begin

    k <= speed when sel = '0' else "00000" & cu;
    binaryout <= k;
end Behavioral;
