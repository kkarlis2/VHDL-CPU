library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ORtwo is
	port(in1,in2:in std_logic;
		out1:out std_logic);
end ORtwo;


architecture behavioral of ORtwo is

begin
	
	out1 <= in1 or in2;

end behavioral;