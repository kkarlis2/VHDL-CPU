-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity jump_add is
  generic (
    instr_bits : positive := 16;
    jump_bits  : positive := 12;
    out_bits   : positive := 16
  );
  port (
    instrP2AD : in  signed(instr_bits-1 downto 0);
    jumpAD    : in  signed(jump_bits-1 downto 0);
    EjumpAD   : out signed(out_bits-1 downto 0)
  );
end jump_add;

architecture Behavioral of jump_add is
  component sign_extender is
    generic (
      in_bits  : positive := jump_bits;
      out_bits : positive := out_bits
    );
    port (
      immediate_in : in  signed(in_bits-1 downto 0);
      extended_out : out signed(out_bits-1 downto 0)
    );
  end component;

  component adder is
    port (
      in1  : in  signed(out_bits-1 downto 0);
      in2  : in  signed(out_bits-1 downto 0);
      cin  : in  std_logic;
      sum  : out signed(out_bits-1 downto 0);
      cout : out std_logic
    );
  end component;

  signal extended_jumpAD : signed(out_bits-1 downto 0);
  signal adder_out1,adder_out2      : signed(out_bits-1 downto 0);
begin
  sign_extender_inst : sign_extender
    generic map (
      in_bits  => jump_bits,
      out_bits => out_bits
    )
    port map (
      immediate_in => jumpAD,
      extended_out => extended_jumpAD
    );
	 
  adder_inst1:adder
	 port map (
      in1  => extended_jumpAD,
      in2  => extended_jumpAD,
      cin  => '0',
      sum  => adder_out1,
      cout => open
    );
  adder_inst2 : adder
    port map (
      in1  => adder_out1,
      in2  => instrP2AD,
      cin  => '0',
      sum  => adder_out2,
      cout => open
    );

  EjumpAD <= adder_out2;
end Behavioral;
