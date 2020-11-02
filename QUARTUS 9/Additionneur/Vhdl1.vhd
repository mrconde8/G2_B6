library IEEE;
USE ieee.std_logic_1164.all;

ENTITY Additionneur IS PORT 
					(A,B,Cin: IN STD_LOGIC; 
						S,Cout: OUT STD_LOGIC);
END Additionneur;
Architecture ar of Additionneur is
Begin 
			Cout<=(A and B) OR (B and Cin) OR (Cin and A) ;
			S<=A xor B xor Cin;
End ar ;