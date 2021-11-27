# pbp_load.R

# Read data in
pbp_2014 <- readr::read_csv(
  here::here("data-raw/pbp_2014.csv"),
  col_types = c("nnnccccccncnnncccnn"))

pbp_2015 <- readr::read_csv(
  here::here("data-raw/pbp_2015.csv"),
  col_types = c("nnnccccccncnnncccnccnn"))

pbp_2016 <- readr::read_csv(
  here::here("data-raw/pbp_2016.csv"),
  col_types = c("nnnccccccncnnncccnccnn"))

pbp_2017 <- readr::read_csv(
  here::here("data-raw/pbp_2017.csv"),
  col_types = c("nnnccccccncnnncccnccnn"))

pbp_2018 <- readr::read_csv(
  here::here("data-raw/pbp_2018.csv"),
  col_types = c("nnnccccccncnnncccnccnnnnnnnnnnnn"))

pbp_2019 <- readr::read_csv(
  here::here("data-raw/pbp_2019.csv"),
  col_types = c("nnnccccccncnnncccnccnnnnnnnnnnnn"))

pbp_2020 <- readr::read_csv(
  here::here("data-raw/pbp_2020.csv"),
  col_types = c("nnnccccccncnnncccnccnnnnnnnnnnnn"))

# Tidying
pbp <- dplyr::bind_rows(
  pbp_2020,
  pbp_2019,
  pbp_2018,
  pbp_2017,
  pbp_2016,
  pbp_2015,
  pbp_2014) |>
  dplyr::arrange(desc(season), page_id, action_number)

usethis::use_data(pbp, overwrite = TRUE)