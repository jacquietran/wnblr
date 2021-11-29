#' Player-level box score data from the Australian Women's National Basketball League (WNBL).
#'
#' `box_scores_detailed` contains box scores data at the player-level (one row per player per competing team), from games played in the Australian Women's National Basketball League. Includes common basketball metrics such as points scored, rebounds, assists, steals, and so on. The data set currently contains publicly available data from games played in the 2014/2015 season to the 2020 season, inclusive.
#'
#' @format A tibble with 12973 rows and 41 variables:
#' \describe{
#'   \item{season}{Numeric. Season of competition. Note that WNBL seasons typically overlap year-end. For simplicity, the first year of competition is included in the `season` variable, e.g., "2014" represents the 2014 / 2015 season.}
#'   \item{page_id}{Numeric. Unique identifier for each game. View the game stats in your browser by navigating to https://www.fibalivestats.com/u/wnbl/<page_id>/}
#'   \item{team_name}{Character. Team name for the player listed on each row.}
#'   \item{team_short_name}{Character. Team nickname for the player listed on each row.}
#'   \item{home_away_flag}{Character. Identifying whether the team represented on each row was the home or away team.}
#'   \item{team_name_opp}{Character. Opposition team name.}
#'   \item{team_short_name_opp}{Character. Opposition team nickname.}
#'   \item{first_name}{Character. Player's first name.}
#'   \item{family_name}{Character. Player's family name.}
#'   \item{first_name_initial}{Character. Initial for the player's first name.}
#'   \item{family_name_initial}{Character. Initial for the player's family name.}
#'   \item{scoreboard_name}{Character. Player's name as it appears on a scoreboard (e.g., Sara Blicavs = S. Blicavs).}
#'   \item{playing_position}{Character. Player's typical on-court position. G = Guard, F = Forward, C = Centre).}
#'   \item{starter}{Numeric. Flagging variable to indicate whether the player started on-court for any given game or not. Started on-court: `starter == 1`, started on the bench: `starter == 0`.}
#'   \item{minutes}{Character. Player's minutes played, in mm:ss.}
#'   \item{points}{Numeric. Number of points scored.}
#'   \item{points_second_chance}{Numeric. Number of second-chance points.}
#'   \item{points_fast_break}{Numeric. Number of points from fast breaks.}
#'   \item{points_in_the_paint}{Numeric. Number of points scored in the key area (colloquially, "in the paint").}
#'   \item{points_from_turnovers}{Numeric. Number of points scored from turnovers.}
#'   \item{field_goals_made}{Numeric. Number of successful field goals.}
#'   \item{field_goals_attempted}{Numeric. Number of attempted field goals.}
#'   \item{field_goals_percentage}{Numeric. `field_goals_made` divided by `field_goals_attempted` multiplied by 100.}
#'   \item{three_pointers_made}{Numeric. Number of successful field goals.}
#'   \item{three_pointers_attempted}{Numeric. Number of attempted field goals}
#'   \item{three_pointers_percentage}{Numeric. `three_pointers_made` divided by `three_pointers_attempted` multiplied by 100.}
#'   \item{two_pointers_made}{Numeric. Number of two-point field goals made.}
#'   \item{two_pointers_attempted}{Numeric. Number of two-point field goals attempted.}
#'   \item{two_pointers_percentage}{Numeric. `two_pointers_made` divided by `two_pointers_attempted` multiplied by 100.}
#'   \item{free_throws_made}{Numeric. Number of free throws made.}
#'   \item{free_throws_attempted}{Numeric. Number of free throws attempted.}
#'   \item{free_throws_percentage}{Numeric. `free_throws_made` divided by `free_throws_attempted` multiplied by 100.}
#'   \item{rebounds_defensive}{Numeric. Total number of defensive rebounds.}
#'   \item{rebounds_offensive}{Numeric. Total number of offensive rebounds.}
#'   \item{rebounds_total}{Numeric. Total number of rebounds, `rebounds_defensive` plus `rebounds_offensive`.}
#'   \item{assists}{Numeric. Number of assists.}
#'   \item{turnovers}{Numeric. Number of turnovers.}
#'   \item{steals}{Numeric. Number of steals.}
#'   \item{blocks}{Numeric. Number of blocks.}
#'   \item{blocks_received}{Numeric. Number of blocks received.}
#'   \item{fouls_personal}{Numeric. Number of personal fouls.}
#'   \item{fouls_on}{Numeric. Number of fouls on.}
#'   \item{plus_minus}{Numeric. Plus/minus player rating.}
#' }
#' @source Australian Women's National Basketball League website \url{https://www.wnbl.com.au}
"box_scores_detailed"