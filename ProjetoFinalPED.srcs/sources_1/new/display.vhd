library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

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
signal dig_index: std_logic_vector(1 downto 0);
signal dig_s: std_logic_vector(3 downto 0);

begin

process(dig_s, dig_index, dig0, dig1, dig2, dig3)
begin 
    case dig_index is
        when "00" =>
            dig_s <= dig0;
            an    <= "0001";
        when "01" =>
            dig_s <= dig1;
            an    <= "0010";
        when "10" =>
            dig_s <= dig2;
            an    <= "0100";
        when "11" =>
            dig_s <= dig3;
            an    <= "1000";
    end case;
end process;
process(dig_s)
begin
  CASE dig_s IS
             when "0000" =>
                seg <= "0000001"; --0
             when "0001" => 
                seg <= "1001111"; --1
             when "0010" =>
                seg <= "0010010"; --2
             when "0011" =>
                seg <= "0000110"; --3
             when "0100" =>
                seg <= "1001100"; --4
             when "0101" =>
                seg <= "0100100"; --5
             when "0110" =>
                seg <= "0100000"; --6
             when "0111" =>
                seg <= "0001111"; --7
             when "1000" => 
                seg <= "0000000"; --8
             when "1001" =>
                seg <= "0000000"; --9 
             when "1010" =>
                seg <= "0001000"; --A
             when "1011" =>
                seg <= "1100000"; --B
             when "1100" =>
                seg <= "0110001"; --C
             when "1101" =>
                seg <= "1000010"; --D
             when "1110" =>
                seg <= "0110000"; --E
             when "1111" =>
                seg <= "0111000"; --F
             when others =>
                seg <= "1111111";
  END CASE;
end process;


end Behavioral;
