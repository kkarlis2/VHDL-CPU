-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PC is

	port(Input: in signed(15 downto 0);
		Enable,Clock: in std_logic;
		Output: out signed(15 downto 0));

end PC;


architecture behavioral of PC is

begin 

	process(Clock)
	begin
		if(Clock'event and Clock='0') then
			if(Enable='1') then
				Output <= Input;
			end if;
		end if;
	end process;


end architecture behavioral;