# BDA400 Assignment 5 — Technical Analysis using R

Nine separate indicator implementations use **base R only**, with function names and arguments matching the assignment templates.

## Running
1. Open RStudio and set the working directory to this folder (Session > Set Working Directory > Choose Directory).
2. Run `source("run_tests.R")` to source all functions and execute synthetic checks.
3. To try individual functions, source their files first; `macd()` depends on `ema()`, and `stoch_rsi()` depends on `rsi()` and `sma()`.
4. Record the RStudio console output and independently check a few numerical results before submission.
5. Place this folder in your course GitHub repository and insert its actual URL in the cover page.

## Notes on assignment ambiguity
- `stdev()` computes **population** SD (divides by n), unlike `sd()` which divides by n-1.
- `linreg()` uses a complete window of `regressionLength` observations ending `regressionOffset` observations before the last. This corrects an inconsistent start-index formula in the provided pseudocode.
- `rsi()` uses Wilder smoothing, with the first computed RSI at index `period + 1`.
- `stoch_rsi()` uses rolling RSI minima/maxima; smoothed K and D retain date alignment via leading NA.
- `crossover()` and `crossunder()` use **character** results specified by the pseudocode rather than the boolean outputs mentioned in prose. Check instructor test expectations.

**Validation status:** The files were authored and reviewed, but RStudio execution and actual stock-data integration must be completed by the student.
