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
