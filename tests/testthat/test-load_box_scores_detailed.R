test_that("load_box_scores_detailed", {
  
  skip_on_cran()
  skip_if_offline("github.com")
  
  box_scores_detailed <- load_box_scores_detailed()
  
  expect_s3_class(box_scores_detailed, "tbl_df")
  
})
