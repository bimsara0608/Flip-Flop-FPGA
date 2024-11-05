library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_flipflop is
    Port ( T : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  Q : out  STD_LOGIC);
end T_flipflop;

architecture Behavioral of T_flipflop is
	signal counter: integer :=0;
	signal CLK_devided : STD_LOGIC := '0';
	signal Qn : STD_LOGIC := '0';
begin
    process(CLK)
    begin  
			if CLK' event and CLK = '1' then
            if counter = 50000000 / 2  then
                counter <= 0;
					 CLK_devided <= not CLK_devided;
				else
					counter <= counter + 1;	 
            end if;
        end if;
    end process;
	 
	 
	 process(CLK_devided)
	 begin
        if CLK_devided' event and CLK_devided = '1' then
            if T = '1' then
                Qn <= not Qn;
            end if;
        end if;
    end process;
	 Q <= Qn;
end Behavioral;
