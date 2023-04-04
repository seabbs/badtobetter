Target Markdown
================

Target Markdown is a powerful R Markdown interface for reproducible
analysis pipelines, and the chapter at
<https://books.ropensci.org/targets/markdown.html> walks through it in
detail. This R Markdown report the example from the chapter. Try it out
in both interactive and non-interactive modes, either by running the
code chunks in different ways or setting the `tar_interactive` chunk
option.

# Packages

The example requires several R packages, and `targets` must be version
0.5.0.9000 or above. These can be installed with:

``` r
install.packages("devtools")
devtools::install_deps()
```

# Setup

Remove the `_targets_r` directory previously written by non-interactive
runs of the report. Otherwise, your pipeline may contain superfluous
targets.

``` r
library(targets)
tar_unscript()
```

# Globals

We first define some global options/functions common to all targets.

``` r
library(targets)
library(tarchetypes)

# Load our custom functions
library(purrr)
functions <- list.files(here::here("R"), full.names = TRUE)
purrr::walk(functions, source)
rm("functions")
tar_option_set(packages = c("purrr", "here", "jsonlite"))
#> Establish _targets.R and _targets_r/globals/example-globals.R.
```

# Targets

-   Read the parameters for each input file.

``` r
tar_target(params, {
  purrr::map(
    list.files(here::here("input"), full.names = TRUE), jsonlite::read_json
  )
})
#> Define target params from chunk code.
#> Establish _targets.R and _targets_r/targets/params.R.
```

-   Synthesize a population with 4 strains of an infectious disease
    using the parameters we just read in for each country.

``` r
tar_target(
  pop,
  do.call(synthesize_population, params[[1]]),
  map(params)
)
#> Establish _targets.R and _targets_r/targets/synthesize-population.R.
```

-   Summarise by country.

``` r
tar_target(pop_sum, {
  aggregate_dataframe(outcome ~ country, pop, calculate_quantiles)
})
#> Define target pop_sum from chunk code.
#> Establish _targets.R and _targets_r/targets/pop_sum.R.
```

-   Plot the number of infections by risk group per individual in the
    population.

``` r
tar_target(
  plot_population,
  {
    plot <- plot_infections(pop)
    add_summary_to_infections_plot(plot, pop_sum)
  }
)
#> Establish _targets.R and _targets_r/targets/plot_population.R.
```

-   Save the plot to the output directory.

``` r
tar_file(
  save_pop_plot,
  save_plot(
    plot = plot_population, file = "population.png", path = "output"
  )
)
#> Establish _targets.R and _targets_r/targets/save_pop_plot.R.
```

# Pipeline

If you ran all the `{targets}` chunks in non-interactive mode, then your
R scripts are set up to run the pipeline.

``` r
tar_make()
```

# Output

You can retrieve results from the `_targets/` data store using
`tar_read()` or `tar_load()`.

``` r
tar_read(pop_sum)
```

The `targets` dependency graph helps your readers understand the steps
of your pipeline at a high level.

``` r
tar_visnetwork()
```

At this point, you can go back and run `{targets}` chunks in interactive
mode without interfering with the code or data of the non-interactive
pipeline.
