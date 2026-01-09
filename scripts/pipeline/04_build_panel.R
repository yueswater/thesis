# Clear workspace
rm(list = ls())

# Load libraries
lirary(tidyverse)

# Load functions
source('functions/assert_panel_keys.R')

# Define paths
DATA_PROCESSED <- "data/processed"

RI_data <- read_csv(file.path(DATA_PROCESSED, "RI_clean.csv"))
RR_data <- read_csv(file.path(DATA_PROCESSED, "RR_clean.csv"))

# Assume panel keys
assert_panel_keys(RI_data, c("id", "year"))
assert_panel_keys(RR_data, c("id", "year"))

# Save panel datasets
saveRDS(RI_data, file.path(DATA_PROCESSED, "RI_panel.rds"))
saveRDS(RR_data, file.path(DATA_PROCESSED, "RR_panel.rds"))

# Finish script
message("Panel datasets built and saved to ", DATA_PROCESSED)
