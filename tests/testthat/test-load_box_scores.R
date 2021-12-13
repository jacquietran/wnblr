test_that("load_box_scores", {
  
  skip_on_cran()
  skip_if_offline("github.com")
  
  box_scores <- load_box_scores()
  
  expect_s3_class(box_scores, "tbl_df")
  
})
