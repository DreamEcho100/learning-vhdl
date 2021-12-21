-- ------------------------------
-- ------------------------------
-- ------------------------------

-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;

-- entity Switch_LEDs is
--   Port (
--     switch_0 : in STD_LOGIC;
--     switch_1 : in STD_LOGIC;
--     LED_0 : out STD_LOGIC;
--     LED_1 : out STD_LOGIC;
--   );
-- end Switch_LEDs;

-- architecture Behavioral of Switch_LEDs is
--   begin
--     LED_0 <= switch_0;
--     LED_1 <= switch_1;
--   end Behavioral;

-- ------------------------------
-- ------------------------------
-- ------------------------------

-- entity Half_Adder is
--   port (
--     A, B : in BIT;
--     SUM, CARRY : out BIT;
--   );
-- end Half_Adder;

-- architecture Structure_HA of Half_Adder is
--   component XOR1
--     port (
--       P, Q in BIT;
--       R : out BIT;
--     );
--   end component;
  
--   component AND1
--     port (
--       X, Y in BIT;
--       Z : out BIT;
--     );
--   end component;

--   begin
--     X1 : XOR1 port map (A, B, SUM);
--     A1 : AND1 port map (A, B, CARRY);
-- end Structure_HA;

-- ------------------------------
-- ------------------------------
-- ------------------------------

-- entity Half_Adder is
--   port (
--     A, B : in BIT;
--     SUM, CARRY : out BIT;
--   );
-- end Half_Adder;

-- architecture Dataflow_HA of Half_Adder is
--   begin
--     SUM <= A xor B;
--     CARRY <= A and B;
-- end Dataflow_HA;
