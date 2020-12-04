library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity principal is
  Port ( clk    : in STD_LOGIC;
         cu     : in STD_LOGIC_VECTOR(6 downto 0);
         sensor : in STD_LOGIC;
         sel    : in STD_LOGIC;
         led    : out STD_LOGIC_VECTOR(15 downto 0);
         pwm_out: out STD_LOGIC;
         an     : out STD_LOGIC_VECTOR(3 downto 0);
         seg    : out STD_LOGIC_VECTOR(6 downto 0));
end principal;

architecture Behavioral of principal is
    signal clk1                             : STD_LOGIC;
    signal clk2                             : STD_LOGIC;
    signal clk3                             : STD_LOGIC;
    signal speed                            : STD_LOGIC_VECTOR(11 downto 0);
    signal dig0_s, dig1_s, dig2_s, dig3_s   : STD_LOGIC_VECTOR(3 downto 0);
    signal k                                : STD_LOGIC_VECTOR(11 downto 0);
    
    component divisor_clk
      Port ( clk : in STD_LOGIC;
             clk1 : out STD_LOGIC;
             clk2 : out STD_LOGIC;
             clk3 : out STD_LOGIC);
    end component;

    component pwm
        Port (clk      : in STD_LOGIC;
              cu       : in STD_LOGIC_VECTOR(6 downto 0);
              pwm_out  : out STD_LOGIC);
    end component;
    
    component mede_velocidade
        Port ( clk3 : in STD_LOGIC;
               sensor : in STD_LOGIC;
               speed : out STD_LOGIC_VECTOR(11 downto 0));
    end component;
      
    component indicador_velocidade
        Port ( clk2 : in STD_LOGIC;
               speed : in STD_LOGIC_VECTOR(11 downto 0);
               led : out STD_LOGIC_VECTOR(15 downto 0));
    end component;  
    
      component display
        Port ( clk2  : in  STD_LOGIC;
               dig0  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig1  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig2  : in  STD_LOGIC_VECTOR(3 downto 0);
               dig3  : in  STD_LOGIC_VECTOR(3 downto 0);
               an    : out STD_LOGIC_VECTOR(3 downto 0);
               seg   : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    component bin_to_bcd_decoder
        Port (binary : in  STD_LOGIC_VECTOR (11 downto 0);
		      dig0   : out STD_LOGIC_VECTOR (3 downto 0);
		      dig1   : out STD_LOGIC_VECTOR (3 downto 0);
		      dig2   : out STD_LOGIC_VECTOR (3 downto 0);
		      dig3   : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MUX
        Port (sel       : in  STD_LOGIC;
              speed     : in  STD_LOGIC_VECTOR(11 downto 0);
              cu        : in  STD_LOGIC_VECTOR(6 downto 0);
              binaryout : out STD_LOGIC_VECTOR(11 downto 0));
    end component;
begin

    C1: divisor_clk            port map (clk => clk, clk1 => clk1, clk2 => clk2, clk3 => clk3);
    C2: pwm                    port map (clk => clk1, cu => cu, pwm_out => pwm_out);
    C3: mede_velocidade        port map (clk3 => clk3, sensor => sensor, speed => speed);
    C4: indicador_velocidade   port map (clk2 => clk2, speed => speed, led => led);
    C5: display                port map (clk2 => clk2, dig0 => dig0_s, dig1 => dig1_s, dig2 => dig2_s, dig3 => dig3_s, an => an, seg => seg);
    C6: bin_to_bcd_decoder     port map (binary => k, dig0 => dig0_s, dig1 => dig1_s, dig2 => dig2_s, dig3 => dig3_s);
    C7: MUX                    port map (sel => sel, speed => speed, cu => cu, binaryout => k);  
end Behavioral;
