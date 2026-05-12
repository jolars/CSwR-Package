angle <- read.csv(here::here("data-raw", "phipsi.csv"))
angle[, c("phi", "psi")] <- pi * angle[, c("phi", "psi")] / 180

usethis::use_data(angle, overwrite = TRUE)
