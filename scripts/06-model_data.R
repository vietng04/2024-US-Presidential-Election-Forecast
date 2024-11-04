#### Preamble ####
# Purpose: Models
# Author: Yihang Xu
# Date: 3 November 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(knitr)
library(arrow)

#### Read data ####
nyt_data <- read_parquet("/Users/xuyihang/Desktop/1314520hh/2024-US-Presidential-Election-Forecast/data/02-analysis_data/NYT_data.parquet")
cleaned_data <- read_parquet("/Users/xuyihang/Desktop/1314520hh/2024-US-Presidential-Election-Forecast/data/02-analysis_data/cleaned_data.parquet")
model_data <- read_parquet("/Users/xuyihang/Desktop/1314520hh/2024-US-Presidential-Election-Forecast/data/02-analysis_data/model_data.parquet")

### Model data ####
trump_data <- cleaned_data %>% filter(answer == "Trump")
trump_model <- lm(pct ~ pollscore + sample_size + numeric_grade + transparency_score, data = trump_data)
summary(trump_model)

harris_data <- model_data %>% filter(answer == "Harris")
harris_model <- lm(pct ~ pollscore + sample_size + numeric_grade + transparency_score, data = harris_data)
summary(harris_model)

#### Save model ####
# Create the 'models' directory if it does not exist
if (!dir.exists("models")) {
  dir.create("models")
}

# Save the model
saveRDS(
  trump_model,
  file = "models/trump_model.rds"
)

# Save the Harris model as well
saveRDS(
  harris_model,
  file = "models/harris_model.rds"
)



