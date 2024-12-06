library(dplyr)
library(readr)

url <- "https://raw.githubusercontent.com/yoursdearboy/ib-2024-git/refs/heads/main/data/billboard100.csv"

httr::GET(url, httr::write_disk("billboard.csv", overwrite = TRUE))

top100 <- read_csv("billboard.csv")

top10 <- top100 |>
  group_by(Date) |>
  filter(row_number() <= 10) |>
  ungroup()

write_csv(top10, "billboard.csv")
