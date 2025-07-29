# PulseTracer

## ✅ Objective
Detect a single clean rising pulse from a noisy input signal.

## 🧠 Design Overview
- A 2-stage synchronizer filters glitches.
- Generates a 1-cycle pulse on the **first clean rising edge**.
- Resets internal state on `rst`.

## 🔗 I/O Specification

| Signal      | Width | Direction | Description                      |
|-------------|-------|-----------|----------------------------------|
| `clk`       | 1     | Input     | Clock signal                     |
| `rst`       | 1     | Input     | Active-high synchronous reset    |
| `noisy_in`  | 1     | Input     | Noisy input signal               |
| `clean_pulse` | 1   | Output    | Clean 1-cycle pulse on rising edge |

## 🧪 Test Conditions
- **Glitchy inputs** are filtered.
- Only **first clean 0→1 transition** generates pulse.
