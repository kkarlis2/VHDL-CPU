library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu_unit is
	port(in1,in2:in signed(15 downto 0);
		opcode:in std_logic_vector(2 downto 0);
		cin,bin:in std_logic;
		cout,bout:out std_logic;
		--output_final:out signed(15 downto 0));
		out1:out signed(15 downto 0));
end alu_unit;

architecture structural of alu_unit is

component logic_unit
	port(in1,in2:in signed(15 downto 0);
		andOUT,orOUT,notOUT,xorOUT,norOUT,geqOUT:out signed(15 downto 0));
end component;

component adder
	port(in1,in2:in signed(15 downto 0);
		cin:in std_logic;
		sum:out signed(15 downto 0);
		cout:out std_logic);
end component;
	
component substractor                                  
	port(in1,in2:in signed(15 downto 0);
		bin:in std_logic;
		dif:out signed(15 downto 0);
		bout:out std_logic);
end component;

component mux8to1
	port(in1,in2,in3,in4,in5,in6,in7,in8:in signed(15 downto 0);
		opcode:in std_logic_vector(2 downto 0);
		out1:out signed(15 downto 0));
end component;



	signal andOUTPUT,orOUTPUT,notOUTPUT,xorOUTPUT,norOUTPUT,geqOUTPUT,summary,difference: signed(15 downto 0);

begin
	
	
	v0:logic_unit port map(in1,in2,andOUTPUT,orOUTPUT,notOUTPUT,xorOUTPUT,norOUTPUT,geqOUTPUT);
	v1:adder port map(in1,in2,cin,summary,cout);
	v2:substractor port map(in1,in2,bin,difference,bout);
	--v3:mux8to1 port map(andOUTPUT,geqOUTPUT,norOUTPUT,notOUTPUT,orOUTPUT,xorOUTPUT,summary,difference,opcode,out1);
	v3:mux8to1 port map(summary,difference,andOUTPUT,orOUTPUT,geqOUTPUT,notOUTPUT,xorOUTPUT,norOUTPUT,opcode,out1);
	
end structural;