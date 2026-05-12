vegetables <- readr::read_csv(
  here::here("data-raw", "vegetables.csv"),
  col_types = readr::cols(store = "c")
) |>
  as.data.frame()

usethis::use_data(vegetables, overwrite = TRUE)
