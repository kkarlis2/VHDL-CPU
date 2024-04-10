-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sign_extender is
  generic (
    in_bits : positive := 6;
    out_bits  : positive := 16
  );
  port (
    immediate_in : in  signed(in_bits-1 downto 0);
    extended_out : out signed(out_bits-1 downto 0)
  );
end sign_extender;

architecture Behavioral of sign_extender is
begin
  process(immediate_in)
  begin
    extended_out(in_bits-1 downto 0) <= immediate_in;--assign the input bits 
    
    for i in out_bits-1 downto in_bits loop
      extended_out(i) <= immediate_in(in_bits-1); --assign the rest bits based on sign
    end loop;
  end process;
end Behavioral;

