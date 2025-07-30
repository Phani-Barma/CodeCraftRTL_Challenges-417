# 1. PulseTracer

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


# 2. BitBalancer

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


  # 3. NibbleSwapper

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


# 4. EvenOddFSM

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

  
# 5. GrayCoder

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


# 6. DebouncerLite

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

# 7. LightChaser

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


# 8. SeqCheck

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


# 9. RotatorUnit

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


