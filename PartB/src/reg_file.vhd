-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity reg_file is
  generic (
    N : positive := 16
  );
  port (
    Read1AD    : in  signed(2 downto 0);
    Read2AD    : in  signed(2 downto 0);
    Read1      : out signed(N - 1 downto 0);
    Read2      : out signed(N - 1 downto 0);
    Write1AD   : in  signed(2 downto 0);
    Write1     : in  signed(N - 1 downto 0);
    ALLout     : out signed(127 downto 0);
    clk        : in  std_logic
  );
end reg_file;

architecture Behavioral of reg_file is

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

  component reg
    generic (
      N : positive := 16
    );
    port (
      in1   : in  signed(N - 1 downto 0);
      clk   : in  std_logic;
      en    : in  std_logic;
      out1  : out signed(N - 1 downto 0)
    );
  end component;

  component reg0
    generic (
      N : positive := 16
    );
    port (
      in1   : in  signed(N - 1 downto 0);
      clk   : in  std_logic;
      en    : in  std_logic;
      out1  : out signed(N - 1 downto 0)
    );
  end component;

  component mux8to1 is
    port (
      in1     : in  signed(15 downto 0);
      in2     : in  signed(15 downto 0);
      in3     : in  signed(15 downto 0);
      in4     : in  signed(15 downto 0);
      in5     : in  signed(15 downto 0);
      in6     : in  signed(15 downto 0);
      in7     : in  signed(15 downto 0);
      in8     : in  signed(15 downto 0);
      opcode  : in  signed(2 downto 0);
      out1    : out signed(15 downto 0)
    );
  end component;

  component dec3to8 is
    port (
      in1   : in  signed(2 downto 0);
      out1  : out signed(7 downto 0)
    );
  end component;

  signal reg_out0, reg_out1, reg_out2, reg_out3, reg_out4, reg_out5, reg_out6, reg_out7 : signed(N - 1 downto 0);
  signal mux_out1, mux_out2 : signed(N - 1 downto 0);
  signal dec_out : signed(7 downto 0);
  signal all_out : signed(127 downto 0);

begin

   dec_inst : dec3to8
    port map (
      in1   => Write1AD,
      out1  => dec_out
    
    );
	 
  reg0_inst : reg0
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(0),
      out1  => reg_out0
    );
	 
	 

  reg_inst1 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(1),
      out1  => reg_out1
    );
	 

  reg_inst2 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(2),
      out1  => reg_out2
    );
	 
	 

  reg_inst3 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(3),
      out1  => reg_out3
    );


  reg_inst4 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(4),
      out1  => reg_out4
    );

 
  reg_inst5 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(5),
      out1  => reg_out5
    );


  reg_inst6 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(6),
      out1  => reg_out6
    );


  reg_inst7 : reg
    generic map (
      N => N
    )
    port map (
      in1   => Write1,
      clk   => clk,
      en    => dec_out(7),
      out1  => reg_out7
    );

  mux_inst1 : mux8to1
    port map (
      in1     => reg_out0,
      in2     => reg_out1,
      in3     => reg_out2,
      in4     => reg_out3,
      in5     => reg_out4,
      in6     => reg_out5,
      in7     => reg_out6,
      in8     => reg_out7,
      opcode  => Read1AD,
      out1    => mux_out1
    );

  mux_inst2 : mux8to1
    port map (
      in1     => reg_out0,
      in2     => reg_out1,
      in3     => reg_out2,
      in4     => reg_out3,
      in5     => reg_out4,
      in6     => reg_out5,
      in7     => reg_out6,
      in8     => reg_out7,
      opcode  => Read2AD,
      out1    => mux_out2
    );

  

  Read1 <= mux_out1;
  Read2 <= mux_out2;

  ALLout <= reg_out7 & reg_out6 & reg_out5 & reg_out4 & reg_out3 & reg_out2 & reg_out1 & reg_out0;

end Behavioral;

  
  
