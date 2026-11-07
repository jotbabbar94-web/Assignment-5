# BDA400 Assignment 5 | stdev | Base R only
stdev <- function(data) {
  # Population standard deviation: divide by n, not n - 1.
  if (!is.numeric(data) || length(data) == 0 || any(!is.finite(data))) stop("data must be nonempty finite numeric values")
  mean_value <- sum(data) / length(data)
  differences <- data - mean_value
  squared_differences <- differences^2
  variance <- sum(squared_differences) / length(data)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}
