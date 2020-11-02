Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


ENTITY final IS
port( 
	clk_50mhz, reset : in std_logic;			 
	S : out std_logic_vector(6 downto 0)
	);
end final;

Architecture ar of final is
		


component Diviseur 
port( 
	clk_in, A_res : in std_logic			 
	clk_out:out std_logic
);

end component;

component Compteur  
PORT	(CLOCK : in std_logic;
		 Q: inout std_logic_vector(3 downto 0)
		 );
end component;

component BCD 
port
(
	cpt_bcd : in std_logic_vector(3 downto 0);
	deco : out std_logic_vector(6 downto 0);
);
end component;


--signal
signal clk_1hz : std_logic;
signal sout :  std_logic_vector(3 downto 0);


begin
 
udiv : Diviseur PORT MAP (
		clk_in => clk_50mhz;
		A_res => reset;
		clk_1hz => clk_out
		);
		
ucpt : compteur PORT MAP (
		CLOCK => clk_1hz;
		Q => sout
		);
	
udec : BCD PORT MAP (
		cpt_bcd => sout;
		deco => S
		);
end ar;
		
		
		
		
	
		
	

		
		
		
		



		
