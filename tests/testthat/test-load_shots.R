test_that("load_shots", {
  
  skip_on_cran()
  skip_if_offline("github.com")
  
  shots <- load_shots()
  
  expect_s3_class(shots, "tbl_df")
  
})