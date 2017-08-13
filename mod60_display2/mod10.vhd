library IEEE;																	
use IEEE.std_logic_1164.all;		

ENTITY mod10 IS               --mod 10
PORT( clock, enable :IN BIT ;
		-- q					: OUT INTEGER RANGE 0 TO 9 ;
		ao,bo,co,do,eo,fo,go		:OUT BIT	;	--display unidades
		tc					: OUT BIT
);
END mod10;

ARCHITECTURE ARCH OF mod10 IS
BEGIN
		PROCESS (clock)
		VARIABLE count :INTEGER RANGE 0 TO 9;			
		VARIABLE segments_o : BIT_VECTOR (0 TO 6);

		BEGIN 
			IF (clock = '1' and clock'event) THEN
				IF enable = '1' THEN
					IF count < 9 THEN
						count := count + 1;
					ELSE 
						count := 0 ;
					END IF;
				END IF;
			END IF;
			IF (count = 9) AND (enable = '1') THEN
				tc <= '1';
			ELSE  tc <= '0';
			END IF;
			-- q <= count;
			CASE count IS
				WHEN			0 => segments_o := "0000001";
				WHEN			1 => segments_o := "1001111";
				WHEN			2 => segments_o := "0010010";
				WHEN			3 => segments_o := "0000110";
				WHEN			4 => segments_o := "1001100";
				WHEN			5 => segments_o := "0100100";
				WHEN			6 => segments_o := "1100000";
				WHEN			7 => segments_o := "0001111";
				WHEN			8 => segments_o := "0000000";
				WHEN			9 => segments_o := "0001100";
				WHEN OTHERS	  => segments_o := "1111111";
			END CASE;			
		
	ao <= segments_o(0);
	bo <= segments_o(1);
	co <= segments_o(2);
	do <= segments_o(3);
	eo <= segments_o(4);
	fo <= segments_o(5);
	go <= segments_o(6);
	
		END PROCESS;
END ARCH;