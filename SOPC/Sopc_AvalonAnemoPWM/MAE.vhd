library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MAE is
	port (
		raz_n : in std_logic;
		clk : in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		start_stop : in std_logic;
		acq : in std_logic ;
		
		data_valid : out std_logic ;
		data_value : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch_MAE of MAE IS

	signal etat : std_logic_vector(2 downto 0);
	signal va : std_logic_vector(7 downto 0);

	begin

	switch : process (clk, raz_n, start_stop, acq)
	begin
	if raz_n = '0' then
		va <= (others => '0');
		data_valid <= '0';
	elsif rising_edge(clk) then
		if etat = 0 then
			va <= data_in;
			data_valid <= '1';
		end if;
		if etat = 1 then
			if acq = '0' then
				va <= data_in;
				data_valid <= '1';
			else
				data_valid <= '0';
			end if;
		end if;
		if start_stop = '1' then
			etat <= "001";
		else
			etat <= "000";
		end if;
	end if;
	end process;
	data_value <= va;
end arch_MAE ;