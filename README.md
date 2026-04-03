# 🚀 Next-Gen Systolic Array with Dual-Radix Arithmetic for Low-Power ML Acceleration

## 📌 Overview
This project presents an energy-efficient systolic array architecture designed for machine learning acceleration. The proposed Adaptive Dual-Radix Precision Systolic Array (ADR-SA) dynamically adjusts arithmetic operations based on operand significance.

## 🎯 Motivation
Traditional systolic arrays use fixed precision and arithmetic structures, leading to:
- High power consumption
- Unnecessary switching activity
- Inefficient hardware utilization

This project solves these issues using runtime adaptive computation.

---

## ⚙️ Features
- 🔄 Dynamic radix switching (Radix-8, Radix-4)
- 🧠 Operand-aware adaptive computation
- ⚡ Reduced power consumption
- 📈 High throughput performance
- 🔧 FPGA-based implementation

---

## 🏗️ Architecture
- Grid of Processing Elements (PEs)
- Dual-radix multiplier design
- Runtime controller for adaptive switching
- Systolic pipeline dataflow

---

## 🛠️ Tools & Technologies
- Verilog HDL
- Xilinx ISE Design Suite
- ISim Simulator
- XPower Analyzer
- FPGA (Spartan-2E)

---

## 📊 Results

| Metric        | CPA        | Radix-4 / ADR-SA |
|--------------|-----------|------------------|
| Power        | 243 mW    | 207 mW           |
| Delay        | 8.800 ns  | 4.755 ns         |
| Area         | 1916      | 1703             |

### ✅ Achievements
- Up to **45% power reduction**
- Up to **45% delay reduction**
- High accuracy (>98%)
- Efficient resource utilization


---

## 🔮 Future Work
- ASIC implementation
- AI-based adaptive controllers
- Larger systolic array scaling
- Mixed-precision optimization


## ⭐ Acknowledgment
This project is based on research in energy-efficient machine learning accelerators using adaptive systolic architectures.
