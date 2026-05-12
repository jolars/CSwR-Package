library(tidyverse)

nuuk <- read_table(
  here::here("data-raw", "nuuk.txt"),
  col_names = c("Year", 1:12),
  na = "-999",
  skip = 1
) %>%
  gather(key = "Month", value = "Temp_nuuk", -Year, convert = TRUE) %>%
  mutate(Temp_nuuk = Temp_nuuk / 10) %>%
  filter(Year > 1866)

Qaqortoq <- read_table(
  here::here("data-raw", "qaqortoq.dat"),
  col_names = c("Year", 1:12),
  na = "-999",
  skip = 1
) %>%
  gather(key = "Month", value = "Temp_Qaqortoq", -Year, convert = TRUE) %>%
  mutate(Temp_Qaqortoq = Temp_Qaqortoq / 10) %>%
  filter(Year > 1866)

greenland <- left_join(nuuk, Qaqortoq) %>%
  filter(complete.cases(.)) %>%
  mutate(Temp_diff = Temp_nuuk - Temp_Qaqortoq) %>%
  as.data.frame()

usethis::use_data(greenland, overwrite = TRUE)
