-------------CREDITS------------
--KARAGIANNIS GEORGIOS (3190074)
--KARLIS KONSTANTINOS (3190077)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
    port (
        OpCode: in std_logic_vector(3 downto 0);
        Funct: in std_logic_vector(2 downto 0);
        IF_ID_FLUSH: in std_logic;
        isBranch,isJReg,isJType,isLdWord,isMPFC, isRType, isReadDigit,isStWord, isWriteDigit  : out std_logic
    );
end control;

architecture behavioral of control is
begin

    process (IF_ID_FLUSH, Funct, OpCode) 
    begin
        if (IF_ID_FLUSH = '1') then
            isMPFC <= '0';
            isJType <= '0';
            isReadDigit <= '0';
            isWriteDigit<= '0';
            isRType <= '0';
            isLdWord <= '0';
            isStWord <= '0';
            isBranch <= '0';
            isJReg <= '0';
        elsif (IF_ID_FLUSH = '0') then
            case OpCode is
                when "0000" =>
                    isRType <= '1';
                    if (Funct = "111") then
                        isMPFC <= '1';
                    else
                        isMPFC <= '0';
                    end if;
                    
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "0001" =>
                    isLdWord <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "0010" =>
                    isStWord <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "0100" =>
                    isBranch <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "0110" =>
                    isReadDigit <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "0111" =>
                    isWriteDigit<= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isJType <= '0';
                    isJReg <= '0';
                    
                when "1111" =>
                    isJType <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJReg <= '0';
                    
                when "1101" =>
                    isJReg <= '1';
                    
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    
                when others =>
                    isRType <= '0';
                    isMPFC <= '0';
                    isLdWord <= '0';
                    isStWord <= '0';
                    isBranch <= '0';
                    isReadDigit <= '0';
                    isWriteDigit<= '0';
                    isJType <= '0';
                    isJReg <= '0';
            end case;
        end if;
    end process;

end architecture behavioral;
