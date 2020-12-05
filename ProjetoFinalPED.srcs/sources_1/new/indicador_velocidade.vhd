library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity indicador_velocidade is
    Port ( clk2     : in STD_LOGIC;
           speed    : in STD_LOGIC_VECTOR(11 downto 0);
           led      : out STD_LOGIC_VECTOR(15 downto 0));
end indicador_velocidade;

architecture Behavioral of indicador_velocidade is
    signal aux : unsigned(15 downto 0):= "1000000000000000";
    constant speed_max : INTEGER:= 4095;
    
begin
    led <= STD_LOGIC_VECTOR(aux);
 process(clk2, speed)
    variable count: INTEGER range 0 to speed_max :=speed_max;
    variable speed_aux: INTEGER range 0 to speed_max;
    begin 
        if rising_edge(clk2) then
        speed_aux := TO_INTEGER(unsigned(speed));
            if speed_aux /= 0 then
                count:= count-(8*speed_aux/60);
                if (count <= 0)then
                    count:= speed_max;
                    aux <= rotate_right(aux,1);
                end if;
            end if;
        end if;    
    end process;

end Behavioral;
