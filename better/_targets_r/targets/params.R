tar_target(params, {
  purrr::map(
    list.files(here::here("input"), full.names = TRUE), jsonlite::read_json
  )
})
