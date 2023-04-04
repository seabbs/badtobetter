plot_infections <- function(pop) {
  plot <- ggplot2::ggplot(pop) +
    ggplot2::aes(x = outcome, fill = country, alpha = high_risk) +
    ggplot2::facet_grid(
      country ~ ., labeller = ggplot2::labeller(country = ucfirst)
    ) +
    ggplot2::geom_histogram(position = "stack", bins = 5) +
    ggplot2::scale_alpha_manual(
      "Risk Group",
      labels = function(high_risk) {
        c("Low", "High")[as.numeric(high_risk) + 1]
      },
      values = c(`FALSE` = 0.5, `TRUE` = 0.7)
    ) +
    ggplot2::scale_x_continuous("Number of Infections") +
    ggplot2::scale_fill_discrete(labels = ucfirst) +
    ggplot2::scale_color_discrete(labels = ucfirst) +
    ggplot2::theme_minimal() +
    ggplot2::theme_bw()
  return(plot)
}

add_summary_to_infections_plot <- function(plot, summary, ...) {
  plot <- plot +
    ggplot2::geom_vline(
      data = summary,
      ggplot2::aes(xintercept = outcome.lo.q - .1, linetype = "Lower Quartile")
    ) +
    ggplot2::geom_vline(
      data = summary,
      ggplot2::aes(xintercept = outcome.med, linetype = "Median")
    ) +
    ggplot2::geom_vline(
      data = summary,
      ggplot2::aes(xintercept = outcome.hi.q + .1, linetype = "Upper Quartile")
    ) +
    ggplot2::scale_linetype_manual(
      "Measure",
      values = c(
        `Lower Quartile` = "dashed", Median = "solid",
        `Upper Quartile` = "dotted"
      )
    )
  return(plot)
}

ucfirst <- function(str) {
  paste0(toupper(substr(str, 1, 1)), substr(str, 2, nchar(str)))
}
