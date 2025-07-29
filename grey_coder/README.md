# GrayCoder

## Objective
Convert a 4-bit binary input to a Gray code output.

## Design Overview
- Gray code formula: `gray = binary ^ (binary >> 1)`
- Combinational logic; no clock or reset required.

## Interface

| Signal       | Width | Direction | Description                |
|--------------|--------|-----------|----------------------------|
| binary_in    | 4      | Input     | 4-bit binary input         |
| gray_out     | 4      | Output    | 4-bit Gray code output     |

## Test Scenarios

| Binary Input | Gray Code Output |
|--------------|------------------|
| 0000         | 0000             |
| 0001         | 0001             |
| 0010         | 0011             |
| 1111         | 1000             |
