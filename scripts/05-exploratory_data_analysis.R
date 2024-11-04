#### Preamble ####
# Purpose: Model the data to understand the data better before applying any predictive models or deeper analysis
# Author: Yihang Xu
# Date: 2 November 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(dplyr)
library(reshape2)

set.seed(10086)
#### Read data ####
NYT_data <- read_csv("data/02-analysis_data/NYT_data.csv")

#### Model Data ####
#Simple Linear Model to predict pollscore based on sample_size
model <- lm(pollscore ~ sample_size, data = NYT_data)

# Summary of the model
summary(model)

# Visualize model fit
plot(NYT_data$sample_size, NYT_data$pollscore, main = "Sample Size vs Poll Score", xlab = "Sample Size", ylab = "Poll Score", pch = 19, col = "darkblue")
abline(model, col = "red", lwd = 2)


#### Save model ####
saveRDS(model, file = "pollscore_model.rds")



