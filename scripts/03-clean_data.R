#### Preamble ####
# Purpose: Cleans the president polls data to the Siena/NYT pollster only data [...UPDATE THIS...]
# Author: 
# Date:
# Contact: 
# License: MIT
# Pre-requisites: Access to the president_polls.csv first

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/president_polls.csv")

NYT_data <-
  raw_data |>
  janitor::clean_names() |>
  select(pollster,methodology,population,population_full,sample_size,numeric_grade,pollscore) |>
  filter(pollster == "Siena/NYT") |>
  tidyr::drop_na()

#### Save data ####
write_csv(NYT_data, "data/02-analysis_data/NYT_data.csv")

