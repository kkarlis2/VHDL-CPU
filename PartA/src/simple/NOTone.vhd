library ieee;
use ieee.std_logic_1164.all;

entity NOTone is
	port(in1:in std_logic;
		out1:out std_logic);
end NOTone;


architecture behavioral of NOTone is

begin

	out1 <= not in1;
	
end behavioral;