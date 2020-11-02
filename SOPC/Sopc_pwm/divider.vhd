library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity divider is
	port (
		clk : in std_logic;
		reset_n : in std_logic;
		freq : in std_logic_vector(7 downto 0); 
		f_pwm : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch_divider of divider IS 

	signal counter : std_logic_vector (7 downto 0); 
	
	begin
		divide: process (clk, reset_n) 
		begin
		if reset_n = '0' then
			counter <= (others => '0');
		elsif clk'event and clk = '1' then
			if counter >= freq then 
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	f_pwm <= counter;
	
end arch_divider ;