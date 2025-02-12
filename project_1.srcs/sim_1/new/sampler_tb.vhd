library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.myPackage.all;
use work.fixed_pkg.all;

entity sampler_tb is
end sampler_tb;

architecture tb of sampler_tb is
    signal clk_tb : std_logic := '0';
    signal en_tb : std_logic := '1';  -- Always enabled
    signal input_tb : std_logic_vector(15 downto 0);
    signal sample_out_tb_1, sample_out_tb_2, sample_out_tb_3, sample_out_tb_4 : sfixed(7 downto -8);
    signal sample_out_tb_5, sample_out_tb_6, sample_out_tb_7, sample_out_tb_8 : sfixed(7 downto -8);

    -- Clock period definition
    constant clk_period : time := 10 ns;

    component sampler is 
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
        sample_out_8 : out sfixed(7 downto -8)
    );
    end component;
begin

    -- Instantiate the DUT
    uut: sampler
        port map(
            input => input_tb, 
            en => en_tb,
            clk => clk_tb,
            sample_out_1 => sample_out_tb_1,
            sample_out_2 => sample_out_tb_2,
            sample_out_3 => sample_out_tb_3,
            sample_out_4 => sample_out_tb_4,
            sample_out_5 => sample_out_tb_5,
            sample_out_6 => sample_out_tb_6,
            sample_out_7 => sample_out_tb_7,
            sample_out_8 => sample_out_tb_8
        );

    -- Clock process
    clk_process: process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period/2;
            clk_tb <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Spam input with sine wave values
    stim_process: process
    begin
        while true loop
            input_tb <= to_slv(to_sfixed(0.0, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.38, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.71, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.92, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(1.0, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.92, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.71, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.38, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(0.0, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.38, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.71, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.92, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-1.0, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.92, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.71, 7, -8));
            wait for clk_period;
            input_tb <= to_slv(to_sfixed(-0.38, 7, -8));
            wait for clk_period;
        end loop;
    end process;

end tb;
