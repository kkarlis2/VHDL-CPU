-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity dec3to8 is
    Port ( in1 : in  signed (2 downto 0);
           out1 : out  signed (7 downto 0));
end dec3to8;

architecture Behavioral of dec3to8 is
begin
    process(in1) is  -- Process statement to evaluate the input signal
    begin
        case in1 is  
            when "000" => out1 <= "00000001";
            when "001" => out1 <= "00000010";
            when "010" => out1 <= "00000100";
            when "011" => out1 <= "00001000";
            when "100" => out1 <= "00010000";
            when "101" => out1 <= "00100000";
            when "110" => out1 <= "01000000";
            when "111" => out1 <= "10000000";
            when others => out1 <= "00000000";
        end case;
    end process;
end Behavioral;
