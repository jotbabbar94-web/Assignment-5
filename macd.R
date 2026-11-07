# BDA400 Assignment 5 | macd | Base R only
macd <- function(data, short_period, long_period, signal_period) {
  # Compute EMAs using the companion ema.R implementation.
  if (!exists("ema", mode = "function")) stop("Source ema.R before macd.R")
  if (short_period >= long_period) stop("short_period must be less than long_period")
  short_ema <- ema(data, short_period)
  long_ema <- ema(data, long_period)
  macd_line <- short_ema - long_ema
  signal_line <- ema(macd_line, signal_period)
  histogram <- macd_line - signal_line
  result <- list(macd_line = macd_line, signal_line = signal_line, histogram = histogram)
  return(result)
}
