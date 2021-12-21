# VHDL

1. What is HDL

2. 5 types of design units **(VHDL)**

3. 3 styles of modeling

## What is HDL

HDL **(Hardware Description Language)**, it is a language with a syntax that helps to describe digital hardware.

In languages like c or c++ you write a program to tell the computer how to process and manipulate the data **this is for software**.

In hardware, there are things like (AND, OR, NOT, XOR, ...) gate, elements like flipflops and de-flipflops, you can them to draw simple circuits, but when you want to draw more complicated ones it will be **harder** and will **consume a lot of time**, from here comes the need for **HDL**.

In here we take and learn about **VHDL**

### What is VHDL

**Very High-Speed Integrated Circuit HDL** you can say it is **VeHSICHDL** or in short **VHDL**.

**VHDL** is a very big language with a lot of syntax that needs a good amount of time to master them, in here we will take about the basics to learn **VHDL** with examples to know the basics to build and understand yours or others **VHDL** programs and be able to design circuits.

## 5 types of design units **(VHDL)**

There is 5 types of design units **(VHDL)** code:

1. Entity

2. Architecture

3. Configuration

4. Package Declaration

5. Package Body

The two most commonly used are **Entity** and **Architecture**

### What is an Entity in VHDL

You can say it is the nameplate of design, it helps you to **specify the inputs and the outputs ports**, and will help you **specify their types**.

```bash
#                -------------
#               |             |
#   switch_0 ---|             |--- LED_0
#               |  circuitX?  |
#   switch_1 ---|             |--- LED_1
#               |             |
#   (inputs)     -------------  (outputs)
```

From the previous figure even though you don't know what is inside the circuitX, you know your inputs (switch_0, switch_1) and outputs (LED_0, LED_1).

And if you know both of these then you can say you know your entity _(you can say you know the members of your house basically the **nameplate**)_.

### What is an Architecture in VHDL

It helps you describe what or how the circuit is going to behave or function.

You can use to say that the input `switch_0` is connected to the output `LED_0` and so on.

```bash
#                -------------
#               |             |
#   switch_0 ---|-------------|--- LED_0
#               |             |
#   switch_1 ---|-------------|--- LED_1
#               |             |
#                -------------
```

### A VHDL code example_1

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Switch_LEDs is
  port (
    switch_0 : in STD_LOGIC;
    switch_1 : in STD_LOGIC;
    LED_0 : out STD_LOGIC;
    LED_1 : out STD_LOGIC;
  );
end Switch_LEDs;

architecture Behavioral of Switch_LEDs is
  begin
    LED_0 <= switch_0;
    LED_1 <= switch_1;
  end Behavioral;
```

Okay, what's going on here?

If you see this for the first time you are probably puzzled, let's take it to step by step first to explain this code.

#### 1- Library IEEE importing

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
```

This is a library we import to use `STD_LOGIC` type form it.

> We can specify our own data types to be globally used in the **package body**

> We will explain more in the future :)

#### 2- Entity declaration

```vhdl
entity Switch_LEDs is
  port (
    switch_0 : in STD_LOGIC;
    switch_1 : in STD_LOGIC;
    LED_0 : out STD_LOGIC;
    LED_1 : out STD_LOGIC;
  );
end Switch_LEDs;
```

lets take it part by part first:'

In:

```vhdl
entity Switch_LEDs is

end Switch_LEDs;
```

- Here we describe or entity with the name we give `Switch_LEDs` after that we us `is` do declare plate of design _(we will describe it shortly after this)_.

- We end it with `end Switch_LEDs;`, we end the declaration with the same name we gave it.

In:

```vhdl
entity Switch_LEDs is
  port ();
end Switch_LEDs;
```

- This will be inside the body of the entity after `is` and before `end`.

- As you can see we say that `entity Switch_LEDs is port (...);`

- And inside `port()` we begin to declare or inputs and outputs as follows:

```vhdl
entity Switch_LEDs is
  port (
    switch_0 : in STD_LOGIC;
    switch_1 : in STD_LOGIC;
    LED_0 : out STD_LOGIC;
    LED_1 : out STD_LOGIC;
  );
end Switch_LEDs;
```

1. `switch_0: in STD_LOGIC;`: In here we say **the name of the port** is `switch_0` with **the port type** `in` **_input_**, and **the data type it will carry type** `STD_LOGIC`.

