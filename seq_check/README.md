# SeqCheck

## Objective
Detect whether three or more rising pulses occur within a 5-clock window.

## Design Overview
- Maintains a 5-bit shift register of recent inputs.
- Counts number of 1s in the window.
- Outputs `pulse = 1` if count >= 3.

## Interface

| Signal  | Width | Direction | Description                     |
|---------|--------|-----------|---------------------------------|
| clk     | 1      | Input     | Clock                           |
| rst     | 1      | Input     | Reset                           |
| sig     | 1      | Input     | Pulse input                     |
| pulse   | 1      | Output    | High if >=3 pulses in window    |

## Test Scenarios
- Inputs: 1, 0, 1, 0, 1 → pulse = 1  
- Fewer than 3 → pulse = 0
