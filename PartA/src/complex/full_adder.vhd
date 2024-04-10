library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity full_adder is
	port(in1:in std_logic;
		in2:in std_logic;
		cin:in std_logic;
		sum:out std_logic;
		cout:out std_logic);
end full_adder;

architecture structural of full_adder is


component XORthree
	port(in1,in2,in3:in std_logic;
		out1:out std_logic);
end component;

component ANDtwo
	port(in1,in2:in std_logic;
		out1:out std_logic);
end component;

component ORthree
	port(in1,in2,in3:in std_logic;
		out1:out std_logic);
end component;

	signal s1,s2,s3: std_logic;

begin

	V0:XORthree port map(in1,in2,cin,sum);
	V1:ANDtwo port map(in1,in2,s1);
	V2:ANDtwo port map(in1,cin,s2);
	V3:ANDtwo port map(in2,cin,s3);
	V4:ORthree port map(s1,s2,s3,cout);

end structural;