--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;

package BOOL_TO_LOGIC is
	 function BOOL_TO_SL(X: boolean) RETURN std_logic;
end BOOL_TO_LOGIC;

package body BOOL_TO_LOGIC is

	function BOOL_TO_SL(X : boolean) return std_logic is
		begin
			if X then
				return '1';
		else
				return '0';
		end if;
		end function BOOL_TO_SL;

end BOOL_TO_LOGIC;
