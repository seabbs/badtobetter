tar_target(pop_sum, {
  aggregate_dataframe(outcome ~ country, pop, calculate_quantiles)
})
