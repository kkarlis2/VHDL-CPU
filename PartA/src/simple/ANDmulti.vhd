library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ANDmulti is
    port (
        in1 : in signed(15 downto 0);
        in2 : in signed(15 downto 0);
        out1 : out signed(15 downto 0)
    );
end entity ANDmulti;

architecture behavioral of ANDmulti is
begin
    out1 <= in1 and in2;
end architecture behavioral;
