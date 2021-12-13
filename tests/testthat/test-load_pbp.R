test_that("load_pbp", {
  
  skip_on_cran()
  skip_if_offline("github.com")
  
  pbp <- load_pbp()
  
  expect_s3_class(pbp, "tbl_df")
  
})