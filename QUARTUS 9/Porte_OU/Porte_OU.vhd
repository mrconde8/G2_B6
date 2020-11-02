library ieee;
Use ieee.std_logic_1164.all;

entity Porte_OU is 
				Port(	A,B :in std_logic;
						c:out std_logic);

end Porte_OU;
architecture DESCRIPTION of Porte_OU is 
begin
	c <= A or B;
	
end DESCRIPTION;