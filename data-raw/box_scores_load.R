# box_scores_load.R

# Read data in

box_scores_2014 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2014.csv"))

box_scores_2015 <- readr::read_csv(
  here::here("data-raw/team_box_scores_2015.csv"))

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

# Bind rows to join data sets across seasons
box_scores <- dplyr::bind_rows(
  box_scores_2020,
  box_scores_2019,
  box_scores_2018,
  box_scores_2017,
  box_scores_2016,
  box_scores_2015,
  box_scores_2014)

usethis::use_data(box_scores, overwrite = TRUE)