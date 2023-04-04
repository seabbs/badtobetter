#' FUNCTION_TITLE
#'
#' FUNCTION_DESCRIPTION
#'
#' @param x DESCRIPTION.
#'
#' @return RETURN_DESCRIPTION
#' @export
#' @examples
#' # ADD_EXAMPLES_HERE
calculate_quantiles <- function(x) {
  result <- quantile(x, probs = (1:3) / 4)
  names(result) <- c("lo.q", "med", "hi.q")
  return(result)
}