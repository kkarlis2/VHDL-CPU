-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regID_EX is
	generic( N: integer :=16;
	         aSize: integer:=3);
	
	port(ALUFunc:in signed(3 downto 0);
		  clock:in std_logic;
		  immediateIn:in signed(N-1 downto 0);
		  isBranch,isEOR,isJR,isJump,isLW,isMFPC,isR,isReadDigit,isSW,isWriteDigit,wasJump:in std_logic;
		  jumpShort: in signed(11 downto 0);
		  R1AD,R2AD: in signed(aSize-1 downto 0);
		  R1Reg,R2Reg: in signed(N-1 downto 0);
		  ALUFunc_IDEX: out signed(3 downto 0);
		  immediate_IDEX:out signed(N-1 downto 0);
		  isBranch_IDEX,isEOR_IDEX,isJR_IDEX,isJump_IDEX,isLW_IDEX,isMFPC_IDEX,isR_IDEX,isReadDigit_IDEX,isSW_IDEX,isWriteDigit_IDEX,wasJump_IDEX:out std_logic;
		  jumpShort_IDEX: out signed(11 downto 0);
		  R1AD_IDEX,R2AD_IDEX: out signed(aSize-1 downto 0);
		  R1Reg_IDEX,R2Reg_IDEX: out signed(N-1 downto 0));	
end regID_EX;


architecture behavioral of regID_EX is

begin

	pc: process(clock)
	begin
		if(clock='1') then
		   ALUFunc_IDEX <= ALUFunc;
			immediate_IDEX <= immediateIn;
			isBranch_IDEX <= isBranch;
			isEOR_IDEX <= isEOR;
			isJR_IDEX <= isJR;
			isJump_IDEX <= isJump;
			isLW_IDEX <= isLW;
			isMFPC_IDEX <= isMFPC;
			isR_IDEX <= isR;
			isReadDigit_IDEX <= isReadDigit;
			isSW_IDEX <= isSW;
			isWriteDigit_IDEX <= isWriteDigit;
			wasJump_IDEX <= wasJump;
			jumpShort_IDEX <= jumpShort;
			R1AD_IDEX <= R1AD;
		   R2AD_IDEX <= R2AD;
			R1Reg_IDEX <= R1Reg;
			R2Reg_IDEX <= R2Reg;
		end if;
	end process pc;

end architecture behavioral;