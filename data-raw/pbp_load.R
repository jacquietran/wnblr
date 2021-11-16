# pbp_load.R

# Read data in

pbp_2016 <- readr::read_csv(
  here::here("data-raw/pbp_2016.csv"),
  col_types = c("nnnnccccccncnnncnccnncccc"))

pbp_2017 <- readr::read_csv(
  here::here("data-raw/pbp_2017.csv"),
  col_types = c("nnnnccccccncnnncncccnncccc"))

pbp_2018 <- readr::read_csv(
  here::here("data-raw/pbp_2018.csv"),
  col_types = c("nnnnccccccncnnncncccnnccccnccc"))

pbp_2019 <- readr::read_csv(
  here::here("data-raw/pbp_2019.csv"),
  col_types = c("nnnnnccccccncnnncncccnnccccccccc"))

pbp_2020 <- readr::read_csv(
  here::here("data-raw/pbp_2020.csv"),
  col_types = c("nnnnnccccccnccnnncncccnnccccccccc"))

# Tidying

pbp_2016 |>
  dplyr::mutate(
    previous_action = NA_real_,
    qualifier = NA_character_,
    qualifier1 = NA_character_,
    qualifier2 = NA_character_,
    qualifier3 = NA_character_,
    qualifier4 = NA_character_
  ) -> pbp_2016_tidy

pbp_2017 |>
  dplyr::mutate(
    previous_action = NA_real_,
    qualifier1 = NA_character_,
    qualifier2 = NA_character_,
    qualifier3 = NA_character_,
    qualifier4 = NA_character_
  ) -> pbp_2017_tidy

pbp_2018 |>
  dplyr::mutate(
    qualifier4 = NA_character_) -> pbp_2018_tidy

pbp_2019 |>
  dplyr::select(-scoreboard_name) -> pbp_2019_tidy

pbp_2020 |>
  dplyr::select(
    -c("clock", "scoreboard_name")) -> pbp_2020_tidy

# Bind rows to merge data across season
pbp <- dplyr::bind_rows(
  pbp_2020_tidy,
  pbp_2019_tidy,
  pbp_2018_tidy,
  pbp_2017_tidy,
  pbp_2016_tidy)

usethis::use_data(pbp, overwrite = TRUE)