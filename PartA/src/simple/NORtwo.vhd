library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NORtwo is
	port(in1,in2:in std_logic;
		out1:out std_logic);
end NORtwo;


architecture behavioral of NORtwo is

begin
	
	out1 <= in1 nor in2;

end behavioral;