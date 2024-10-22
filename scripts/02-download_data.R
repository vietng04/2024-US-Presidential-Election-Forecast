#### Preamble ####
# Purpose: Downloads and saves the data from FiveThrityEight
# Author: Viet Nguyen
# Date: 21 October 2024
# Contact: viethoang.nguyen@utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)

#### Download data ####
raw_data <- read_csv("/Users/nguyenviet/Documents/term-paper-2/data/01-raw_data/president_polls.csv")

clean_data <- raw_data |> select(pollster, display_name, 
                                 pollster_rating_id, numeric_grade, pollscore,
                                 transparency_score, state, start_date, end_date, 
                                 sample_size, election_date, 
                                 party, answer, candidate_name, pct) %>%
  filter(pollster=="Siena/NYT") %>% filter(!is.na(state))

#### Save data ####
write_csv(clean_data, "/Users/nguyenviet/Documents/term-paper-2/data/01-raw_data/clean_data.csv")