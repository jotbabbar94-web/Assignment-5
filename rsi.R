# BDA400 Assignment 5 | rsi | Base R only
rsi <- function(data, period) {
  # Wilder RSI with an initial average over the first 'period' changes.
  if (!is.numeric(data) || any(!is.finite(data))) stop("data must be finite numeric values")
  if (length(period) != 1 || !is.numeric(period) || is.na(period) || period < 1 || period != floor(period)) stop("period must be a positive integer")
  if (length(data) <= period) stop("Need at least period + 1 prices")
  diff_values <- diff(data)
  gains <- pmax(diff_values, 0)
  losses <- pmax(-diff_values, 0)
  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period
  rsi_values <- rep(NA_real_, length(data))
  # Avoid division by zero: flat series RSI=50, all-gain RSI=100.
  rsi_at <- function(g, l) if (g == 0 && l == 0) 50 else if (l == 0) 100 else 100 - 100 / (1 + g / l)
  rsi_values[period + 1] <- rsi_at(avg_gain, avg_loss)
  if (length(data) > period + 1) for (i in (period + 2):length(data)) {
    avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
    avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period
    rsi_values[i] <- rsi_at(avg_gain, avg_loss)
  }
  return(rsi_values)
}
