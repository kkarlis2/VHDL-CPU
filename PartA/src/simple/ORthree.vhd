library ieee;
use ieee.std_logic_1164.all;

entity ORthree is
	port(in1,in2,in3:in std_logic;
		out1:out std_logic);
end ORthree;


architecture behavioral of ORthree is

begin
	out1 <= in1 or in2 or in3;
end behavioral;