2. `switch_1 : in STD_LOGIC;`: Similarly in here we say **the name of the port** is `switch_1` with **the port type** `in` **_input_**, and **the data type it will carry type** `STD_LOGIC`.

3. `LED_0 : in STD_LOGIC;`: In here we say **the name of the port** is `LED_0` with **the port type** `out` **_output_**, and **the data type it will carry type** `STD_LOGIC`.

4. `LED_1 : in STD_LOGIC;`: Similarly in here we say **the name of the port** is `LED_1` with **the port type** `out` **_output_**, and **the data type it will carry type** `STD_LOGIC`.

### 3- Architecture declaration

```vhadl
architecture Behavioral of Switch_LEDs is
  begin
    LED_0 <= switch_0;
    LED_1 <= switch_1;
  end Behavioral;
```

Again take it step by step:

In:

```vhdl
architecture Behavioral of Switch_LEDs is
  begin
  end Behavioral;
```

- We declare the **architecture** with the name `Behavioral` of the **entity** `Switch_LEDs`

- then we say `is ... begin ...` and write the behavior we want _(Shortly explained after this)_.

- The end it with `end Behavioral;`, again like when describing an **entity** we end the declaration with the same name we gave it.

In:

```vhdl
architecture Behavioral of Switch_LEDs is
  begin
    LED_0 <= switch_0;
    LED_1 <= switch_1;
  end Behavioral;
```

- `LED_0 <= switch_0;`: In here we assign `LED_0` using the assign keyword `<=` to `switch_0`;

- `LED_1 <= switch_1;`: Similarly In here we assign `LED_1` using the assign keyword `<=` to `switch_1`;

> - `<=` is the most commonly used assign keyword, There is others like `:=` _used for assigning variables_.

Even though in the same design We can only have one **entity**, we can use multiple **architecture**s for it like in the previous example `architecture Behavioral_1 of Switch_LEDs ... end Behavioral_1;`, `architecture Behavioral_2 of Switch_LEDs ... end Behavioral_2;`, etc.

You may ask how would an **entity** know which **architecture** to look for and which to map to?

We will say that in the **configuration** how that would be depending on certain conditions we specify.

## 3 styles of modeling

1. Structured

2. Dataflow

3. Behavioral

We use **Structured** and **Dataflow** when the internal connections are clear and straightforward, usually used without **Behavioral** in smaller designs.

We use **Behavioral** to describe the behavior and **VHDL** translator will translate it to the design you described, usually used to build bigger designs

The commonly used method is to build bigger designs using **Behavioral** then connect them using **Structured** and **Dataflow**.

let's see an example of **Structured**:

### Example of the Structured Modeling

will describe the following entity first:

```bash
#                -------------
#               |             |
#          A ---|             |--- CARRY
#               |  circuitY?  |
#          B ---|             |--- SUM
#               |             |
#   (inputs)     -------------  (outputs)
```

```vhdl
entity Half_Adder is
  port (
    A, B : in BIT;
    SUM, CARRY : out BIT;
  );
end Half_Adder;
```

entity `Half_Adder` is a port with `A`, `B` as inputs carrying type `BIT` and `SUM`, `CARRY` as an outputs carrying type `BIT`.

Now let's describe the following architecture:

```bash
#                ----------------------------------------------------
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                     ------         |
#               |                                    |      |        |
#          A ---|------------------------------------| AND1 |--------|--- CARRY
#               |\             X                    /|      |    Z   |
#               | \     ----------------------------  ------         |
#               |  \   /                      P                      |
#               |    ------                                          |
#               |    /      \                                        |
#               |   /         \                                      |
#               |  /            \                                    |
#               | /               \ Y                 ------         |
#               |/                  -----------------|      |        |
#          B ---|------------------------------------| XOR1 |--------|--- SUM
#               |             Q                      |      |    R   |
#               |                                     ------         |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#      (inputs)  ----------------------------------------------------  (outputs)
```

You may now be asking how would I code `AND1` and `XOR1`?

If you understand how to describe an entity when actually it's super easy barely an inconvenience.

Think of describing them like describing an **entity**, they are a **component**s they are a port with inputs and outputs.

In the cade sample we coded the entity like the following:

```vhdl
entity Half_Adder is
  port (
    A, B : in BIT;
    SUM, CARRY : out BIT;
  );
end Half_Adder;
```

Now let's code `AND1`:

```vhdl
component AND1
  port (
    P, Q in BIT;
    R : out BIT;
  );
end component;
```

See how similar they are, but hold there is some minor differences did you catch any of them?

