# EdgeHighlighter

## Objective
Generate a one-cycle pulse on both rising and falling edges of an input signal.

## Design Overview
- Compares current signal with previous value.
| Signal Name    | Direction | Width | Description                                  |
| -------------- | --------- | ----- | -------------------------------------------- |
| `clk`          | Input     | 1 bit | Clock signal (positive edge triggered)       |
| `rst`          | Input     | 1 bit | Active high synchronous reset                |
| `signal_in`    | Input     | 1 bit | Input signal to monitor for edge transitions |
| `rising_edge`  | Output    | 1 bit | Output pulse (1 clock cycle) on rising edge  |
| `falling_edge` | Output    | 1 bit | Output pulse (1 clock cycle) on falling edge |

