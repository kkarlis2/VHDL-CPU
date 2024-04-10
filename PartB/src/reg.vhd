-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg is
  generic (
    N : positive := 16
  );
  port (
    in1   : in  signed(N - 1 downto 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    out1  : out signed(N - 1 downto 0)
  );
end reg;

architecture structural of reg is

  component DFlipFlop
    generic (
      N : positive := 1
    );
    port (
      in1   : in  std_logic;
      clk   : in  std_logic;
      en    : in  std_logic;
      out1  : out std_logic
    );
  end component;

  signal d : signed(N - 1 downto 0);

begin
  u : for i in 0 to N - 1 generate -- Generate loop for creating multiple instances of the flip-flop
    u_i : DFlipFlop
      generic map (
        N => 1
      )
      port map (
        in1   => in1(i),
        clk   => clk,
        en    => en,
        out1  => d(i)
      );
  end generate u;

  out1 <= signed(d);

end structural;
