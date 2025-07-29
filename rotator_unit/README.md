# RotatorUnit

## Objective
Rotate an 8-bit input left or right on each clock cycle based on direction.

## Design Overview
- On `load = 1`, loads input into output register.
- If `dir = 1`, rotates left; if `dir = 0`, rotates right.
- Reset clears output.

## Interface

| Signal     | Width | Direction | Description                     |
|------------|--------|-----------|---------------------------------|
| clk        | 1      | Input     | Clock                           |
| rst        | 1      | Input     | Reset                           |
| dir        | 1      | Input     | 1 = left, 0 = right rotation    |
| load       | 1      | Input     | Loads new input                 |
| data_in    | 8      | Input     | Input value                     |
| data_out   | 8      | Output    | Rotated output                  |

## Test Scenarios
- Left rotate: `10101010` → `01010101`  
- Right rotate reverses the pattern
