# load packages
pacman::p_load(tidyverse,
               explore)

# load data
scores <- read_csv("data/quick9.csv")

scores %>%
  explore()
