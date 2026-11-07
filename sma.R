# BDA400 Assignment 5 | sma | Base R only
sma <- function(data, period) {
  # Average each consecutive window of the requested size.
  if (!is.numeric(data) || any(!is.finite(data))) stop("data must be finite numeric values")
  if (length(period) != 1 || is.na(period) || !is.numeric(period) || period < 1 || period != floor(period)) stop("period must be a positive integer")
  if (length(data) < period) stop("Data length should be greater than or equal to the period")
  sma_values <- numeric(length(data) - period + 1)
  for (i in seq_along(sma_values)) {
    sma_values[i] <- sum(data[i:(i + period - 1)]) / period
  }
  return(sma_values)
}
