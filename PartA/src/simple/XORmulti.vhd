library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity XORmulti is
    port (
        in1 : in signed(15 downto 0);
        in2 : in signed(15 downto 0);
        out1 : out signed(15 downto 0)
    );
end entity XORmulti;

architecture behavioral of XORmulti is
begin
    out1 <= in1 xor in2;
end architecture behavioral;