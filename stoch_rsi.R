# BDA400 Assignment 5 | stoch_rsi | Base R only
stoch_rsi <- function(data, period, k_period, d_period) {
  # Rolling min/max RSI normalization; smoothed %K and %D.
  if (!exists("rsi", mode = "function") || !exists("sma", mode = "function")) stop("Source rsi.R and sma.R first")
  for (p in list(k_period, d_period)) if (length(p) != 1 || !is.numeric(p) || is.na(p) || p < 1 || p != floor(p)) stop("k_period and d_period must be positive integers")
  rsi_values <- rsi(data, period)
  raw_k <- rep(NA_real_, length(rsi_values))
  first <- period + k_period
  if (first > length(data)) stop("Insufficient observations for RSI and k_period")
  for (i in first:length(data)) {
    window <- rsi_values[(i - k_period + 1):i]
    low <- min(window)
    high <- max(window)
    raw_k[i] <- if (high == low) 0 else (rsi_values[i] - low) / (high - low)
  }
  # Retain leading NA values to align outputs with original price dates.
  k_line <- rep(NA_real_, length(data))
  if (first + k_period - 1 <= length(data)) for (i in (first + k_period - 1):length(data)) {
    k_line[i] <- sma(raw_k[(i - k_period + 1):i], k_period)
  }
  d_line <- rep(NA_real_, length(data))
  first_d <- first + k_period + d_period - 2
  if (first_d <= length(data)) for (i in first_d:length(data)) {
    d_line[i] <- sma(k_line[(i - d_period + 1):i], d_period)
  }
  result <- list(k_line = k_line, d_line = d_line)
  return(result)
}
