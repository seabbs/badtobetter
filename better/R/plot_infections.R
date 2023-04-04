#' Plot Infections by Individual
#'
#' @description This function plots the number of infections by individual
#' stratified by country and risk group.
#'
#' @param pop A [data.frame] with the following columns and where each row is an
#' individual:
#' - `country`: The country of origin.
#' - `high_risk`: A logical indicating whether the individual is high risk.
#' - `outcome`: The number of infections.
#'
#' @return A [ggplot2::ggplot] object.
#' @export
#' @examples
#' pop <- synthesize_population(
#'  prob_high_risk = 0.1, prob_exposure_hr = 0.5, prob_exposure_lr = 0.1
#' )
#' plot_infections(pop)
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

#' Add Summary statistics to infections plot
#'
#' @description Add country level summary statistics to [plot_infections()]. The
#' summary statistics are calculated using [calculate_quantiles()] and
#' optionally [aggregate_dataframe()].
#'
#' @param plot A [ggplot2::ggplot] object created by [plot_infections()].
#'
#' @param summary A [data.frame] with the following columns:
#' - `country`: The country of origin.
#' - `outcome.lo.q`: The lower quartile of the number of infections.
#' - `outcome.med`: The median of the number of infections.
#' - `outcome.hi.q`: The upper quartile of the number of infections.
#'
#' This can be produced using [aggregate_dataframe()] and
#' [calculate_quantiles()].
#'
#' @return A [ggplot2::ggplot] object.
#' @export
#' @examples
#' pop <- synthesize_population(
#'  prob_high_risk = 0.1, prob_exposure_hr = 0.5, prob_exposure_lr = 0.1
#' )
#' plot <- plot_infections(pop)
#'
#' summary <- aggregate_dataframe(outcome ~ 1, pop, calculate_quantiles)
#' add_summary_to_infections_plot(plot, summary)
add_summary_to_infections_plot <- function(plot, summary) {
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

#' Convert the first character of a string to uppercase
#'
#' @description This function converts the first character of a string to
#' uppercase.
#'
#' @param str A character string.
#'
#' @return A character string with the first character converted to uppercase.
#' @examples
#' badtobetter:::ucfirst("hello")
ucfirst <- function(str) {
  paste0(toupper(substr(str, 1, 1)), substr(str, 2, nchar(str)))
}
