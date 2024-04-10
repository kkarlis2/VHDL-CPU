-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regEX_MEM is
	generic(
		N: integer :=16;
		aSize: integer :=3
	);
	
	
	port(clock,isLW,ReadDigit,WriteDigit,WriteEnable: in std_logic;
		RegAD: in signed(aSize-1 downto 0);
		R2Reg, Result: in signed(N-1 downto 0);
		isLW_EXMEM,PrintDigit_EXMEM: out std_logic;
		R2Reg_EXMEM: out signed(N-1 downto 0);
		ReadDigit_EXMEM: out std_logic;
		RegAD_EXMEM: out signed(aSize-1 downto 0);
		Result_EXMEM: out signed(N-1 downto 0);
		WriteEnable_EXMEM: out std_logic);
end regEX_MEM;

architecture behavioral of regEX_MEM is

begin
	process(clock)
	begin
		if(clock='1') then
			isLW_EXMEM <= isLW;
			PrintDigit_EXMEM <= WriteDigit;
			R2Reg_EXMEM <= R2Reg;
			ReadDigit_EXMEM <= ReadDigit;
			RegAD_EXMEM <= RegAD;
			Result_EXMEM <= Result;
			WriteEnable_EXMEM <= WriteEnable;
		end if;
	end process;
end architecture behavioral;