load_box_scores <- function(){
  
  url_string <- "https://github.com/jacquietran/wnblr_data/raw/main/data/box_scores.rds"
  
  out <- readRDS(url(url_string))
  
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  
  out
  
}