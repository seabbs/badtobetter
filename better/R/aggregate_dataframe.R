# this converts the results of multi-column (output) aggregate to pure data.frame
aggregate_dataframe <- function(...) {
  do.call(data.frame, aggregate(...))
}