unlike describing an **entity** in **component**:

- You don't need `is` keyword after the name!

- You end it with `end component;` not something like `end AND1;`.

- You actually place inside the `architecture` after the `is` keyword and before the `begin` keyword.

```vhdl
architecture Structure_HA of Half_Adder is
  component XOR1
    port (
      P, Q in BIT;
      R : out BIT;
    );
  end component;

  component AND1
    port (
      X, Y in BIT;
      Z : out BIT;
    );
  end component;

  begin
end Structure_HA;
```

WAIT, the `architecture` is not complete yet!

Yes we described the `AND1` and `XOR1` **component**s but we didn't connect _(map)_ them with the **entity**.

We will do so between the `begin` keyword and `end` keyword in the `architecture`

```vhdl
architecture Structure_HA of Half_Adder is
  component XOR1
    port (
      P, Q in BIT;
      R : out BIT;
    );
  end component;

  component AND1
    port (
      X, Y in BIT;
      Z : out BIT;
    );
  end component;

  begin
    X1 : XOR1 port map (A, B, SUM);
    A1 : AND1 port map (A, B, CARRY);
end Structure_HA;
```

- `X1 : XOR1 port map (A, B, SUM);`: We define `X1` as the `XOR1` port **component** mapped to the inputs (`A`, `B`) and the output `SUM` using keyword map.

- `A1 : AND1 port map (A, B, CARRY);`: Similarly We define `A1` as the `AND1` port **component** mapped to the inputs (`A`, `B`) and the output `SUM` using keyword map.

> Here we used **positional association** where position each port with it's the position that is specified in the entity when using the `map` keyword, like in `X1 : XOR1 port map (A, B, SUM);` (`A`, `B`) positioned as inputs to `XOR1` and (`SUM`) positioned as an output to `XOR1`.

So the finale code would be:

```vhdl
entity Half_Adder is
  port (
    A, B : in BIT;
    SUM, CARRY : out BIT;
  );
end Half_Adder;

architecture Structure_HA of Half_Adder is
  component XOR1
    port (
      P, Q in BIT;
      R : out BIT;
    );
  end component;

  component AND1
    port (
      X, Y in BIT;
      Z : out BIT;
    );
  end component;

  begin
    X1 : XOR1 port map (A, B, SUM);
    A1 : AND1 port map (A, B, CARRY);
end Structure_HA;
```

As you can see that's a lot **VHDL** code, but that's **Structured** way of design, we use to **connect smaller designs into larger ones**.

### Example of the Dataflow Modeling

Actually, it is pretty much straightforward and could be perfect smaller designs.

If we used the same design from the **structures modeling** example

```bash
#                ----------------------------------------------------
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                     ------         |
#               |                                    |      |        |
#          A ---|------------------------------------| AND1 |--------|--- CARRY
#               |\             X                    /|      |    Z   |
#               | \     ----------------------------  ------         |
#               |  \   /                      P                      |
#               |    ------                                          |
#               |    /      \                                        |
#               |   /         \                                      |
#               |  /            \                                    |
#               | /               \ Y                 ------         |
#               |/                  -----------------|      |        |
#          B ---|------------------------------------| XOR1 |--------|--- SUM
#               |             Q                      |      |    R   |
#               |                                     ------         |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#               |                                                    |
#      (inputs)  ----------------------------------------------------  (outputs)
```

The final code would be:

```vhdl
entity Half_Adder is
  port (
    A, B : in BIT;
    SUM, CARRY : out BIT;
  );
end Half_Adder;

architecture Dataflow_HA of Half_Adder is
  begin
    SUM <= A xor B;
    CARRY <= A and B;
end Dataflow_HA;
```

Describing the **entity** `Half_Adder` is the same as the previous explanation in the **structures modeling** example.

The difference here in the **architecture** `Dataflow_HA`:

- `SUM <= A xor B;`: we assign using `<=` `SUM` to `A xor B`, `xor` is a preserved keyword in **VHDL**

- `CARRY <= A and B;`: we assign using `<=` CA`RRY` to `A and B`, `and` is a preserved keyword in **VHDL**

Sure, **dataflow modeling** seems simpler than the **structures modeling** way, but **structures modeling** has more freedom I would say, and things you can do with than **structures modeling**.

Remember in larger projects you will use the 3 ways of modeling.

## Example of the Behavioral Modeling

We will take about **behavioral modeling** in other articles soon :)
