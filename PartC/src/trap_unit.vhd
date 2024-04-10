-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity trap_unit is
	port(opcode: in signed(3 downto 0);
		endOfRunning: out std_logic);
end trap_unit;


architecture behavioral of trap_unit is

begin

	process(opcode)
	begin
		if(opcode="1110") then
			endOfRunning <= '1';
		else
			endOfRunning <= '0';
		end if;
	end process;
	
end architecture behavioral ;
	