library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.myPackage.all;
use work.fixed_pkg.all;

entity sensor is
    port(
    input : in std_logic_vector(15 downto 0);
    en : in std_logic;
    clk : in std_logic;
    sample_out : out sfixed(7 downto -8));
end sensor;

architecture Behavioral of sensor is
    signal randomArray : std_logic_vector(15 downto 0) := "1100110011011101";
    signal count : integer := 0;
    signal input_sfixed : sfixed(7 downto -8) := (others => '0');
    signal sample_out_sig : sfixed(7 downto -8) := (others => '0');
begin
sample_out <= sample_out_sig;

input_sfixed <= to_sfixed(input, 7, -8);
randomizer1: process(clk) begin
    if rising_edge(clk) then
        if (en = '1') then
            randomArray(15 downto 1) <= randomArray(14 downto 0);
            randomArray(0) <= randomArray(15) xor randomArray(1) xor randomArray(12) xor randomArray(10);
        end if;   
    end if;   
end process;

sampler : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray(5) = '1' and randomArray(8) = '1' and randomArray(1) = '0') and en = '1') then
            sample_out_sig <= input_sfixed;
        else
            sample_out_sig <= (others => '0');
        end if;   
    end if;
end process;
        
end Behavioral;
