----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 04:00:20 PM
-- Design Name: 
-- Module Name: pipelining - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipelining is
    Port ( CLOCK    : in  STD_LOGIC;
           RESET    : in  STD_LOGIC;
           A        : in  STD_LOGIC_VECTOR (59 downto 0);
           B        : in  STD_LOGIC_VECTOR (59 downto 0);
           COMP_OUT : out STD_LOGIC);
end pipelining;

architecture Behavioral of pipelining is

    signal A_sig : STD_LOGIC_VECTOR (59 downto 0) ;
    signal B_sig : STD_LOGIC_VECTOR (59 downto 0) ;

begin

    sync_in : process(CLOCK) begin
        if rising_edge(CLOCK) then
            if RESET = '1' then   
                A_sig <= (others => '0');
                B_sig <= (others => '0');
            else
                A_sig <= A;
                B_sig <= B;
            end if; 
        end if;
    end process;

    comparison : process(CLOCK) begin
        if rising_edge(CLOCK) then
            if RESET = '1' then   
                COMP_OUT <= '0';
            elsif A_sig = B_sig then
                    COMP_OUT <= '1';
                else
                    COMP_OUT <= '0';
            end if;
        end if;
    end process;

end Behavioral;
