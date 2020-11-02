Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


ENTITY gene_1hz IS
port( 
	clk_50M, RAZ : in std_logic;			 
	gnr_1hz,masse:out std_logic
);
END gene_1hz;

architecture ar of gene_1hz is

	signal div : std_logic_vector(26 downto 0);
	signal sig_clk_out : std_logic;

BEGIN
	masse<='0';
	process(clk_50M,RAZ)
	begin
		if(RAZ = '1') then gnr_1hz <='0';
						     div <= (others =>'0');
			elsif(clk_50M = '1' and clk_50M'event)
				then div <= (div+1);
		
				if (div >= 25000000) then sig_clk_out <= not(sig_clk_out);
										gnr_1hz <= sig_clk_out;
										  div <= (others =>'0');
				end if;
		end if;
	end process;
END ar;