-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
  generic (
    N : positive := 1
  );
  port (
    in1     : in  std_logic;
    clk   : in  std_logic;
    en    : in  std_logic;
    out1   : out std_logic
  );
end entity DFlipFlop;

architecture structural of DFlipFlop is
  component NOTone
    port (
      in1  : in  std_logic;
      out1 : out std_logic
    );
  end component;

  component ANDtwo
    port (
      in1  : in  std_logic;
      in2  : in  std_logic;
      out1 : out std_logic
    );
  end component;

  component NANDtwo
    port (
      in1  : in  std_logic;
      in2  : in  std_logic;
      out1 : out std_logic
    );
  end component;

  signal u0, u1, u2, u3, u4, u5, u6, u7, u8 : std_logic;
begin
  c0 : NANDtwo port map(u5, u1, u0);
  c1 : NANDtwo port map(u0, u8, u1);
  c2 : ANDtwo port map(u5, u1, u2);
  c3 : ANDtwo port map(u8, u2, u3);
  c4 : NOTone port map(u3, u4);
  c5 : NANDtwo port map(in1, u4, u5); -- Updated input to d
  c6 : NANDtwo port map(u1, u7, u6);
  c7 : NANDtwo port map(u8, u4, u7);
  c8 : ANDtwo port map(clk, en, u8);
  c9 : ANDtwo port map(u6, u8, out1); -- Updated output to q
end structural;
