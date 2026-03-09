# TinyTapeout04 - Corrected Version

In Autumn 2023, I participated in TinyTapeout 04 and submitted a 
Verilog design to tapeout a real chip.

The original code contained several bugs that would affect the 
correct functionality of the design.
This repository contains the corrected version.

## Bugs Fixed
- LFSR reset initialized to all-zeros (lock-up state) → fixed to non-zero seed

## Project Description
A Pseudo Random Number Generator (PRNG) based on two LFSRs 
and a 16-to-8 multiplexer, designed for TinyTapeout 04.

## Link of previous code
https://github.com/Spiros7bit/tt04-submission-test

## EDA and Simulations Tools
- Quartus II Web Edition 13.01
- ModelSim ALTERA STARTER EDITION 10.1d

### Outputs of RTL simulation
<img width="1126" height="255" alt="image" src="https://github.com/user-attachments/assets/c19e0ed6-be40-4f7f-8731-09e4fea72997" />

