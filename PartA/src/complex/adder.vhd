library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity adder is
	port(in1,in2:in signed(15 downto 0);
		cin:in std_logic;
		sum:out signed(15 downto 0);
		cout:out std_logic);
end adder;

architecture structural of adder is

component full_adder
	port(in1:in std_logic;
		in2:in std_logic;
		cin:in std_logic;
		sum:out std_logic;
		cout:out std_logic);
end component;

	signal c: signed(15 downto 0);
	

begin
	
	fa0:full_adder port map(in1(0),in2(0),'0',sum(0),c(0));
	fa1:full_adder port map(in1(1),in2(1),c(0),sum(1),c(1));
	fa2:full_adder port map(in1(2),in2(2),c(1),sum(2),c(2));
	fa3:full_adder port map(in1(3),in2(3),c(2),sum(3),c(3));
	fa4:full_adder port map(in1(4),in2(4),c(3),sum(4),c(4));
	fa5:full_adder port map(in1(5),in2(5),c(4),sum(5),c(5));
	fa6:full_adder port map(in1(6),in2(6),c(5),sum(6),c(6));
	fa7:full_adder port map(in1(7),in2(7),c(6),sum(7),c(7));
	fa8:full_adder port map(in1(8),in2(8),c(7),sum(8),c(8));
	fa9:full_adder port map(in1(9),in2(9),c(8),sum(9),c(9));
	fa10:full_adder port map(in1(10),in2(10),c(9),sum(10),c(10));
	fa11:full_adder port map(in1(11),in2(11),c(10),sum(11),c(11));
	fa12:full_adder port map(in1(12),in2(12),c(11),sum(12),c(12));
	fa13:full_adder port map(in1(13),in2(13),c(12),sum(13),c(13));
	fa14:full_adder port map(in1(14),in2(14),c(13),sum(14),c(14));
	fa15:full_adder port map(in1(15),in2(15),c(14),sum(15),c(15));
	
	cout <= c(15);
	

end structural;