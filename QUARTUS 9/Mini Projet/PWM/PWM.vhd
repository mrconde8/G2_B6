library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity PWM is 
port (clk, reset : in std_logic;
	freq, duty : in std_logic_vector (7 downto 0);
	pwm_out, masse : out std_logic);
end PWM;

ARCHITECTURE arch_pwm of PWM Is 
signal counter : std_logic_vector (7 downto 0);
signal pwm_on  : std_logic;

BEGIN
masse <='0';
	divide: process (clk, reset)
	begin
		if reset = '0' then
		counter <= (others => '0');
		elsif clk'event and clk = '1' then
		if counter >= freq then
		counter <= (others => '0');
		else
		counter <= counter + 1;
		end if;
	end if;
end process divide;


compare: process (clk, reset)
	begin
	if reset = '0' then
	pwm_on <= '0';
	elsif clk'event and clk = '1' then
		if counter >= duty then
		pwm_on <= '0';
		else
		pwm_on <= '1';
		end if;
end if;
end process compare;
pwm_out <=pwm_on;
END arch_pwm ;