library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity Compteur is 
PORT	(CLOCK : in std_logic;
		 Q: inout std_logic_vector(3downto 0));
end Compteur;

architecture DESCRIPTION of Compteur is
begin 
process (CLOCK)
begin
if(CLOCK= '1' and CLOCK'event)then Q <= Q + 1;
end if;
end process;
end DESCRIPTION;