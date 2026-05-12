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

nuuk <- group_by(nuuk, Year) %>%
  summarise(
    Temperature = mean(Temp_nuuk),
    Median = median(Temp_nuuk),
    High = max(Temp_nuuk),
    Low = min(Temp_nuuk),
    Range = High - Low
  ) %>%
  as.data.frame()

usethis::use_data(nuuk, overwrite = TRUE)
