# box_scores_load.R

# Read data in -----------------------------------------------------------------

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

# Tidying ----------------------------------------------------------------------

# Function for checking for whole numbers
is.wholenumber <-
  function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol

# Bind rows to join data sets across seasons
box_scores <- dplyr::bind_rows(
  box_scores_2020,
  box_scores_2019,
  box_scores_2018,
  box_scores_2017,
  box_scores_2016,
  box_scores_2015,
  box_scores_2014) |>
  # Tidy up the "time leading" variable
  dplyr::mutate(
    time_leading = dplyr::case_when(
      time_leading == 0                    ~ "0.0",
      is.wholenumber(time_leading) == TRUE ~ as.character(
        glue::glue("{time_leading}.0")),
      TRUE                                 ~ as.character(time_leading))) |>
  tidyr::separate(
    time_leading, into = c("tl_min_whole", "tl_min_decimal"),
    sep = "\\.", remove = TRUE) |>
  dplyr::mutate(
    tl_min_decimal = dplyr::case_when(
      !is.na(tl_min_decimal) ~ suppressWarnings(
        as.numeric(glue::glue("0.{tl_min_decimal}"))),
      TRUE                   ~ NA_real_),
    tl_sec = round(tl_min_decimal * 60, 0),
    tl_sec = stringr::str_pad(
      tl_sec, width = 2, side = "left", pad = "0"),
    time_leading = as.character(glue::glue("{tl_min_whole}:{tl_sec}"))) |>
  # Drop temporary variables
  dplyr::select(-tl_min_whole, -tl_sec, -contains("tl_min_decimal")) |>
  # Exclude extraneous variables
  dplyr::select(-c("points", "efficiency_custom")) |>
  # Set order of columns
  dplyr::select(
    season, page_id, team_name, team_short_name, home_away_flag,
    team_name_opp, team_short_name_opp, points_total, points_total_opp,
    points_margin, team_result, minutes, field_goals_made,
    field_goals_attempted, field_goals_percentage, three_pointers_made,
    three_pointers_attempted, three_pointers_percentage, two_pointers_made,
    two_pointers_attempted, two_pointers_percentage, free_throws_made,
    free_throws_attempted, free_throws_percentage, rebounds_defensive,
    rebounds_offensive, rebounds_total, assists, turnovers, steals, blocks,
    blocks_received, fouls_personal, fouls_team, fouls_on, fouls_total,
    points_from_turnovers, points_second_chance, points_fast_break,
    bench_points, points_in_the_paint, time_leading, everything())

# Create package data ----------------------------------------------------------

usethis::use_data(box_scores, overwrite = TRUE)