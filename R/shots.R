#' Shots data from the Australian Women's National Basketball League (WNBL).
#'
#' `shots` contains shots data for field goals (one row per shot attempt), from games played in the Australian Women's National Basketball League. Includes details such as XY location, types of field goals (i.e., 3-pt, 2-pt) and sub-types (e.g., lay-ups, jump shots, dunks). The `shots` data set currently contains publicly available data from games played in the 2014/2015 season to the 2020 season, inclusive.
#'
#' @format A tibble with 81828 rows and 20 variables:
#' \describe{
#'   \item{season}{Numeric. Season of competition. Note that WNBL seasons typically overlap year-end. For simplicity, the first year of competition is included in the `season` variable, e.g., "2014" represents the 2014 / 2015 season.}
#'   \item{page_id}{Numeric. Unique identifier for each game. View the game stats in your browser by navigating to https://www.fibalivestats.com/u/wnbl/<page_id>/}
#'   \item{action_number}{Numeric. Unique identifier for each shot in a game. Allows for ordering of shots in the chronological sequence that they occurred.}
#'   \item{team_name}{Character. Team name.}
#'   \item{team_short_name}{Character. Team nickname.}
#'   \item{home_away_flag}{Character. Identifying whether the team represented on each row was the home or away team.}
#'   \item{team_name_opp}{Character. Opposition team name.}
#'   \item{team_short_name_opp}{Character. Opposition team nickname.}
#'   \item{period_type}{Character. A string to identify whether the period is a REGULAR period or OVERTIME.}
#'   \item{period}{Numeric. Identifies the period number. Use in conjunction with `period_type`, e.g., `period_type == "REGULAR" & period == 1` corresponds to the 1st quarter in regular play; `period_type == "OVERTIME" & period == 1` corresponds to the 1st overtime period.}
#'   \item{action_type}{Character. Type of field goal ("3pt", "2pt").}
#'   \item{sub_type}{Character. Field goal sub-type (e.g., "jumpshot", "layup", "hookshot", "fadeaway").}
#'   \item{shot_result}{Numeric. Flagging variable to indicate whether the shot was made (`shot_result == 1`) or missed (`shot_result == 0`).}
#'   \item{points_scored}{Numeric. Points scored from shot attempt (if any).}
#'   \item{x}{Double. In a top-down view of the basketball court, `x` corresponds to the estimated horizontal coordinate for each shot's location (e.g., as per an x axis on a cartesian plane).}
#'   \item{y}{Double. In a top-down view of the basketball court, `y` corresponds to estimated vertical coordinate for each shot's location (e.g., as per a y axis on a cartesian plane).}
#'   \item{first_name}{Character. Player's first name.}
#'   \item{family_name}{Character. Player's family name.}
#'   \item{scoreboard_name}{Character. Player's name as it appears on a scoreboard (e.g., Sara Blicavs = S. Blicavs).}
#'   \item{shirt_number}{Numeric. Player's shirt number.}
#' }
#' @source Australian Women's National Basketball League website \url{https://www.wnbl.com.au}
"shots"