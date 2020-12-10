-- Nome: Eduardo Afonso Dutra Silva
-- Matricula: 19/0012307

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mede_velocidade_tb is
--  Port ( );
end mede_velocidade_tb;

architecture Behavioral of mede_velocidade_tb is

component mede_velocidade is
    Port ( clk3     : in STD_LOGIC;
           sensor   : in STD_LOGIC;
           speed    : out STD_LOGIC_VECTOR(11 downto 0));
end component;

signal clk3: STD_LOGIC; 
signal sensor: STD_LOGIC; 
signal speed: STD_LOGIC_VECTOR(11 downto 0); 

begin
C1: mede_velocidade        port map (clk3 => clk3, sensor => sensor, speed => speed);

process
begin
    clk3 <= '1';
    wait for 10 ns; 
    clk3 <= '0';
    wait for 1 sec; 
end process;

process
begin
    sensor <= '1';
    wait for 10 ms; 
    sensor <= '0';
    wait for 10 ms; 
end process;
end Behavioral;
