# box_scores_detailed_load.R

# Read data in

box_scores_detailed_2014 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2014.csv"))

box_scores_detailed_2015 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2015.csv"))

box_scores_detailed_2016 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2016.csv"),
  col_types = c("nncccccccccnc", rep("c", 27)))

box_scores_detailed_2017 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2017.csv"),
  col_types = c("nncccccccccnc", rep("c", 27)))

box_scores_detailed_2018 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2018.csv"),
  col_types = c("nncccccccccnc", rep("c", 27)))

box_scores_detailed_2019 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2019.csv"),
  col_types = c("nncccccccccnc", rep("c", 27)))

box_scores_detailed_2020 <- readr::read_csv(
  here::here("data-raw/detailed_box_scores_2020.csv"),
  col_types = c("nncccccccccnc", rep("c", 27)))

# Tidying

box_scores_detailed <- dplyr::bind_rows(
  box_scores_detailed_2020,
  box_scores_detailed_2019,
  box_scores_detailed_2018,
  box_scores_detailed_2017,
  box_scores_detailed_2016) |>
  dplyr::mutate(
    minutes = stringr::str_pad(
      minutes, width = 5, side = "left", pad = "0"),
    minutes = stringr::str_pad(
      minutes, width = 6, side = "left", pad = ":"),
    minutes = stringr::str_pad(
      minutes, width = 8, side = "left", pad = "0"),
    minutes = hms::parse_hms(minutes))

usethis::use_data(box_scores_detailed, overwrite = TRUE)