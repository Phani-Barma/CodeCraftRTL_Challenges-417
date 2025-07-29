# NibbleSwapper

## Objective
Swap the upper and lower 4 bits (nibbles) of an 8-bit input when enabled.

## Design Overview
- On `swap = 1`, output is `{lower_nibble, upper_nibble}`.
- If `swap = 0`, output follows input.
- Reset clears the output.

## Interface

| Signal     | Width | Direction | Description                    |
|------------|--------|-----------|--------------------------------|
| clk        | 1      | Input     | Clock signal                   |
| rst        | 1      | Input     | Reset                          |
| data_in    | 8      | Input     | Input data                     |
| swap       | 1      | Input     | Swap enable signal             |
| data_out   | 8      | Output    | Output after swapping          |

## Test Scenarios
- `data_in = 10110001`, `swap = 1` → `data_out = 00011011`  
- `swap = 0` → output equals input
