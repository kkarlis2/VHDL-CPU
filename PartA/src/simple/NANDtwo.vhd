library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity NANDtwo is
	port(in1,in2:in std_logic;
		out1:out std_logic);
end NANDtwo;


architecture behavioral of NANDtwo is

begin

	out1 <= not(in1 and in2);

end behavioral;