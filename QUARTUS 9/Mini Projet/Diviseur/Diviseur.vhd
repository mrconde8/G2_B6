Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


ENTITY Diviseur IS
port( 
	clk_in, A_res : in std_logic;			 
	clk_out:out std_logic
);
END Diviseur;

architecture ar of Diviseur is

	signal div : std_logic_vector(26 downto 0);
	signal sig_clk_out : std_logic;

BEGIN
	process(clk_in,A_res)
	begin
		if(A_res = '1') then clk_out <='0';
						     div <= (others =>'0');
			elsif(clk_in = '1' and clk_in'event)
				then div <= (div+1);
		
				if (div >= 50) then sig_clk_out <= not(sig_clk_out);
										  clk_out <= sig_clk_out;
										  div <= (others =>'0');
				end if;
		end if;
	end process;
END ar;