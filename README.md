# 2024 US Presidential Election Forecast Model

## Overview

This project develops a linear/generalized linear model to forecast the outcome of the 2024 US Presidential Election using a poll-of-polls approach. The model integrates and analyzes polling data from various sources to predict the likely winner based on current public sentiment.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the president_polls(Presidential General Election Eolls) data as obtained from FiveThirtyEight.
-   `data/analysis_data` contains the cleaned dataset, model dataset, NYT dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the AI CHATGPT. The abstract and introduction were written with the help of Chatgpt and the entire chat history is available in inputs/llms/usage.txt.
