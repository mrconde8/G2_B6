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
	signal data_anemo : std_logic_vector(7 downto 0);
	
	begin	
	---------- Counter anemo process
	compteur: process (f_anemo, fin_count) 
	begin
		if reset_n = '0' then
			count <= (others => '0');
		elsif rising_edge(f_anemo) then
			count <= count + 1;	
		end if;
		
		if fin_count = '1' then
			count <= (others => '0');
		end if;
	end process;
	
	----------- RAZ counter + memorisation speed
	reset_counter: process (fin_count) 
	begin
		if rising_edge(fin_count) then
			data_anemo <= count;		
		end if;
	end process;
	
	-------------- Actualisation sorties
	speed <= data_anemo;
	
end arch_counter;