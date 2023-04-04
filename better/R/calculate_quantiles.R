#' Calculate pre-specified quantiles
#'
#' @description This function calculates pre-specified quantiles 
#' using the [stats::quantile()] function.
#'
#' @param x A numeric vector.
#'
#' @param ... Additional arguments to pass to [stats::quantile()].
#' 
#' @return A named numeric vector with the following names:
#'  - `lo.q`: The lower quartile.
#'  - `med`: The median.
#'  - `hi.q`: The upper quartile.
#' @export
#' @examples
#' calculate_quantiles(c(1, 2, 3, 4, 5))
calculate_quantiles <- function(x, ...) {
  result <- stats::quantile(x, probs = (1:3) / 4, ...)
  names(result) <- c("lo.q", "med", "hi.q")
  return(result)
}