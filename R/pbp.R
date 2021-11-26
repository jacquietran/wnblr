#' Play-by-play data from the Australian Women's National Basketball League (WNBL).
#'
#' Contains play-by-play data (one row per game event), from games played in the Australian Women's National Basketball League. The data set currently contains publicly available data from games played in the 2014/2015 season to the 2020 season, inclusive.
#'
#' @format A tibble with 321566 rows and 33 variables:
#' \describe{
#'   \item{season}{Numeric. Season of competition. Note that WNBL seasons typically overlap year-end. For simplicity, the first year of competition is included in the `season` variable, e.g., "2014" represents the 2014 / 2015 season.}
#'   \item{page_id}{Numeric. Unique identifier for each game. View the game stats in your browser by navigating to https://www.fibalivestats.com/u/wnbl/<page_id>/}
#'   \item{action_number}{Numeric. Unique identifier for each play in a game. Allows for ordering of plays in the chronological sequence that they occurred.}
#'   \item{team_name}{Character. Team name.}
#'   \item{team_short_name}{Character. Team nickname.}
#'   \item{home_away_flag}{Character. Identifying whether the team represented on each row was the home or away team.}
#'   \item{team_name_opp}{Character. Opposition team name.}
#'   \item{team_short_name_opp}{Character. Opposition team nickname.}
#'   \item{period_type}{Character. A string to identify whether the period is a REGULAR period or OVERTIME.}
#'   \item{period}{Numeric. Identifies the period number. Use in conjunction with `period_type`, e.g., `period_type == "REGULAR" & period == 1` corresponds to the 1st quarter in regular play; `period_type == "OVERTIME" & period == 1` corresponds to the 1st overtime period.}
#'   \item{game_time}{Character. Time on the game clock (within period) that corresponds to each play, expressed as mm:ss.}

#'   \item{team1_score}{Numeric. Cumulative score for the team listed in `team_name`.}
#'   \item{team2_score}{Numeric. Cumulative score for the team listed in `team_name_opp`.}
#'   \item{margin_team1_minus_team2}{}

#'   \item{success}{Numeric. Flagging variable to indicate whether a play was successful (0 = successful, 1 = not succesful).}
#'   \item{action_type}{Character. Type of game action (e.g., "jumpball", "rebound", "assist").}
#'   \item{qualifier}{Character. Additional information about the game action (e.g., "fromturnover", "2ndchance", "blocked").}
#'   \item{sub_type}{Character. Action sub-type (e.g., "heldball", "badpass", "travel").}
#'   \item{scoring}{Numeric. Flagging variable to indicate whether a game action was a scoring attempt (0 = not a scoring attempt, 1 = scoring attempt).}
#'   \item{shirt_number}{Numeric. Player's shirt number.}
#'   \item{first_name}{Character. Player's first name.}
#'   \item{family_name}{Character. Player's family name.}
#'   \item{first_name_initial}{Character. Initial for the player's first name.}
#'   \item{family_name_initial}{Character. Initial for the player's family name.}
#'   \item{scoreboard_name}{Character. Player's name as it appears on a scoreboard (e.g., Sara Blicavs = S. Blicavs).}
#'   \item{qualifier1}{Character. Additional information about the game action.}
#'   \item{qualifier2}{Character. Additional information about the game action.}
#'   \item{qualifier3}{Character. Additional information about the game action.}
#'   \item{qualifier4}{Character. Additional information about the game action.}
#' }
#' @source Australian Women's National Basketball League website \url{https://www.wnbl.com.au}
"pbp"