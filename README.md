
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wnblr <img src="man/img/wnblr_hex_green_bg.png" align="right" height="150" /> <img src="man/img/wnblr_hex_gold_bg.png" align="right" height="150" />

<!-- badges: start -->

<a href="https://www.repostatus.org/#wip"><img src="https://www.repostatus.org/badges/latest/wip.svg" alt="Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public." /></a>
[![GitHub latest
commit](https://img.shields.io/github/last-commit/jacquietran/wnblr)](https://github.com/badges/shields)
[![GitHub open
issues](https://img.shields.io/github/issues-raw/jacquietran/wnblr)](https://github.com/jacquietran/wnblr/issues)
<!-- badges: end -->

The `wnblr` package contains a range of game statistics from the
Australian [**Women’s National Basketball League
(WNBL)**](https://www.wnbl.com.au):

-   `box_scores`: Team-level box scores, with all your usual basketball
    box score metrics like points scored, field goals made / attempted,
    free throws made / attempted, rebounds, turnovers, and the like.
-   `box_scores_detailed`: Player-level box scores.
-   `pbp`: Play-by-play data.
-   `shots`: Shots data, primarily containing XY shot locations.

## Installation

Install the development version of `wnblr` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("jacquietran/wnblr")
```

## Examples

There’s lots to work with - for example, here’s a quick look at the
`shots` data:

``` r
# Load libraries
library(wnblr)
library(dplyr)

# Summarise frequency of different shot types
shots %>%
  filter(season == 2020) %>%
  select(sub_type, shot_result) %>%
  group_by(sub_type) %>%
  summarise(n = n()) %>%
  ungroup() %>%
  arrange(desc(n))
#> # A tibble: 10 x 2
#>    sub_type               n
#>    <chr>              <int>
#>  1 jumpshot            3381
#>  2 layup               2003
#>  3 drivinglayup         779
#>  4 pullupjumpshot       648
#>  5 turnaroundjumpshot   414
#>  6 stepbackjumpshot     209
#>  7 hookshot             162
#>  8 floatingjumpshot     141
#>  9 fadeaway              42
#> 10 alleyoop               1
```

``` r
# yellow = #FFC53D
# green = #0E4735
```

## Hex logos

Courtesy of
[**@PythonUnicornCoder**](https://github.com/PythonUnicornCoder) - thank
you!!
