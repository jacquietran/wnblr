#' Load player-level box scores data.
#'
#' @return A data set containing all available box scores at the player level, from games played since the 2014/15 season onwards.
#' @export
#'
#' @examples
#' box_scores_detailed_data <- load_box_scores_detailed()
load_box_scores_detailed <- function(){
  
  url_string <- "https://github.com/jacquietran/wnblr_data/raw/main/data/box_scores_detailed.rds"
  
  out <- readRDS(url(url_string))
  
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  
  out
  
}