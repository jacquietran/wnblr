# box_scores_load.R

# Read data in

box_scores_2016 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2016.csv"))

box_scores_2017 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2017.csv"))

box_scores_2018 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2018.csv"))

box_scores_2019 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2019.csv"))

box_scores_2020 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2020.csv"))

# Tidying

# For the 2016/17, 2017/18, and 2018/19 seasons,
# create new variables fouls_total and fouls_team
# which will be columns with no values for the purposes of
# binding rows across season data sets from 2016 to 2020
box_scores_2016 |>
  dplyr::mutate(
    fouls_total = NA_real_,
    fouls_team = NA_real_) -> box_scores_2016_tidy

box_scores_2017 |>
  dplyr::mutate(
    fouls_total = NA_real_,
    fouls_team = NA_real_) -> box_scores_2017_tidy

box_scores_2018 |>
  dplyr::mutate(
    fouls_total = NA_real_,
    fouls_team = NA_real_) -> box_scores_2018_tidy

# Bind rows to join data sets across seasons
box_scores <- dplyr::bind_rows(
  box_scores_2020,
  box_scores_2019,
  box_scores_2018,
  box_scores_2017,
  box_scores_2016)

usethis::use_data(box_scores, overwrite = TRUE)