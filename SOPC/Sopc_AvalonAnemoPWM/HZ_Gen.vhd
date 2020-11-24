library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity HZ_Gen is
	port (
		clk : in std_logic;
		reset_n : in std_logic;
		f_out : out std_logic
	);
end entity;

architecture arch_divider of HZ_Gen IS 
	signal counter : std_logic_vector (32 downto 0);
	signal status : std_logic;
	
	begin
	    HZ_Gen: process (clk, reset_n) 
		begin
		if reset_n = '0' then
			counter <= (others => '0');
			status <= '0';
		elsif clk'event and clk = '1' then
			if counter >= 50000000 then -- gene_Mhz(25) 50 -- gene_10Mhz (counter<=2500000 then _50000)
				counter <= (others => '0');
				status <= not status;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	f_out <= status;
	
end arch_divider ;