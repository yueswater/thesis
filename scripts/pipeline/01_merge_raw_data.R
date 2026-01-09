# Clear workspace
rm(list = ls())

# Load libraries
library(tidyverse)
library(haven)
library(fs)

# Load functions
source("functions/merge_dta_by_year.R")

# Define paths
DATA_RAW <- "data/raw"
DATA_INTERIM <- "data/interim"

# Create interim data directory
dir_create(DATA_INTERIM)

# Merge RI data by year
RI_all <- merge_dta_by_year(
    base_dir=file.path(DATA_RAW, "RI_data"),
    prefix="RI"
)
saveRDS(RI_all, file.path(DATA_INTERIM, "RI_all.rds"))

# Merge RR data by year
RR_all <- merge_dta_by_year(
    base_dir=file.path(DATA_RAW, "RR_data"),
    prefix="RR"
)
saveRDS(RR_all, file.path(DATA_INTERIM, "RR_all.rds"))

# Finish script
message("Data merging complete. Merged datasets saved to ", DATA_INTERIM)