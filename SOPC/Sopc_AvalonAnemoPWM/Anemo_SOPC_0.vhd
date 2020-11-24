-- Anemo_SOPC_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Anemo_SOPC_0 is
	port (
		clk           : in  std_logic                     := '0';             --          clock.clk
		chipselect    : in  std_logic                     := '0';             -- avalon_slave_0.chipselect
		write_n       : in  std_logic                     := '0';             --               .write_n
		address       : in  std_logic                     := '0';             --               .address
		writedata     : in  std_logic_vector(31 downto 0) := (others => '0'); --               .writedata
		readdata      : out std_logic_vector(31 downto 0);                    --               .readdata
		reset_n       : in  std_logic                     := '0';             --          reset.reset_n
		in_freq_anemo : in  std_logic                     := '0'              --    conduit_end.export
	);
end entity Anemo_SOPC_0;

architecture rtl of Anemo_SOPC_0 is
	component Anemo_SOPC is
		port (
			clk           : in  std_logic                     := 'X';             -- clk
			chipselect    : in  std_logic                     := 'X';             -- chipselect
			write_n       : in  std_logic                     := 'X';             -- write_n
			address       : in  std_logic                     := 'X';             -- address
			writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			reset_n       : in  std_logic                     := 'X';             -- reset_n
			in_freq_anemo : in  std_logic                     := 'X'              -- export
		);
	end component Anemo_SOPC;

begin

	anemo_sopc_0 : component Anemo_SOPC
		port map (
			clk           => clk,           --          clock.clk
			chipselect    => chipselect,    -- avalon_slave_0.chipselect
			write_n       => write_n,       --               .write_n
			address       => address,       --               .address
			writedata     => writedata,     --               .writedata
			readdata      => readdata,      --               .readdata
			reset_n       => reset_n,       --          reset.reset_n
			in_freq_anemo => in_freq_anemo  --    conduit_end.export
		);

end architecture rtl; -- of Anemo_SOPC_0
