# DebouncerLite

## Objective
Eliminate glitches from a mechanical input using a simple 3-sample debounce logic.

## Design Overview
- Uses a 3-bit shift register to sample input.
- Output is updated only when 3 samples are all 0 or all 1.

## Interface

| Signal   | Width | Direction | Description                      |
|----------|--------|-----------|----------------------------------|
| clk      | 1      | Input     | Clock                            |
| rst      | 1      | Input     | Reset                            |
| noisy    | 1      | Input     | Noisy signal                     |
| clean    | 1      | Output    | Debounced output                 |

## Test Scenarios
- Glitches do not affect `clean` unless stable  
- Stable high (e.g., 1-1-1) → `clean = 1`  
- Stable low (e.g., 0-0-0) → `clean = 0`
