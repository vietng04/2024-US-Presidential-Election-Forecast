#### Preamble ####
# Purpose: Cleans the president polls data
# Author: 
# Date:
# Contact: 
# License: MIT
# Pre-requisites: Access to the president_polls.csv first

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tidyr)
raw_data <- read_csv("data/01-raw_data/president_polls.csv")

#### Clean data ####
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(answer, pct, pollster, methodology, population, sample_size, 
         numeric_grade, pollscore, party,transparency_score,end_date) |>
  tidyr::drop_na()
  
#### Clean data with "NYT" pollster only ####
NYT_data <-
  cleaned_data |>
  janitor::clean_names() |>
  select(pollster,methodology,population,sample_size,numeric_grade,pollscore) |>
  filter(pollster == "Siena/NYT") |>
  tidyr::drop_na()

#### Model data ####
model_data <-
  clean_data |>
  select(answer,pct,sample_size,numeric_grade,transparency_score,pollscore)

#### Save data ####
write_csv(NYT_data, "data/02-analysis_data/NYT_data.csv")
write_csv(cleaned_data, "data/02-analysis_data/cleaned_data.csv")
write_csv(model_data, "data/02-analysis_data/model_data.csv")
