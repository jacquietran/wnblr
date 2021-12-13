#' Load play-by-play data.
#'
#' @return A data set containing all available play-by-play data, from games played since the 2014/15 season onwards.
#' @export
#'
#' @examples
#' pbp_data <- load_pbp()
load_pbp <- function(){
  
  url_string <- "https://github.com/jacquietran/wnblr_data/raw/main/data/pbp.rds"
  
  out <- readRDS(url(url_string))
  
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  
  out
  
}