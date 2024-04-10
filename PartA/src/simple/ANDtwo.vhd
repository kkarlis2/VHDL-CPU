library ieee;
use ieee.std_logic_1164.all;

entity ANDtwo is
	port(in1,in2:in std_logic;
		out1:out std_logic);
end ANDtwo;


architecture behavioral of ANDtwo is

begin
	out1 <= in1 and in2;
end behavioral;