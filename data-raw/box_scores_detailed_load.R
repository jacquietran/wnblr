# box_scores_detailed_load.R

# Read data in -----------------------------------------------------------------

box_scores_detailed_2014 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2014.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2015 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2015.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2016 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2016.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2017 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2017.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2018 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2018.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2019 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2019.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

box_scores_detailed_2020 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2020.csv"),
  col_types = c("nncccccccccncnnnnnnnnnnnnnnnnnnnnnnnnnnn"))

# Tidying ----------------------------------------------------------------------

box_scores_detailed <- dplyr::bind_rows(
  box_scores_detailed_2020,
  box_scores_detailed_2019,
  box_scores_detailed_2018,
  box_scores_detailed_2017,
  box_scores_detailed_2016,
  box_scores_detailed_2015,
  box_scores_detailed_2014) |>
  dplyr::select(
    season, page_id, team_name, team_short_name, home_away_flag, team_name_opp,
    team_short_name_opp, first_name, family_name, scoreboard_name,
    playing_position, starter, minutes, points, points_second_chance,
    points_fast_break, points_in_the_paint, points_from_turnovers, everything())

# Create package data ----------------------------------------------------------

usethis::use_data(box_scores_detailed, overwrite = TRUE)