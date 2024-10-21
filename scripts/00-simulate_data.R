#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
df <- read_csv("../data/01-raw_data/president_polls.csv")

max_id <- max(df$poll_id)

pollster <- unique(df$pollster)

pollscore <- unique(df$pollscore)

party <- unique(df$party)

max_size <- max(df$sample_size, na.rm = TRUE)

answer <- unique(df$answer)
percentages <- prop.table(table(df$answer)) * 100 #percentages for each answer
precentages <- as.numeric(percentages[match(answer, names(percentages))])  # Align with `answer`

#### Simulate data ####
sim_size <- 2000

# Poll IDs
sim_id <- sample(1:max_id, sim_size, replace = TRUE)

# Pollster
sim_pollster <- sample(pollster, sim_size, replace = TRUE)

# PollScore
sim_pollscore <- sample(pollscore, sim_size, replace = TRUE)

# Party
sim_party <- sample(party, sim_size, replace = TRUE)

# Sample Size
sim_sample_size <- sample(1:max_size, sim_size, replace = TRUE)

# Percentage
sim_pct <- pct <- rpois(2000, 50)

# Answer
sim_answer <- sample(answer, sim_size, replace = TRUE, prob = precentages)

# Create a dataset by randomly assigning states and parties to divisions

sim_data <- tibble(
  Poll_ID = sim_id,
  Pollster = sim_pollster,
  PollScore = sim_pollscore,
  Sample_Size = sim_sample_size,
  Party = sim_party,
  PCT = sim_pct,
  Answer = sim_answer
  )

#### Save data ####
write_csv(sim_data, "../data/00-simulated_data/simulated_data.csv")
