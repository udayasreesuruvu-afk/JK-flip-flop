# JK Flip-Flop Using Verilog HDL

## Overview

This project implements a **JK Flip-Flop** using Verilog HDL.

A JK flip-flop is a sequential logic circuit that stores one bit of data. It is an improved version of the SR flip-flop because the `J=1, K=1` condition performs a toggle operation instead of being invalid.

This project includes:

* Verilog RTL design
* Verilog testbench
* JK truth table
* Simulation output
* VCD waveform generation
* Icarus Verilog simulation instructions

---

## Block Diagram

```text
                 +------------------+
       J ------->|                  |
       K ------->|                  |
     CLK ------->|   JK Flip-Flop   |------> Q
     RST ------->|                  |------> Q̅
                 +------------------+
```

---

## JK Flip-Flop Truth Table

| J | K | Q(next) | Operation |
| - | - | ------- | --------- |
| 0 | 0 | Q       | Hold      |
| 0 | 1 | 0       | Reset     |
| 1 | 0 | 1       | Set       |
| 1 | 1 | Q̅      | Toggle    |

---

## Working Principle

### Hold

When:

```text
J = 0
K = 0
```

the flip-flop retains its previous state.

```text
Q(next) = Q
```

---

### Reset

When:

```text
J = 0
K = 1
```

the output becomes:

```text
Q = 0
Q̅ = 1
```

---

### Set

When:

```text
J = 1
K = 0
```

the output becomes:

```text
Q = 1
Q̅ = 0
```

---

### Toggle

When:

```text
J = 1
K = 1
```

the output changes to its opposite state.

```text
Q = 0 → Q = 1

Q = 1 → Q = 0
```

This toggle operation is one of the major advantages of the JK flip-flop.

---

## Project Structure

```text
jk-flip-flop-verilog/
│
├── README.md
├── jk_flip_flop.v
├── tb_jk_flip_flop.v
│
└── output/
    └── simulation_output.txt
```

---

## Verilog Implementation

The JK behavior is implemented using a `case` statement:

```verilog
case ({j, k})
    2'b00: q <= q;
    2'b01: q <= 1'b0;
    2'b10: q <= 1'b1;
    2'b11: q <= ~q;
endcase
```

The complementary output is:

```verilog
assign q_bar = ~q;
```

---

## Reset

The design uses an **active-high synchronous reset**.

When:

```text
RST = 1
```

the output becomes:

```text
Q = 0
Q̅ = 1
```

The reset is evaluated on the rising edge of the clock.

---

## Clock

The flip-flop is **positive-edge triggered**.

The state changes on:

```text
posedge clk
```

Therefore, changes to `J` and `K` are captured at the rising edge of the clock.

---

## Testbench

The testbench verifies:

1. Reset
2. Set
3. Hold
4. Reset
5. Set again
6. Toggle from 1 to 0
7. Toggle from 0 to 1
8. Hold

---

## Simulation

### Requirements

The project can be simulated using:

* Icarus Verilog
* ModelSim
* QuestaSim
* Vivado Simulator

GTKWave can be used to view the generated waveform.

---

## Run Using Icarus Verilog

Compile the design and testbench:

```bash
iverilog -o jk_sim jk_flip_flop.v tb_jk_flip_flop.v
```

Run the simulation:

```bash
vvp jk_sim
```

---

## Expected Simulation Output

```text
==========================================
          JK FLIP-FLOP TEST
==========================================
Time    J K     Q Qbar
------------------------------------------
6       0 0     0 1
16      1 0     1 0
26      0 0     1 0
36      0 1     0 1
46      1 0     1 0
56      1 1     0 1
66      1 1     1 0
76      0 0     1 0
------------------------------------------
Simulation completed successfully.
==========================================
```

---

## Waveform Simulation

The testbench creates:

```text
jk_flip_flop.vcd
```

Open it using:

```bash
gtkwave jk_flip_flop.vcd
```

Observe:

```text
clk
rst
j
k
q
q_bar
```

During `J=1, K=1`, the output `Q` toggles at every rising edge of the clock.

---

## Verification

The testbench verifies all four possible combinations:

```text
J K = 00 → Hold
J K = 01 → Reset
J K = 10 → Set
J K = 11 → Toggle
```

Therefore, the complete JK flip-flop truth table is covered.

---

## Applications

JK flip-flops are used in:

* Counters
* Frequency dividers
* Registers
* Sequential logic
* Control circuits
* State machines
* Digital clocks
* Memory circuits
* FPGA designs

---

## JK Flip-Flop as a T Flip-Flop

A JK flip-flop can operate as a T flip-flop by connecting:

```text
J = 1
K = 1
```

The output then toggles on every active clock edge.

This makes JK flip-flops useful for building binary counters and frequency dividers.

---

## Learning Objectives

This project demonstrates:

* Verilog sequential logic
* Flip-flop design
* Positive-edge triggering
* Synchronous reset
* `case` statements
* Testbench development
* Simulation
* VCD waveform generation
* Digital circuit verification

---

## Future Improvements

Possible extensions include:

* Asynchronous reset
* Parameterized flip-flop
* JK-based binary counter
* JK-based frequency divider
* 4-bit synchronous counter
* 8-bit counter
* FPGA implementation
* Seven-segment display counter

---

## License

This project is intended for educational and academic purposes.

---

## Author

**Your Name**

JK Flip-Flop Using Verilog HDL
