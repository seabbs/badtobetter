tar_target(
  plot_population,
  {
    plot <- plot_infections(pop)
    add_summary_to_infections_plot(plot, pop_sum)
  }
)
