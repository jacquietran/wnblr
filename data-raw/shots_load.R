# shots_load.R

# Read data in -----------------------------------------------------------------

shots_2014 <- readr::read_csv(
  here::here("data-raw/shots_2014.csv"))

shots_2015 <- readr::read_csv(
  here::here("data-raw/shots_2015.csv"))

shots_2016 <- readr::read_csv(
  here::here("data-raw/shots_2016.csv"))

shots_2017 <- readr::read_csv(
  here::here("data-raw/shots_2017.csv"))

shots_2018 <- readr::read_csv(
  here::here("data-raw/shots_2018.csv"))

shots_2019 <- readr::read_csv(
  here::here("data-raw/shots_2019.csv"))

shots_2020 <- readr::read_csv(
  here::here("data-raw/shots_2020.csv"))

# Tidying ----------------------------------------------------------------------

shots <- dplyr::bind_rows(
  shots_2020,
  shots_2019,
  shots_2018,
  shots_2017,
  shots_2016,
  shots_2015,
  shots_2014) |>
  dplyr::arrange(desc(season), page_id, action_number)

# Create package data ----------------------------------------------------------

usethis::use_data(shots, overwrite = TRUE)