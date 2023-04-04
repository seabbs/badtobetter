# function to simulate a population
# arguments:
#  num_samples, the size of the population
#  prob_high_risk, the probability of being high risk
#  prob_exposure_hr, the exposure probability for high risk individuals
#  prob_exposure_lr, the exposure probability for low risk individuals

#' FUNCTION_TITLE
#'
#' FUNCTION_DESCRIPTION
#'
#' @param num_samples DESCRIPTION.
#' @param prob_high_risk DESCRIPTION.
#' @param prob_exposure_hr DESCRIPTION.
#' @param prob_exposure_lr DESCRIPTION.
#' @param max_exposure_years DESCRIPTION.
#' @param num_strains DESCRIPTION.
#' @param country DESCRIPTION.
#'
#' @return RETURN_DESCRIPTION
#' @export
#' @examples
#' # ADD_EXAMPLES_HERE
synthesize_population <- function(num_samples = 1000, prob_high_risk,
                                  prob_exposure_hr, prob_exposure_lr,
                                  max_exposure_years = 30, num_strains = 4,
                                  country) {
  # create a container for data
  population <- allocate_results(num_samples, country = country)

  # create a logical vector of which individuals will be high risk
  # TRUE == high risk
  which_high_risk <- runif(num_samples) < prob_high_risk
  population$high_risk <- which_high_risk

  # use that vector to get each individuals risk
  prob_risk <- ifelse(which_high_risk, prob_exposure_hr, prob_exposure_lr)

  # for each person in the population...
  for (id in 1:num_samples) {
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

#' FUNCTION_TITLE
#'
#' FUNCTION_DESCRIPTION
#'
#' @param num_samples DESCRIPTION.
#' @param country DESCRIPTION.
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' # ADD_EXAMPLES_HERE
allocate_results <- function(num_samples, country) {
  return(data.frame(
    id = 1:num_samples, country = country, high_risk = NA,
    outcome = NA_integer_)
  )
}
