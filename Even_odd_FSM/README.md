# EvenOddFSM

## Objective
Determine whether the cumulative sum of 4-bit inputs is even or odd.

## Design Overview
- Accepts new inputs when `valid = 1`.
- Maintains running sum.
- Sets `even = 1` if sum is even, else `even = 0`.

## Interface

| Signal    | Width | Direction | Description                         |
|-----------|--------|-----------|-------------------------------------|
| clk       | 1      | Input     | Clock                               |
| rst       | 1      | Input     | Reset                               |
| in_data   | 4      | Input     | Input value to accumulate           |
| valid     | 1      | Input     | Enables accumulation                |
| even      | 1      | Output    | 1 if cumulative sum is even         |

## Test Scenarios
- Sequence: 4 → 3 → 1 → sum = 8 → even = 1  
- Even/odd flag updates correctly with each valid input
