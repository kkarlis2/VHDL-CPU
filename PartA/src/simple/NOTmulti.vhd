library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity NOTmulti is
	port(in1:in signed(15 downto 0);
		out1:out signed(15 downto 0));
end NOTmulti;

architecture behavioral of NOTmulti is

begin 	
	
	process(in1)
	
	begin
		if in1 = "0000000000000000" then
			out1 <= "0000000000000001"; --if input is zero
		else
			out1 <= "0000000000000000"; --if input is not 0
		end if;
	end process;
end behavioral;