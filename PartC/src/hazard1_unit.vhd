-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hazard1_unit is
    port (
        inJReg, inPrevJType, inJType, inNextBranch: in std_logic;
        outPrevJType, IF_ID_Flush: out std_logic;
        reg_outJReg_address: out signed(1 downto 0)
    );
end hazard1_unit;

architecture structural of hazard1_unit is

    component mux2to1 is
        generic (
            N: integer := 1
        );
        port (
            in1, in2: in std_logic;
            opcode: in std_logic;
            out1: out std_logic
        );
    end component mux2to1;
    
    signal Orsign, mux_out1, mux_out2, mux_out3: std_logic;

begin

    Orsign <= inJReg or inPrevJType;

    mux_inst1: mux2to1
        generic map (
            N => 1
        )
        port map (
            in1 => '1',
            in2 => Orsign,
            opcode => inNextBranch,
            out1 => mux_out1
        );

    mux_inst2: mux2to1
        generic map (
            N => 1
        )
        port map (
            in1 => '1',
            in2 => mux_out1,
            opcode => inJType,
            out1 => mux_out2
        );

    mux_inst3: mux2to1
        generic map (
            N => 1
        )
        port map (
            in1 => '0',
            in2 => inNextBranch,
            opcode => inJType,
            out1 => mux_out3
        );

    outPrevJType <= inJType;
    IF_ID_Flush <= mux_out2;
    reg_outJReg_address <= inJType & mux_out3;

end architecture structural;
