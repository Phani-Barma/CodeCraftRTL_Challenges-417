# PulseTracer

## Objective
Detect a single clean rising pulse from a noisy input signal.

## Design Overview
- Uses a 2-stage synchronizer to clean input.
- Produces a single-cycle pulse on the first clean rising edge.
- Output is cleared after each pulse.

## Interface

| Signal       | Width | Direction | Description                       |
|--------------|--------|-----------|-----------------------------------|
| clk          | 1      | Input     | Clock signal                      |
| rst          | 1      | Input     | Active-high reset                 |
| noisy_in     | 1      | Input     | Noisy input signal                |
| clean_pulse  | 1      | Output    | Clean 1-cycle pulse on rising edge |

## Test Scenarios
- Handles glitches in input.
- Pulse output only for clean rising edges.

# BitBalancer

## Objective
Count the number of 1s in an 8-bit input vector.

## Design Overview
- Iteratively sums each bit of `data_in` on `load = 1`.
- Stores result in a 4-bit register `count`.
- Reset clears the counter.

## Interface

| Signal    | Width | Direction | Description                     |
|-----------|--------|-----------|---------------------------------|
| clk       | 1      | Input     | Clock signal                    |
| rst       | 1      | Input     | Synchronous reset               |
| data_in   | 8      | Input     | Input binary value              |
| load      | 1      | Input     | Enables counting                |
| count     | 4      | Output    | Number of 1s in `data_in`       |

## Test Scenarios
- Input: `10101010` → count = 4  
- Input: `11110000` → count = 4  
- Input: `00000000` → count = 0

