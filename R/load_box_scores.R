#' Load team-level box scores data.
#'
#' @return A data set containing all available box scores at the team level, from games played since the 2014/15 season onwards.
#' @export
#'
#' @examples
#' box_scores_data <- load_box_scores()
load_box_scores <- function(){
  
  url_string <- "https://github.com/jacquietran/wnblr_data/raw/main/data/box_scores.rds"
  
  out <- readRDS(url(url_string))
  
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  
  out
  
}