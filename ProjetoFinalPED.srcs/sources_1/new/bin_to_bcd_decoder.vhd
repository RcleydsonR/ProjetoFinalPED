----------------------------------------------------------------------------------
-- Company: UnB
-- Engineer: Guillermo Alvarez Bestard
-- 
-- Create Date: 28.10.2018 13:41:10
-- Design Name: Binary to Decimal BCD decoder
-- Module Name: bin_to_bcd_decoder - Behavioral
-- Project Name: Controle de um motor CC e medição da velocidade de rotação com método estroboscópico 
-- Target Devices: Basys3
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_to_bcd_decoder is
	Port (binary : in  std_logic_vector (11 downto 0); -- binary number
		  dig0   : out std_logic_vector (3 downto 0);  -- rigth digit
		  dig1   : out std_logic_vector (3 downto 0);  -- middle right digit
		  dig2   : out std_logic_vector (3 downto 0);  -- middle left digit
		  dig3   : out std_logic_vector (3 downto 0));  -- left digit
end bin_to_bcd_decoder;

architecture Behavioral of bin_to_bcd_decoder is

begin

	process (binary)
          -- Internal variable for storing bits
          variable shift : unsigned(27 downto 0);
          -- Alias for parts of shift register
          alias bin is shift(11 downto 0);
          alias d0 is shift(bin'Length+3  downto bin'Length+0);
          alias d1 is shift(bin'Length+7  downto bin'Length+4);
          alias d2 is shift(bin'Length+11 downto bin'Length+8);
          alias d3 is shift(bin'Length+15 downto bin'Length+12);
	begin
		-- Clear previous number and store new number in shift register
		bin := unsigned(binary);
		d0 := X"0";
		d1 := X"0";
		d2 := X"0";
		d3 := X"0";

		-- Loop bin'Length times
		for i in 1 to bin'Length loop
			-- Check if any digit is greater than or equal to 5
			if d0 >= 5 then
				d0 := d0 + 3;
			end if;
			if d1 >= 5 then
				d1 := d1 + 3;
			end if;
			if d2 >= 5 then
				d2 := d2 + 3;
			end if;
			if d3 >= 5 then
				d3 := d3 + 3;
			end if;
			-- Shift entire register left once
			shift := shift_left(shift, 1);
		end loop;
		
		-- Push decimal numbers to output
		dig3 <= std_logic_vector(d3);
		dig2 <= std_logic_vector(d2);
		dig1 <= std_logic_vector(d1);
		dig0 <= std_logic_vector(d0);
	end process;

end Behavioral;
