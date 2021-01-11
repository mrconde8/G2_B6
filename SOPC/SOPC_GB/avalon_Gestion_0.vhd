-- avalon_Gestion_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity avalon_Gestion_0 is
	port (
		clk        : in  std_logic                     := '0';             --          clock.clk
		chipselect : in  std_logic                     := '0';             -- avalon_slave_0.chipselect
		write_n    : in  std_logic                     := '0';             --               .write_n
		writedata  : in  std_logic_vector(31 downto 0) := (others => '0'); --               .writedata
		address    : in  std_logic_vector(1 downto 0)  := (others => '0'); --               .address
		readdata   : out std_logic_vector(31 downto 0);                    --               .readdata
		reset_n    : in  std_logic                     := '0';             --          reset.reset_n
		BP_Babord  : in  std_logic                     := '0';             --    conduit_end.export
		BP_Tribord : in  std_logic                     := '0';             --  conduit_end_1.export
		BP_STBY    : in  std_logic                     := '0';             --  conduit_end_2.export
		ledBabord  : out std_logic;                                        --  conduit_end_3.export
		ledTribord : out std_logic;                                        --  conduit_end_4.export
		ledSTBY    : out std_logic;                                        --  conduit_end_5.export
		out_bip    : out std_logic                                         --  conduit_end_6.export
	);
end entity avalon_Gestion_0;

architecture rtl of avalon_Gestion_0 is
	component avalon_Gestion is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			chipselect : in  std_logic                     := 'X';             -- chipselect
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			BP_Babord  : in  std_logic                     := 'X';             -- export
			BP_Tribord : in  std_logic                     := 'X';             -- export
			BP_STBY    : in  std_logic                     := 'X';             -- export
			ledBabord  : out std_logic;                                        -- export
			ledTribord : out std_logic;                                        -- export
			ledSTBY    : out std_logic;                                        -- export
			out_bip    : out std_logic                                         -- export
		);
	end component avalon_Gestion;

begin

	avalon_gestion_0 : component avalon_Gestion
		port map (
			clk        => clk,        --          clock.clk
			chipselect => chipselect, -- avalon_slave_0.chipselect
			write_n    => write_n,    --               .write_n
			writedata  => writedata,  --               .writedata
			address    => address,    --               .address
			readdata   => readdata,   --               .readdata
			reset_n    => reset_n,    --          reset.reset_n
			BP_Babord  => BP_Babord,  --    conduit_end.export
			BP_Tribord => BP_Tribord, --  conduit_end_1.export
			BP_STBY    => BP_STBY,    --  conduit_end_2.export
			ledBabord  => ledBabord,  --  conduit_end_3.export
			ledTribord => ledTribord, --  conduit_end_4.export
			ledSTBY    => ledSTBY,    --  conduit_end_5.export
			out_bip    => out_bip     --  conduit_end_6.export
		);

end architecture rtl; -- of avalon_Gestion_0
