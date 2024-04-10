library ieee;
use ieee.std_logic_1164.all;

entity XORthree is
	port(in1,in2,in3:in std_logic;
		out1:out std_logic);
end XORthree;


architecture behavioral of XORthree is

begin
	out1 <= in1 xor in2 xor in3;
end behavioral;