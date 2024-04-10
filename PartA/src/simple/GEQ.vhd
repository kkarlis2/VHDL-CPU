library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity GEQ is
	port(in1:in signed(15 downto 0);
		out1:out signed(15 downto 0));
end GEQ;


architecture structural of GEQ is

begin 

	process(in1)
	
		begin
			if in1(15) = '0' then
				out1 <= "1111111111111111"; --if input is not negative (MSB=0)
			else
				out1 <= "0000000000000000"; --if input is negative (MSB=1)
			end if;
	end process;
end structural;