# Data Analysis with R Programming

This directory is part of the Google Data Analytics Capstone Repository and focuses on applying R programming for data analysis tasks. It contains exercises, scripts, and visual outputs that demonstrate key concepts in statistical analysis, data wrangling, and visualization using R.

## Contents

- R Scripts
  - Exercise_1.R – Introduction to R basics and simple data operations
  - Exercise_2.R – Working with vectors, data frames, and basic functions
  - Exercise_3.R – Exploratory data analysis and summary statistics
  - Exercise_4.R / Exercise_4_a.R – Data cleaning and transformation workflows
  - Exercise_6.R – Applying conditional logic and loops in R
  - Exercise_7.R – Advanced data wrangling with dplyr and tidyr
  - Exercise_8.R – Visualization with ggplot2
  - Exercise_9.R – Statistical modeling and hypothesis testing

- Plots & Visualizations
  - Rplot.png, Rplot_1.png … Rplot_15.png – Generated plots from exercises
  - Rplot01_16.png … Rplot01_22.png – Additional visual outputs


## Learning Objectives

By working through these exercises, you will:
- Gain hands-on experience with R programming for analytics
- Learn how to clean, transform, and manipulate datasets
- Apply statistical methods to derive insights
- Create visualizations using ggplot2 and base R plotting functions
- Understand how R fits into the data analytics workflow

## Requirements

To run the scripts, ensure you have:
- R (≥ 4.0.0) installed
- Recommended IDE: RStudio
- Required packages:
  - tidyverse
  - ggplot2
  - dplyr
  - readr
  - stats

Install packages with:

install.packages(c("tidyverse", "ggplot2", "dplyr", "readr"))

## Example Workflow

# Load libraries
library(tidyverse)

# Import dataset
data <- read_csv("sample.csv")

# Clean and transform
clean_data <- data %>%
  filter(!is.na(column)) %>%
  mutate(new_var = log(column))

# Visualize
ggplot(clean_data, aes(x = new_var, y = another_var)) +
  geom_point() +
  theme_minimal()

## Outputs

The repository includes multiple PNG files generated from exercises. These plots illustrate:
- Histograms and bar charts
- Scatter plots with regression lines
- Boxplots for distribution analysis
- Multi-faceted visualizations using ggplot2

