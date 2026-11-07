# BDA400 Assignment 5 | crossover | Base R only
crossover <- function(arr1, arr2) {
  # The supplied pseudocode uses labels Up, Down, None.
  if (!is.numeric(arr1) || !is.numeric(arr2) || length(arr1) != length(arr2)) stop("Both arrays must be numeric and have the same length")
  if (any(!is.finite(arr1)) || any(!is.finite(arr2))) stop("Arrays must contain finite values")
  crossover_signals <- rep("None", length(arr1))
  if (length(arr1) >= 2) for (i in 2:length(arr1)) {
    if (arr1[i] > arr2[i] && arr1[i - 1] <= arr2[i - 1]) crossover_signals[i] <- "Up"
    else if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) crossover_signals[i] <- "Down"
  }
  return(crossover_signals)
}
