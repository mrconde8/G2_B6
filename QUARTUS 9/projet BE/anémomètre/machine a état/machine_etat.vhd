library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity machine_etat is
port(data_in : in std_logic_vector(7 downto 0);
	start_stop,continu	:	in std_logic;
	RAZ	:	in std_logic;
	data_valid : out std_logic;
	data_anemometre	:	out std_logic_vector( 7 downto 0));
																						
end machine_etat;

architecture description of machine_etat is

signal s_1 : std_logic;
signal s_2 : std_logic_vector(7 downto 0);

begin 

process( RAZ,start_stop,continu)

begin
  if(RAZ='1')then
        s_1<='0';
        s_2<=(others=>'0');
        
  else if(continu='1')then
        s_1<='1';
        s_2<=data_in;
  
      else if (start_stop ='1') then
        s_1<='1';
        s_2<=data_in;
        
      else
        s_1<='0';
        s_2<=(others=>'0');
        
  end if;
  end if;
  end if;
  end process;
  data_valid <=s_1;
  data_anemometre <=s_2;  
  
  end architecture; 