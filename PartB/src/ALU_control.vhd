-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_control is
  generic (
    OP_BITS : positive := 4
  );
  port (
    opcode   : in  std_logic_vector(OP_BITS-1 downto 0);
    funct    : in  std_logic_vector(2 downto 0);
    ALU_operation: out std_logic_vector(3 downto 0)
  );
end ALU_control;

architecture Behavioral of ALU_control is
begin
  process(opcode, funct)
  begin
    if opcode = "0000" then
      -- R-type instruction, select ALU_operation based on funct
      case funct is
        when "000" => ALU_operation <= "0000";  -- Add
        when "001" => ALU_operation <= "0001";  -- Subtract
        when "010" => ALU_operation <= "0010";  -- AND
        when "011" => ALU_operation <= "0011";  -- OR
        when "100" => ALU_operation <= "0100";  -- XOR
        when others => ALU_operation <= "XXXX";  -- Undefined
      end case;
    else
      -- Non R-type instruction, select ALU_operation based on opcode
      case opcode is
        when "0001" => ALU_operation <= "0101";  -- Load
        when "0010" => ALU_operation <= "1000";  -- Store
        when "0011" => ALU_operation <= "0010";  -- Add Immediate
        when "0100" => ALU_operation <= "0011";  -- Subtract Immediate
        when others => ALU_operation <= "XXXX";  -- Undefined
      end case;
    end if;
  end process;
end Behavioral;
