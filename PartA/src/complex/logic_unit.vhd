library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity logic_unit is
	port(in1:in signed(15 downto 0);
		in2:in signed(15 downto 0);
		andOUT,orOUT,notOUT,xorOUT,norOUT,geqOUT:out signed(15 downto 0));
end logic_unit;

Architecture structural of logic_unit is

component GEQ
	port(in1:in signed(15 downto 0);
		out1:out signed(15 downto 0));
end component;

component ANDmulti
	port(in1,in2:in signed(15 downto 0);
		out1:out signed(15 downto 0));
end component;


component ORmulti
		port(in1,in2:in signed(15 downto 0);
			out1:out signed(15 downto 0));
end component;
		

component NOTmulti
	port(in1:in signed(15 downto 0);
		out1:out signed(15 downto 0));
end component;


component XORmulti 
		port(in1,in2:in signed(15 downto 0);
			out1:out signed(15 downto 0));
end component;

component NORmulti
		port(in1,in2:in signed(15 downto 0);
			out1:out signed(15 downto 0));
end component;



Begin
	V0:ANDmulti port map(in1,in2,andOUT);
	V1:ORmulti port map(in1,in2,orOUT);
	V2:NOTmulti port map(in1,notOUT);
	V3:XORmulti port map(in1,in2,xorOUT);
	V4:NORmulti port map(in1,in2,norOUT);
	V5:GEQ port map(in1,geqOUT);
	
End structural;