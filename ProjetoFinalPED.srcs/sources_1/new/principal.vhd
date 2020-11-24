library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity principal is
  Port ( clk : in STD_LOGIC;
         cu : in STD_LOGIC;
         sensor : in STD_LOGIC;
         sel : in STD_LOGIC;
         led: out STD_LOGIC_VECTOR(15 downto 0));
end principal;

architecture Behavioral of principal is
    signal clk1 : STD_LOGIC;
    signal clk2 : STD_LOGIC;
    signal clk3 : STD_LOGIC;
    signal speed : STD_LOGIC_VECTOR(11 downto 0);
    
component divisor_clk
  Port ( clk : in STD_LOGIC;
         clk1 : out STD_LOGIC;
         clk2 : out STD_LOGIC;
         clk3 : out STD_LOGIC);
end component;

component medeVelocidade
    Port ( clk3 : in STD_LOGIC;
           sensor : in STD_LOGIC;
           speed : out STD_LOGIC_VECTOR(11 downto 0));
end component;
begin

    C1: divisor_clk port map(clk, clk1, clk2, clk3);
    C3: medeVelocidade port map(clk3, sensor, speed);
end Behavioral;
