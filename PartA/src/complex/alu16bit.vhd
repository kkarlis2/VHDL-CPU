-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu16bit is
	port(input1,input2:in signed(15 downto 0);
		operation:in std_logic_vector(2 downto 0);
		
		clock:in std_logic;
		enable:in std_logic;
		reg3out:out signed(15 downto 0);
		reg1out:out signed(15 downto 0);
		reg2out:out signed(15 downto 0);
		
		cin,bin:in std_logic;
		cout,bout:out std_logic;
		output:out signed(15 downto 0));
end alu16bit;


architecture structural of alu16bit is

component alu_unit
	port(in1,in2:in signed(15 downto 0);
		opcode:in std_logic_vector(2 downto 0);
		cin,bin:in std_logic;
		cout,bout:out std_logic;
		--output_final:out signed(15 downto 0));
		out1:out signed(15 downto 0));
end component;

component reg
	port(in1:in signed(15 downto 0);
		clk:in std_logic;
		en:in std_logic;
		out1:out signed(15 downto 0));
end component;

	signal ro1,ro2,ALUout: signed(15 downto 0);
	

begin 
	
	 
	v0:reg port map(input1,clock,enable,ro1);
	v1:reg port map(input2,clock,enable,ro2);
	v2:alu_unit port map(ro1,ro2,operation,cin,bin,cout,bout,ALUout);
	v3:reg port map(ALUout,clock,enable,reg3out); 
	
	output <= ALUout;
	
	reg1out <= ro1;
	reg2out <= ro2;
	

end structural;