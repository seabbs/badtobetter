#' Simulate the number of infections individuals in a population have had
#'
#' @description This function simulates the number of infections individuals in
#' a population have had from a pathogen with a number of immunising strains
#' (with no cross-immunity).
#'
#' @details The population is assumed to have two risk groups
#' (high and low) and the probability of being in the high risk group is
#' specified by the user. The probability of exposure to a strain is also
#' specified by the user. The number of infections is calculated using the
#' number of years an individual has been exposed to the pathogen combined with
#' the risk of infection in each year. These exposures are then assigned a
#' strain. As the pathogen is assumed to be immunising the number of
#' infections for each individual is then the number of unique strains an
#' individual has been exposed to.
#'
#' @param num_individuals Numeric, defaults to 1000. The number of individuals
#' to simulate
#'
#' @param prob_high_risk Numeric, defaults to 0.1. The probability of being
#' high risk.
#'
#' @param prob_exposure_hr Numeric, defaults to 0.5. The probability of
#' exposure for high risk individuals.
#'
#' @param prob_exposure_lr Numeric, defaults to 0.1. The probability of
#' exposure for low risk individuals.
#'
#' @param max_exposure_years Numeric, defaults to 30. The maximum number of
#' years an individual can be exposed to the pathogen.
#'
#' @param num_strains Numeric, defaults to 4. The number of strains of the
#' pathogen.
#'
#' @param country Character, defaults to "placeholder". The country of origin
#' for the simulated population.
#'
#' @return A [data.frame] with the following columns:
#' - `id`: The individual's id.
#' - `country`: The country of origin.
#' - `high_risk`: A logical indicating whether the individual is high risk.
#' - `outcome`: The number of infections.
#'
#' @importFrom stats runif rbinom
#' @export
#' @examples
#' synthesize_population(
#'  prob_high_risk = 0.1, prob_exposure_hr = 0.5, prob_exposure_lr = 0.1
#' )
synthesize_population <- function(num_individuals = 1000, prob_high_risk = 0.1,
                                  prob_exposure_hr = 0.5, prob_exposure_lr,
                                  max_exposure_years = 30, num_strains = 4,
                                  country = "placeholder") {
  # create a container for data
  population <- allocate_results(num_individuals, country = country)

  # create a logical vector of which individuals will be high risk
  # TRUE == high risk
  which_high_risk <- runif(num_individuals) < prob_high_risk
  population$high_risk <- which_high_risk

  # use that vector to get each individuals risk
  prob_risk <- ifelse(which_high_risk, prob_exposure_hr, prob_exposure_lr)

  # for each person in the population...
  for (id in 1:num_individuals) {
    # get their number of exposures
    num_exposures <- rbinom(1, max_exposure_years, prob_risk[id])

    # get the strain of those exposures
    exposure_strains <- sample(1:num_strains, num_exposures, replace = TRUE)

    # since strains are immunizing, the number of infections == number of
    # unique strains
    num_infections <- length(unique(exposure_strains))

    # store result
    population[id, ]$outcome <- num_infections
  }
  return(population)
}

# utility function for pre-allocating the population data structure

#' Allocate a data.frame to store the results of the simulation
#'
#' @inheritParams synthesize_population
#'
#' @return A [data.frame] with the following columns:
#' - `id`: The individual's id.
#' - `country`: The country of origin.
#' - `high_risk`: A logical indicating whether the individual is high risk.
#' - `outcome`: The number of infections.
#'
#' @examples
#' badtobetter:::allocate_results(10, "placeholder")
allocate_results <- function(num_individuals, country) {
  return(data.frame(
    id = 1:num_individuals, country = country, high_risk = NA,
    outcome = NA_integer_)
  )
}
