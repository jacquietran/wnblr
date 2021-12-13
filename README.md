
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wnblr <img src="man/img/wnblr_hex_green_bg.png" align="right" height="150" /> <img src="man/img/wnblr_hex_gold_bg.png" align="right" height="150" />

<!-- badges: start -->

<a href="https://www.repostatus.org/#wip"><img src="https://www.repostatus.org/badges/latest/wip.svg" alt="Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public." /></a>
[![GitHub latest
commit](https://img.shields.io/github/last-commit/jacquietran/wnblr)](https://github.com/badges/shields)
[![GitHub open
issues](https://img.shields.io/github/issues-raw/jacquietran/wnblr)](https://github.com/jacquietran/wnblr/issues)
<!-- badges: end -->

The `wnblr` package provides access to a range of game statistics from
the Australian [**Women’s National Basketball League
(WNBL)**](https://www.wnbl.com.au):

-   `load_box_scores()`: Team-level box scores, with all your usual
    basketball box score metrics like points scored, field goals made /
    attempted, free throws made / attempted, rebounds, turnovers, and
    the like.
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

# Frequency of shot types attempted in the 2020 season
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

With a little bit of elbow grease, you can move neatly from data to
plot, too:

``` r
# Load libraries
library(ggplot2)
library(showtext)

# Tidy data
magbegor <- box_scores_detailed %>%
  filter(scoreboard_name == "E. Magbegor") %>%
  select(season, contains("field_goals")) %>%
  group_by(season) %>%
  summarise(
    `Field goals made` = round(mean(field_goals_made), 1),
    `Field goals attempted` = round(mean(field_goals_attempted), 1),
    `Field goal %` = round(mean(field_goals_percentage), 1)) %>%
  ungroup() %>%
  tidyr::pivot_longer(
    cols = c(`Field goals made`,
             `Field goals attempted`,
             `Field goal %`),
    names_to = "key",
    values_to = "value") %>%
  mutate(
    key = factor(
      key, levels = c("Field goals made",
                      "Field goals attempted",
                      "Field goal %")))

# Import Google Fonts
font_add_google(name = "Patua One", family = "patua")
font_add_google(name = "Source Sans Pro", family = "source")

# Build plot
showtext_auto()
# After building the plot, run showtext_auto(FALSE) to close off
ggplot(
  magbegor,
  aes(x = season, y = value, group = key, fill = key)) +
  facet_wrap(~key, nrow = 1, scales = "free_y") +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("#FFC53D", "#688d3a", "#0E4735")) +
  labs(
    title = "Ezi Magbegor: WNBL shooting averages from 2017-2020",
    x = "Season", y = NULL,
    caption = "Data source: {wnblr} & WNBL.com.au | Plot: @jacquietran") +
  ggdark::dark_mode() +
  theme(
    legend.position = "none",
    text = element_text(
      colour = "#FFFFFF", family = "source", size = 48),
    plot.title = element_text(
      family = "patua", margin=margin(0,0,15,0)),
    plot.caption = element_text(margin=margin(15,0,0,0)))
```

<img src="man/figures/README-plot-1.png" width="100%" />

## Known issues

Game data is missing or wildly incomplete for some games in most of the
seasons from 2014/2015 to 2020, as documented
[here](https://github.com/jacquietran/wnblr/issues/23). If anyone has
leads on where to find live stats from the games listed as “missing”,
feel free to log an issue and let me know!

## Hex logos

Courtesy of
[**@PythonUnicornCoder**](https://github.com/PythonUnicornCoder) - thank
you!!
