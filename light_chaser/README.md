# LightChaser

## Objective
Create a rotating LED pattern where only one LED is on at a time and rotates left when enabled.

## Design Overview
- Initializes to `00000001`.
- On each clock cycle with `enable = 1`, rotates left.
- Wraps around from MSB to LSB.

## Interface

| Signal   | Width | Direction | Description             |
|----------|--------|-----------|-------------------------|
| clk      | 1      | Input     | Clock                   |
| rst      | 1      | Input     | Reset                   |
| enable   | 1      | Input     | Rotation enable         |
| leds     | 8      | Output    | LED pattern output      |

## Test Scenarios
- Sequence: 00000001 → 00000010 → 00000100 → ... → 10000000 → 00000001
