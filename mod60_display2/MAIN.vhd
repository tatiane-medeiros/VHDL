-- CRIADO POR MARIA TATIANE
library IEEE;																	
use IEEE.std_logic_1164.all;	

ENTITY mod60_display2 IS
PORT ( clk, ena		:IN BIT;
		-- tens				:OUT INTEGER RANGE 0 TO 5;
		-- ones				:OUT INTEGER RANGE 0 TO 9;
		ao,bo,co,do,eo,fo,go		:OUT BIT;		--display unidades
		at,bt,ct,dt,et,ft,gt		:OUT BIT;	--display dezenas
		 tc				:OUT BIT
);
END mod60_display2;
ARCHITECTURE ARCH OF mod60_display2 IS
SIGNAL cascade_wire :BIT;
COMPONENT mod6
	PORT ( clock, enable	:IN BIT;
		 at,bt,ct,dt,et,ft,gt		:OUT BIT;
		 tc				:OUT BIT );
END COMPONENT;
COMPONENT mod10
	PORT( clock, enable :IN BIT ;
		ao,bo,co,do,eo,fo,go		:OUT BIT;
		tc					: OUT BIT );
END COMPONENT;

BEGIN
	MOD_10: mod10
		PORT MAP ( clock => clk,
					  enable => ena,
					 -- q => ones,
					 ao => ao,bo => bo,co => co,do => do,eo => eo,fo => fo,go =>go,
					  tc => cascade_wire);
	MOD_6: mod6
		PORT MAP ( clock => clk,
					  enable => cascade_wire,
					 -- q => tens,
					  at => at,bt => bt,ct => ct,dt => dt,et => et,ft => ft,gt =>gt,
					  tc => tc);
END ARCH;