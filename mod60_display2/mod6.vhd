library IEEE;																	
use IEEE.std_logic_1164.all;

ENTITY mod6 IS
PORT ( clock, enable	:IN BIT;
		 --q					:OUT INTEGER RANGE 0 TO 5;
		 at,bt,ct,dt,et,ft,gt		:OUT BIT;		--display dezenas
		 tc				:OUT BIT
);
END mod6;

ARCHITECTURE ARCH OF mod6 IS
BEGIN
	PROCESS (clock)
	VARIABLE count : INTEGER RANGE 0 TO 5;
	VARIABLE segments_t		: BIT_VECTOR (0 TO 6);
	BEGIN
		IF (clock ='1' AND clock'event) THEN
			IF enable =  '1' THEN
				IF count < 5 THEN
					count := count +1;
				ELSE 
					count := 0;
				END IF;
			END IF;
		END IF;
		IF (count = 5) AND (enable = '1') THEN
			tc <= '1';
		ELSE tc <= '0';
		END IF;
		--q <= count;
		
		
		CASE count IS
				WHEN			0 => segments_t := "0000001";
				WHEN			1 => segments_t := "1001111";
				WHEN			2 => segments_t := "0010010";
				WHEN			3 => segments_t := "0000110";
				WHEN			4 => segments_t := "1001100";
				WHEN			5 => segments_t := "0100100";
			--	WHEN			6 => segments_t := "1100000";

				WHEN OTHERS	  => segments_t := "1111111";
			END CASE;
			
	at <= segments_t(0);
	bt <= segments_t(1);
	ct <= segments_t(2);
	dt <= segments_t(3);
	et <= segments_t(4);
	ft <= segments_t(5);
	gt <= segments_t(6);
		
	END PROCESS;
END ARCH;