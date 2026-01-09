# Clear workspace
rm(list = ls())

# Load libraries
library(tidyverse)
library(fs)

# Define paths
DATA_INTERIM <- "data/interim"
DATA_PROCESSED <- "data/processed"
dir_create(DATA_PROCESSED)

# Load merged datasets
RI_all <- readRDS(file.path(DATA_INTERIM, "RI_all.rds"))
RR_all <- readRDS(file.path(DATA_INTERIM, "RR_all.rds"))

# Data cleaning logic
RI_clean <- RI_all |>
    rename_with(tolower)
RR_clean <- RR_all |>
    rename_with(tolower)

# Save cleaned datasets
write_csv(RI_clean, file.path(DATA_PROCESSED, "RI_clean.csv"))
write_csv(RR_clean, file.path(DATA_PROCESSED, "RR_clean.csv"))

# Finish script
message("Data cleaning complete. Cleaned datasets saved to ", DATA_PROCESSED)