library(targets)
library(tarchetypes)

# Load our custom functions
library(purrr)
functions <- list.files(here::here("R"), full.names = TRUE)
purrr::walk(functions, source)
rm("functions")
tar_option_set(packages = c("purrr", "here", "jsonlite"))
