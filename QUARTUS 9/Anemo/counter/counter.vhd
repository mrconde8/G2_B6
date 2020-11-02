library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter is
	port (
		reset_n : in std_logic;
		fin_count : in std_logic;
		f_anemo : in std_logic;
		speed : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch_counter of counter IS 

	signal count : std_logic_vector (7 downto 0);
	
	begin
	counter: process (reset_n, fin_count, f_anemo) 
	begin
		if reset_n = '0' then
			count <= (others => '0');
		elsif f_anemo = '1' and f_anemo'event then
			count <= count + 1;
			if fin_count = '1' then
				speed <= count;
				count <= (others => '0');
			end if;
		end if;
	end process;
end arch_counter ;