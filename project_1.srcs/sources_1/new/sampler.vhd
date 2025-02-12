library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.myPackage.all;
use work.fixed_pkg.all;

entity sampler is
    port(
    input : in std_logic_vector(15 downto 0);
    en : in std_logic;
    clk : in std_logic;
    sample_out_1 : out sfixed(7 downto -8);
    sample_out_2 : out sfixed(7 downto -8);
    sample_out_3 : out sfixed(7 downto -8);
    sample_out_4 : out sfixed(7 downto -8);
    sample_out_5 : out sfixed(7 downto -8);
    sample_out_6 : out sfixed(7 downto -8);
    sample_out_7 : out sfixed(7 downto -8);
    sample_out_8 : out sfixed(7 downto -8));
end sampler;

architecture Behavioral of sampler is
    signal randomArray1 : std_logic_vector(15 downto 0) := "1100110011011101";
    signal randomArray2 : std_logic_vector(15 downto 0) := "1001011010100101";
    
    signal count : integer := 0;
    signal input_sfixed : sfixed(7 downto -8) := (others => '0');
    signal sample_out_sig_1, sample_out_sig_2, sample_out_sig_3, sample_out_sig_4 : sfixed(7 downto -8) := (others => '0');
    signal sample_out_sig_5, sample_out_sig_6, sample_out_sig_7, sample_out_sig_8 : sfixed(7 downto -8) := (others => '0');

begin
sample_out_1 <= sample_out_sig_1;
sample_out_2 <= sample_out_sig_2;
sample_out_3 <= sample_out_sig_3;
sample_out_4 <= sample_out_sig_4;
sample_out_5 <= sample_out_sig_5;
sample_out_6 <= sample_out_sig_6;
sample_out_7 <= sample_out_sig_7;
sample_out_8 <= sample_out_sig_8;



input_sfixed <= to_sfixed(input, 7, -8);
randomizer1: process(clk) begin
    if rising_edge(clk) then
        if (en = '1') then
            randomArray1(15 downto 1) <= randomArray1(14 downto 0);
            randomArray1(0) <= randomArray2(14) xor randomArray1(1) xor randomArray1(12);
        end if;   
    end if;   
end process;

randomizer2: process(clk) begin
    if rising_edge(clk) then
        if (en = '1') then
            randomArray2(15 downto 1) <= randomArray2(14 downto 0);
            randomArray2(0) <= randomArray1(15) xor randomArray2(1) xor randomArray2(8);
        end if;   
    end if;   
end process;

----------------Sampler----------------------------

sample1 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray1(5) = '1' and randomArray1(8) = '1' and randomArray1(1) = '0') and en = '1') then
            sample_out_sig_1 <= input_sfixed;
        else
            sample_out_sig_1 <= (others => '0');
        end if;   
    end if;
end process;
        
sample2 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray2(5) = '1' and randomArray2(8) = '1' and randomArray2(1) = '0') and en = '1') then
            sample_out_sig_2 <= input_sfixed;
        else
            sample_out_sig_2 <= (others => '0');
        end if;   
    end if;
end process;

sample3 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray1(4) = '1' and randomArray2(5) = '1' and randomArray1(9) = '0') and en = '1') then
            sample_out_sig_3 <= input_sfixed;
        else
            sample_out_sig_3 <= (others => '0');
        end if;   
    end if;
end process;

sample4 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray2(1) = '1' and randomArray1(12) = '1' and randomArray1(3) = '0') and en = '1') then
            sample_out_sig_4 <= input_sfixed;
        else
            sample_out_sig_4 <= (others => '0');
        end if;   
    end if;
end process;

sample5 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray2(4) = '1' and randomArray1(5) = '1' and randomArray2(9) = '0') and en = '1') then
            sample_out_sig_5 <= input_sfixed;
        else
            sample_out_sig_5 <= (others => '0');
        end if;   
    end if;
end process;

sample6 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray1(15) = '1' and randomArray1(12) = '1' and randomArray1(2) = '0') and en = '1') then
            sample_out_sig_6 <= input_sfixed;
        else
            sample_out_sig_6 <= (others => '0');
        end if;   
    end if;
end process;

sample7 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray2(13) = '1' and randomArray2(7) = '1' and randomArray1(6) = '0') and en = '1') then
            sample_out_sig_7 <= input_sfixed;
        else
            sample_out_sig_7 <= (others => '0');
        end if;   
    end if;
end process;

sample8 : process(clk) begin
    if rising_edge(clk) then
        if ((randomArray1(11) = '1' and randomArray2(11) = '1' and randomArray2(14) = '0') and en = '1') then
            sample_out_sig_8 <= input_sfixed;
        else
            sample_out_sig_8 <= (others => '0');
        end if;   
    end if;
end process;
        
end Behavioral;
