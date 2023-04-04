# this converts the results of multi-column (output) aggregate to pure data.frame

#' FUNCTION_TITLE
#'
#' FUNCTION_DESCRIPTION
#'
#' @param ... DESCRIPTION.
#'
#' @return RETURN_DESCRIPTION
#' @export
#' @examples
#' # ADD_EXAMPLES_HERE
aggregate_dataframe <- function(...) {
  do.call(data.frame, aggregate(...))
}
