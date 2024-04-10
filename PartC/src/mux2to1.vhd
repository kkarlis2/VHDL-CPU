-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2to1 is
    generic (
        N:integer := 1
    );
    port (
        in1,in2: in signed(N-1 downto 0);
        opcode: in std_logic;
        out1: out signed(N-1 downto 0)
    );
end entity mux2to1;

architecture behavioral of mux2to1 is
begin
    process (in1,in2,opcode)
    begin
        if opcode = '0' then
            out1 <= in1;
        else
            out1 <= in2;
        end if;
    end process;
end architecture behavioral;
