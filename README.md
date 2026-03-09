# TinyTapeout04 - Corrected Version

In Autumn 2023, I participated in TinyTapeout 04 and submitted a 
Verilog design to tapeout a real chip.

The original code contained several bugs that would affect the 
correct functionality of the design.
This repository contains the corrected version.

## Bugs Fixed
- LFSR reset initialized to all-zeros (lock-up state) → fixed to non-zero seed
- Wrong bit-width in lfsr_8 reset value (16-bit instead of 8-bit)
- MUX output declared without reg in always block

## Project Description
A Pseudo Random Number Generator (PRNG) based on two LFSRs 
and a 16-to-8 multiplexer, designed for TinyTapeout 04.

## Link of previous code
https://github.com/Spiros7bit/tt04-submission-test

## EDA and Simulations Tools
- Quartus II Web Edition 13.01
- ModelSim ALTERA STARTER EDITION 10.1d

<img width="709" height="189" alt="image" src="https://github.com/user-attachments/assets/506bb178-a93c-4079-9897-dbf37552da9c" />
