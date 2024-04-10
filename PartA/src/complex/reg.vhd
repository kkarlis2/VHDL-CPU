library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg is
	port(in1:in signed(15 downto 0);
		clk:in std_logic;
		en:in std_logic;
		out1:out signed(15 downto 0));
end reg;

architecture structural of reg is

component flipflop
	port(in1:in std_logic;
		clk:in std_logic;
		en:in std_logic;
		out1:out std_logic);
end component;

	signal d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15: std_logic;

begin
	u0:flipflop port map(in1(0),clk,en,d0);
	u1:flipflop port map(in1(1),clk,en,d1);
	u2:flipflop port map(in1(2),clk,en,d2);
	u3:flipflop port map(in1(3),clk,en,d3);
	u4:flipflop port map(in1(4),clk,en,d4);
	u5:flipflop port map(in1(5),clk,en,d5);
	u6:flipflop port map(in1(6),clk,en,d6);
	u7:flipflop port map(in1(7),clk,en,d7);
	u8:flipflop port map(in1(8),clk,en,d8);
	u9:flipflop port map(in1(9),clk,en,d9);
	u10:flipflop port map(in1(10),clk,en,d10);
	u11:flipflop port map(in1(11),clk,en,d11);
	u12:flipflop port map(in1(12),clk,en,d12);
	u13:flipflop port map(in1(13),clk,en,d13);
	u14:flipflop port map(in1(14),clk,en,d14);
	u15:flipflop port map(in1(15),clk,en,d15);
	
	out1 <= d15&d14&d13&d12&d11&d10&d9&d8&d7&d6&d5&d4&d3&d2&d1&d0;
	
end structural;