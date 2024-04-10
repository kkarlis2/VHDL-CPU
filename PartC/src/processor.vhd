-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity processor is 

	port( keyData,fromData,instr:in signed(15 downto 0);
			clock,clock2:in std_logic;
			printEnable,keyEnable,DataWriteFlag:out std_logic;
			dataAD,toData,printCode,printData:out signed(15 downto 0);
			regOUT:out signed(143 downto 0));
end processor;

architecture structural of processor is

component trap_unit  is
		port(opcode: in signed(3 downto 0);
		endOfRunning: out std_logic);
end component trap_unit;

component JRSelector is
	generic(
		n: integer :=16
	);
	
	port(
		jumpAD,branchAD,PCP2ADD: in signed(n-1 downto 0);
		JRopcode: in signed(1 downto 0);
		result: out signed(n-1 downto 0)
	);
end component JRSelector ;

	component mux2to1 is
        generic (
            N: integer := 1
        );
        port (
            in1, in2: in std_logic;
            opcode: in std_logic;
            out1: out std_logic
        );
    end component mux2to1;

component reg is
		port(in1:in signed(15 downto 0);
		clk:in std_logic;
		en:in std_logic;
		out1:out signed(15 downto 0));
end component reg ;
component regMEM_WB is
	generic(
		N: integer :=16;
		aSize: integer :=3
	);
	
	port(RegAddress: in signed(aSize-1 downto 0);
	     Result: in signed(N-1 downto 0);
		  clk: in std_logic;
		  writeAddress: out signed(aSize-1 downto 0);
		  writeData: out signed(N-1 downto 0));
end component regMEM_WB;

component regIF_ID is
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
end component regIF_ID;
component forwarder is
	generic(aSize: integer := 3);
	
	port(regRS_address,regRT_address,RegRD_EX_address,RegRD_MEM_address: in signed(aSize-1 downto 0);
		  ForwarderA,ForwarderB: out signed(1 downto 0));
end component forwarder;
component select1 is
	generic(
		N: integer := 16;
		aSize:integer:=3
	);
	
	port(ALUResult,Data: in signed(N-1 downto 0);
	   RegRD,RegRS:in signed(aSize-1 downto 0);
		WriteExternal: in std_logic;
		out2: out signed(N-1 downto 0);
		regaddressout: out signed(aSize-1 downto 0));
end component select1;
component ALU_control is
	generic (
    OP_BITS : positive := 4
  );
  port (
    opcode   : in  std_logic_vector(OP_BITS-1 downto 0);
    funct    : in  std_logic_vector(2 downto 0);
    ALU_operation: out std_logic_vector(3 downto 0)
  );
end component ALU_control;
component sign_extender is
	generic (
    in_bits : positive := 6;
    out_bits  : positive := 16
  );
  port (
    immediate_in : in  signed(in_bits-1 downto 0);
    extended_out : out signed(out_bits-1 downto 0)
  );
end component sign_extender;
component alu_unit is
	port(in1,in2:in signed(15 downto 0);
		opcode:in std_logic_vector(2 downto 0);
		cin,bin:in std_logic;
		cout,bout:out std_logic;
		--output_final:out signed(15 downto 0));
		out1:out signed(15 downto 0));
end component alu_unit;
component hazard1_unit is
	port (
        inJReg, inPrevJType, inJType, inNextBranch: in std_logic;
        outPrevJType, IF_ID_Flush: out std_logic;
        reg_outJReg_address: out signed(1 downto 0)
    );
end component hazard1_unit;
component Control is
	port (
        OpCode: in std_logic_vector(3 downto 0);
        Funct: in std_logic_vector(2 downto 0);
        IF_ID_FLUSH: in std_logic;
        isBranch,isJReg,isJType,isLdWord,isMPFC, isRType, isReadDigit,isStWord, isWriteDigit  : out std_logic
    );
end component Control;
component reg_file is
	generic (
    N : positive := 16
  );
  port (
    Read1AD    : in  signed(2 downto 0);
    Read2AD    : in  signed(2 downto 0);
    Read1      : out signed(N - 1 downto 0);
    Read2      : out signed(N - 1 downto 0);
    Write1AD   : in  signed(2 downto 0);
    Write1     : in  signed(N - 1 downto 0);
    ALLout     : out signed(127 downto 0);
    clk        : in  std_logic
  );
end component reg_file ;

component regID_EX is
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
end component regID_EX ;
component regEX_MEM is
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
end component regEX_MEM;



begin

end structural;