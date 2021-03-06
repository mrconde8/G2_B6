LIBRARY ieee;
USE ieee.std_logic_1164.all; 


LIBRARY work;

entity Anemo_SOPC is
PORT
	(
	clk, chipselect, write_n, address, reset_n : in std_logic;
	writedata : in std_logic_vector (31 downto 0); 
	readdata : out std_logic_vector (31 downto 0); 
	in_freq_anemo : in std_logic
	);
END Anemo_SOPC;

ARCHITECTURE bdf_type OF Anemo_SOPC IS

signal data_valid : std_logic;
signal continu 	: std_logic;
signal start_stop, raz_n: std_logic;
signal data_anemo : std_logic_vector(7 downto 0);
signal config : std_lOGIC_VECTOR(2 downto 0);

COMPONENT hz_gen
	PORT(clk : IN STD_LOGIC;
		 raz_n : IN STD_LOGIC;
		 f_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT counter
	PORT(raz_n : IN STD_LOGIC;
		 fin_count : IN STD_LOGIC;
		 f_anemo : IN STD_LOGIC;
		 speed : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mae
	PORT(raz_n : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 start_stop : IN STD_LOGIC;
		 acq : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_valid : OUT STD_LOGIC;
		 data_value : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 

b2v_inst : hz_gen
PORT MAP(clk => clk,
		 raz_n => raz_n,
		 f_out => SYNTHESIZED_WIRE_0);


b2v_inst1 : counter
PORT MAP(raz_n => raz_n,
		 fin_count => SYNTHESIZED_WIRE_0,
		 f_anemo => in_freq_anemo,
		 speed => SYNTHESIZED_WIRE_1);


b2v_inst6 : mae
PORT MAP(raz_n => raz_n,
		 clk => clk,
		 start_stop => start_stop,
		 acq => continu,
		 data_in => SYNTHESIZED_WIRE_1,
		 data_valid => data_valid,
		 data_value => data_anemo);

--interface avalon

	
raz_n <= config(0);
continu <= config(1);
start_stop <= config(2);

registers: process (clk, reset_n)
begin
  if reset_n = '0' then
  config <= (others => '0');
  elsif clk'event and clk = '1' then
    if chipselect ='1' and write_n = '0' then
      if address = '0' then
      config <= (writedata (2 downto 0));
      end if;
    end if;
  end if;
end process registers;
readdata <= X"0000000"&'0'&config when address = '0' 
else X"00000"&"000"&data_valid & data_anemo;


--readdata <= X"0000000" &'0' &data_valid &start_stop &reset_n
--when address = '0'
--else X"00000" &"0"&data_valid &"00" &data_anemo; 

END bdf_type;

