library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.fixed_pkg.all;

package myPackage is
    type array1D is array(1 downto 0) of sfixed(9 downto -6);
    type matrix is array(1 downto 0) of array1D;
  
    function transpose(A: matrix) return matrix;
    function fixedMultiply(a: sfixed(7 downto -8); b: sfixed(7 downto -8)) return sfixed;

end myPackage;

package body myPackage is    

    function transpose(A: matrix) return matrix is
        variable result: matrix := (others => (others => (to_sfixed(0.0, 7, -8))));
    begin
        for i in 0 to 1 loop
            for j in 0 to 1 loop
                result(j)(i) := A(i)(j);
            end loop;
        end loop;
        return result;	
    end function transpose;  
   
    function fixedMultiply(a: sfixed(7 downto -8); b: sfixed(7 downto -8)) return sfixed is
        variable result: sfixed(7 downto -8);
    begin
        result := resize(a * b, 7, -8);
        return result;
    end function fixedMultiply;

end package body;