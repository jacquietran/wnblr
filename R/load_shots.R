#' Load shots data.
#'
#' @return A data set containing all available shots data, from games played since the 2014/15 season onwards.
#' @export
#'
#' @examples
#' shots_data <- load_shots()
load_shots <- function(){
  
  url_string <- "https://github.com/jacquietran/wnblr_data/raw/main/data/shots.rds"
  
  out <- readRDS(url(url_string))
  
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  
  out
  
}