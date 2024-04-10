-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regMEM_WB is
	
	generic(
		N: integer :=16;
		aSize: integer :=3
	);
	
	port(RegAddress: in signed(aSize-1 downto 0);
	     Result: in signed(N-1 downto 0);
		  clk: in std_logic;
		  writeAddress: out signed(aSize-1 downto 0);
		  writeData: out signed(N-1 downto 0));
end regMEM_WB;

architecture behavioral of regMEM_WB is

begin
	process(clk)
	begin 
		if(clk='1') then  --rising edge
			writeAddress <= RegAddress;
			writeData <= Result;
		end if;
	end process;
end architecture behavioral;