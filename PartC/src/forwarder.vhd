-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forwarder is
	generic(aSize: integer := 3);
	
	port(regRS_address,regRT_address,RegRD_EX_address,RegRD_MEM_address: in signed(aSize-1 downto 0);
		  ForwarderA,ForwarderB: out signed(1 downto 0));

end forwarder;


architecture behavioral of forwarder is

begin

	process(RegRD_EX_address,RegRD_MEM_address,regRS_address,regRT_address)
	begin
		--default 
		ForwarderA <= "00"; 
		ForwarderB <= "00"; 
		
		if(regRS_address = RegRD_EX_address) then
			ForwarderA <= "10";  
		elsif (regRS_address = RegRD_MEM_address) then
			ForwarderA <= "01"; 
		end if;
		
		if(regRT_address = RegRD_EX_address) then
			ForwarderB <= "10"; 
		elsif (regRT_address = RegRD_MEM_address) then
			ForwarderB <= "01"; 
		end if;

	end process;
	

end architecture behavioral;
