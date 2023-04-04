
<!-- README.md is generated from README.Rmd. Please edit that file -->

# What does this code do?

Now we have refactored the code it should now be more clear that it
takes summary parameters for a country and from this generates a
synthetic population of individuals stratified into high and low risk
groups with a disease that has multiple strains and is immunising (with
no cross protection by strainn). The code then provides tools for
calculating summary statistics for the number of infections per
individual and provides a summary plot stratified by country.

# How have we reorganised the code?

# How have we refactored the code

The code here demonstrates a functional and literate approach to
re-factoring the code in `bad.R`. We have broken the code into three
steps:

-   synthesize a population (`synthesize_population.R`),
-   extract features from that population in an analysis
    (`aggregate_dataframe.R` and `calculate_quantiles.R`),
-   and finally visualize the synthetic population + analysis results
    (`plot_infections.R`).

These are stored in the `R` directory as documented functions and we use
a `DESCRIPTION` file to manage our dependencies and set up our code for
use in a package.

Below we provide a simple workflow for a single input (which has now
been renamed to match the function it is calling). We also provide a
`targets` based workflow (see `_targets.Rmd` for more on this) to run
the full analysis.

There are many other workflows that would be considered best practice
here. For more complex projects we might also want to consider a
workflow management tools such as `targets` or `Make`. The key is
focussing on verifiability, repeatability, generalisability, and
maintainability. We could also have expanded on this example by
including tests, more documentation, a vignette, and perhaps a
`Dockerfile`.

# How to use this repository

To use quick start below and to work through the examples you will first
need to have the repository locally. Once this is the case set your work
directory to the root of the repository. You can then use the following
to install the packages this repository depends on and load the package.

``` r
install.packages("devtools")
devtools::install_deps()
devtools::load_all()
```

After using `devtools::load_all()` to load the package, you can use the
inbuilt help functionality to learn more about the functions
(`?<function name>`).

# Anaylsis for a single input

-   Read the parameters for a single country

``` r
library(jsonlite) # for reading json files
library(here) # for finding files relative to project root
#> here() starts at /Users/seabbs/Downloads/badtobetter/better
params <- read_json(here("input/chile.json"))
```

-   Synthesize a population with 4 strains of an infectious disease
    using the parameters we just read-in.

``` r
library(badtobetter)
pop <- do.call(badtobetter::synthesize_population, params)
```

-   Summarise the population.

``` r
pop_sum <- aggregate_dataframe(outcome ~ 1, pop, calculate_quantiles)
```

-   Plot the number of infections by risk group per individual in the
    population.

``` r
plot <- plot_infections(pop)
add_summary_to_infections_plot(plot, pop_sum)
#> Warning in labels(...): NAs introduced by coercion
```

<img src="man/figures/plot-population-1.png" width="100%" />