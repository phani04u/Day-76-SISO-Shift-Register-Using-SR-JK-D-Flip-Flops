# Day 76 – SISO Shift Register Using SR, JK, and D Flip-Flops

## 1. Introduction

As part of my Verilog HDL learning journey, I implemented a **Serial-In Serial-Out (SISO) Shift Register** using three different types of flip-flops:

1. SR Flip-Flop
2. JK Flip-Flop
3. D Flip-Flop

A shift register is a sequential digital circuit used to store and transfer binary data. It consists of multiple flip-flops connected in series, where the output of one flip-flop is connected to the input of the next flip-flop.

In this project, I explored how serial data is shifted from one stage to another with every active clock edge.

---

## 2. Objectives

- Understand the working principle of a SISO shift register.
- Learn serial data input and serial data output operations.
- Implement a SISO shift register using SR Flip-Flops.
- Implement a SISO shift register using JK Flip-Flops.
- Implement a SISO shift register using D Flip-Flops.
- Understand how different flip-flops can perform the same shift-register operation.
- Verify the designs using Verilog testbenches and simulation waveforms.

---

## 3. What is a Shift Register?

A shift register is a sequential circuit that stores binary data and shifts it one bit at a time based on clock pulses.

It is constructed using flip-flops connected in a chain.

Each flip-flop stores one bit of information.

### Working Principle

- Serial data is applied to the input.
- A clock pulse triggers the flip-flops.
- Each flip-flop transfers its stored data to the next stage.
- The data moves one position with every active clock edge.
- The final flip-flop provides the serial output.

---

## 4. What is SISO?

SISO stands for **Serial-In Serial-Out**.

In a SISO shift register:

- Data enters one bit at a time.
- Data shifts through the flip-flops.
- Data comes out one bit at a time.

### Block Diagram

```text
       Serial Input
            |
            v
        +-------+
CLK --->|  FF1  |
        +-------+
            |
            v
        +-------+
CLK --->|  FF2  |
        +-------+
            |
            v
        +-------+
CLK --->|  FF3  |
        +-------+
            |
            v
        +-------+
CLK --->|  FF4  |
        +-------+
            |
            v
       Serial Output
```

A 4-bit SISO shift register requires four flip-flops.

---

## 5. SISO Using D Flip-Flops

### Working Principle

A D Flip-Flop transfers the value at its D input to its Q output at the active clock edge.

The characteristic equation is:

**Q(next) = D**

For a 4-bit SISO shift register:

- The serial input connects to the first flip-flop.
- The output of the first flip-flop connects to the second.
- The output of the second connects to the third.
- The output of the third connects to the fourth.

### Next-State Equations

```text
Q0(next) = Serial Input
Q1(next) = Q0
Q2(next) = Q1
Q3(next) = Q2

Serial Output = Q3
```

---

## 6. SISO Using JK Flip-Flops

### Working Principle

A JK Flip-Flop is a versatile sequential circuit with two inputs: J and K.

Its characteristic equation is:

**Q(next) = JQ' + K'Q**

To use a JK Flip-Flop as a D Flip-Flop, connect:

```text
J = D
K = D'
```

Therefore, each JK Flip-Flop can perform the same data-transfer operation required in a SISO shift register.

### Next-State Operation

```text
J0 = Serial Input
K0 = Serial Input'

J1 = Q0
K1 = Q0'

J2 = Q1
K2 = Q1'

J3 = Q2
K3 = Q2'
```

The output of each stage becomes the input data for the next stage.

---

## 7. SISO Using SR Flip-Flops

### Working Principle

An SR Flip-Flop has two inputs:

- S – Set
- R – Reset

Its characteristic equation is:

**Q(next) = S + R'Q**

For a valid SR operation, the inputs S and R must not both be HIGH.

To use an SR Flip-Flop as a D Flip-Flop, connect:

```text
S = D
R = D'
```

This allows the SR Flip-Flop to store either logic 0 or logic 1 based on the input data.

### Next-State Operation

```text
S0 = Serial Input
R0 = Serial Input'

S1 = Q0
R1 = Q0'

S2 = Q1
R2 = Q1'

S3 = Q2
R3 = Q2'
```

This configuration allows the SR Flip-Flops to perform the SISO shifting operation without applying the invalid S = 1, R = 1 combination.

---

## 8. Comparison of SR, JK, and D Flip-Flops

| Feature | SR Flip-Flop | JK Flip-Flop | D Flip-Flop |
|---|---|---|---|
| Inputs | S, R | J, K | D |
| Main operation | Set/Reset | Set/Reset/Toggle | Data storage |
| Invalid input | S = 1, R = 1 | No invalid input combination | No invalid input combination |
| Shift-register implementation | Requires input conversion | Requires input conversion | Direct implementation |
| Characteristic equation | Q(next) = S + R'Q | Q(next) = JQ' + K'Q | Q(next) = D |

---

## 9. Example of SISO Operation

Consider a 4-bit SISO shift register with an initial state of:

```text
Q3 Q2 Q1 Q0 = 0000
```

Apply the serial input sequence:

```text
1 → 0 → 1 → 1
```

Assume the first flip-flop is Q0 and the data shifts towards Q3.

| Clock Pulse | Serial Input | Q3 Q2 Q1 Q0 |
|---|---|---|
| Initial | - | 0000 |
| 1 | 1 | 0001 |
| 2 | 0 | 0010 |
| 3 | 1 | 0101 |
| 4 | 1 | 1011 |

After four clock pulses, the register contains
