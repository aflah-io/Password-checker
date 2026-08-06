# 🔐 Password Strength Checker CLI

An interactive, visual, and secure Terminal-based Password Strength Evaluator written in pure Bash. It provides real-time security feedback with smooth ASCII header animations, colored status indicators, and percentage-based grading.

---

## ✨ Features

* 🎬 **Typewriter Header Effect:** Smooth ASCII text animation during startup.
* 🔒 **Masked Password Entry:** Uses secure terminal input (`read -sp`) to prevent shoulder surfing.
* 🎨 **Color-Coded Analysis:** Instant feedback with dynamic Green (✔) and Red (✘) indicators.
* ⏱️ **Staggered Results Output:** Animated step-by-step checklist display for a better UI experience.
* 📊 **Score Calculation:** Percentage-based breakdown (0% to 100%) with 4 strength levels (*WEAK*, *MODERATE*, *STRONG*, *VERY STRONG*).

---

## ⚙️ Security Evaluation Rules

The strength score is calculated based on 5 industry-standard password complexity parameters (20 points each):

| Parameter | Minimum Requirement | Points |
| :--- | :--- | :--- |
| **Length** | 8 or more characters | +20% |
| **Uppercase** | At least 1 uppercase letter (`A-Z`) | +20% |
| **Lowercase** | At least 1 lowercase letter (`a-z`) | +20% |
| **Numbers** | At least 1 numeric digit (`0-9`) | +20% |
| **Symbols** | At least 1 special character (`@`, `#`, `$`, `%`, etc.) | +20% |

---

## 🚀 Quick Start Guide

### 1. Create the Script File
Copy the script code and save it as `pass_check.sh`:
```bash
nano pass_check.sh
chmod +x pass_check.sh
./pass_check.sh
