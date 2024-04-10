-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JRSelector is
	generic(
		n: integer :=16
	);
	
	port(
		jumpAD,branchAD,PCP2ADD: in signed(n-1 downto 0);
		JRopcode: in signed(1 downto 0);
		result: out signed(n-1 downto 0)
	);
	 
end JRSelector;


architecture behavioral of JRSelector is

begin

process(JRopcode)
begin 
	case JRopcode is
		when "00" =>
			result <= PCP2ADD;
		when "01" =>
			result <= jumpAD;
		when "10" =>
			result <= branchAD;
		when others => result <= PCP2ADD;
	end case;
end process;


end architecture behavioral;