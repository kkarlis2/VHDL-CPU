-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regIF_ID is
	generic(
		n : integer := 16
	);
	
	port(inPC:in signed(n-1 downto 0);
	     InCommand: in signed(n-1 downto 0);
		  clock: in std_logic;
		  IF_Flush: in std_logic;
		  IF_ID_ENABLE: in std_logic;
		  outPC: out signed(n-1 downto 0);
		  OutCommand: out signed(n-1 downto 0));
end regIF_ID;


architecture behavioral of regIF_ID is
begin

	process(clock,IF_Flush,IF_ID_ENABLE)
	begin
		if(clock='1'and IF_ID_ENABLE='1') then
			outPC <= signed(unsigned(inPC)+2);
			OutCommand <= InCommand;
		elsif clock='1' and IF_Flush='1' then
			outPC <= (OTHERS => '0');
			OutCommand <= (OTHERS => '0');
		end if;
	end process;

end architecture behavioral;