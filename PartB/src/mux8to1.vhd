-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8to1 is
	port(in1,in2,in3,in4,in5,in6,in7,in8:in signed(15 downto 0);
		opcode:in signed(2 downto 0);
		out1:out signed(15 downto 0));
end mux8to1;

architecture structural of mux8to1 is

begin
	process(opcode)
		begin
			case opcode is
				when "000" => out1 <= in1;
				when "001" => out1 <= in2;
				when "010" => out1 <= in3;
				when "011" => out1 <= in4;
				when "100" => out1 <= in5;
				when "101" => out1 <= in6;
				when "110" => out1 <= in7;
				when "111" => out1 <= in8;
			end case;
	end process;

end structural;