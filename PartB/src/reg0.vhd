-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg0 is
  generic (
    N : positive := 16
  );
  port (
    in1   : in  signed(N - 1 downto 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    out1  : out signed(N - 1 downto 0)
  );
end reg0;

architecture structural of reg0 is

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

  signal d : std_logic_vector(N - 1 downto 0);

begin
  u : for i in 0 to N - 1 generate
    u_inst : DFlipFlop
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

  out1 <= (others => '0'); -- Output constant 0

end structural;
