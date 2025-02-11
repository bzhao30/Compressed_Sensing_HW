library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.myPackage.all;
use work.fixed_pkg.all;

entity sensor_tb is
end sensor_tb;

architecture tb of sensor_tb is
    signal clk_tb : std_logic := '0';
    signal en_tb : std_logic := '1';  -- Always enabled
    signal input_tb : sfixed(7 downto -8);
    signal sample_out_tb : sfixed(7 downto -8);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the DUT
    uut: entity work.sensor
        port map(
            input => to_slv(input_tb), 
            en => en_tb,
            clk => clk_tb,
            sample_out => sample_out_tb
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
            input_tb <= to_sfixed(0.0, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.38, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.71, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.92, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(1.0, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.92, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.71, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.38, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(0.0, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.38, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.71, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.92, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-1.0, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.92, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.71, 7, -8);
            wait for clk_period;
            input_tb <= to_sfixed(-0.38, 7, -8);
            wait for clk_period;
        end loop;
    end process;

end tb;
