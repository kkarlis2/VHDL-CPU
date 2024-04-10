-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity select1 is
	generic(
		N: integer := 16;
		aSize:integer:=3
	);
	
	port(ALUResult,Data: in signed(N-1 downto 0);
	   RegRD,RegRS:in signed(aSize-1 downto 0);
		WriteExternal: in std_logic;
		out2: out signed(N-1 downto 0);
		regaddressout: out signed(aSize-1 downto 0));
end select1;


architecture structural of select1 is
component mux2to1 is
	generic (
        N:integer := 1
    );
    port (
        in1,in2: in signed(N-1 downto 0);
        opcode: in std_logic;
        out1: out signed(N-1 downto 0)
    );
end component mux2to1;
	
begin
	mux_inst1:mux2to1
	 generic map (
        N=>3
    )
    port map (
        in1 => RegRD,
		  in2 => RegRS,
		  opcode => WriteExternal,
		  out1 =>regaddressout
    );
	 
	 mux_inst2:mux2to1
	 generic map (
        N=>16
    )
    port map (
        in1 => ALUResult,
		  in2 => Data,
		  opcode => WriteExternal,
		  out1 =>out2
    );
	 

end architecture structural;