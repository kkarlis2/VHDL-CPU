library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
 
 
entity substractor is
	port(in1,in2:in signed(15 downto 0);
		bin:in std_logic;
		dif:out signed(15 downto 0);
		bout:out std_logic);
end substractor;


architecture structural of substractor is

component full_substractor
	port(in1,in2:in std_logic;
		bin:in std_logic;
		dif:out std_logic;
		bout:out std_logic);
end component;

	signal b: signed(15 downto 0);


begin

	fs0:full_substractor port map(in1(0),in2(0),'0',dif(0),b(0));
	fs1:full_substractor port map(in1(1),in2(1),b(0),dif(1),b(1));
	fs2:full_substractor port map(in1(2),in2(2),b(1),dif(2),b(2));
	fs3:full_substractor port map(in1(3),in2(3),b(2),dif(3),b(3));
	fs4:full_substractor port map(in1(4),in2(4),b(3),dif(4),b(4));
	fs5:full_substractor port map(in1(5),in2(5),b(4),dif(5),b(5));
	fs6:full_substractor port map(in1(6),in2(6),b(5),dif(6),b(6));
	fs7:full_substractor port map(in1(7),in2(7),b(6),dif(7),b(7));
	fs8:full_substractor port map(in1(8),in2(8),b(7),dif(8),b(8));
	fs9:full_substractor port map(in1(9),in2(9),b(8),dif(9),b(9));
	fs10:full_substractor port map(in1(10),in2(10),b(9),dif(10),b(10));
	fs11:full_substractor port map(in1(11),in2(11),b(10),dif(11),b(11));
	fs12:full_substractor port map(in1(12),in2(12),b(11),dif(12),b(12));
	fs13:full_substractor port map(in1(13),in2(13),b(12),dif(13),b(13));
	fs14:full_substractor port map(in1(14),in2(14),b(13),dif(14),b(14));
	fs15:full_substractor port map(in1(15),in2(15),b(14),dif(15),b(15));
	
	
	bout <= b(15);


end structural;