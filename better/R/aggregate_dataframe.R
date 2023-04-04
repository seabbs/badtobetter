#' Convert the results of multi-column (output) [aggregate()] to pure data.frame
#'
#' @description This function converts the results of multi-column (output)
#' [aggregate()] to pure data.frame.
#'
#' @param ... Pass the same arguments as you would to [aggregate()].
#'
#' @return A data.frame with the same columns as the output of [aggregate()].
#' @export
#' @examples
#' aggregate_dataframe(mpg ~ cyl, mtcars, mean)
aggregate_dataframe <- function(...) {
  do.call(data.frame, stats::aggregate(...))
}
