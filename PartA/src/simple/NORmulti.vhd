library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity NORmulti is
    port (
        in1 : in signed(15 downto 0);
        in2 : in signed(15 downto 0);
        out1 : out signed(15 downto 0)
    );
end entity NORmulti;

architecture behavioral of NORmulti is
begin
    out1 <= in1 nor in2;
end architecture behavioral;
