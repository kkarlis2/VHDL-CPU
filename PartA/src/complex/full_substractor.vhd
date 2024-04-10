library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity full_substractor is
	port(in1,in2:in std_logic;
		bin:in std_logic;		--same as carry in addition
		dif:out std_logic;   --difference
		bout:out std_logic); --same as carry out in addition
end full_substractor;


architecture structural of full_substractor is

component ANDtwo
	port(in1,in2:in std_logic;
		out1:out std_logic);
end component;

component ORthree
	port( in1,in2,in3:in std_logic;
		out1:out std_logic);
end component;

component XORthree
	port(in1,in2,in3:in std_logic;
		out1:out std_logic);
end component;

component NOTone
	port(in1:in std_logic;
		out1:out std_logic);
end component;

	signal notA,and_a,and_b,and_c: std_logic;

begin

	S1:NOTone port map(in1,notA);
	S2:XORthree port map(in1,in2,bin,dif);
	S3:ANDtwo port map(notA,in2,and_a);
	S4:ANDtwo port map(notA,bin,and_b);
	S5:ANDtwo port map(in2,bin,and_c);
	S6:ORthree port map(and_a,and_b,and_c,bout);

end structural;