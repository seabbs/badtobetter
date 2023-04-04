#' Save a plot and return the path for targets
#'
#' @param plot A [ggplot2::ggplot] object.
#'
#' @param file The name of the file to save.
#'
#' @param path The path to save the file to.
#'
#' @param ... Additional arguments to pass to [ggplot2::ggsave()].
#' @importFrom ggplot2 ggsave
save_plot <- function(plot, file, path, ...) {
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(path, file)
  suppressWarnings(ggplot2::ggsave(path, plot, ...))
  return(path)
}
