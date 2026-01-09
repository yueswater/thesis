# Clear workspace
rm(list = ls())

# Load libraries
library(tidyverse)
library(fs)

# Load functions
source('functions/check_variable_diff.R', chdir = TRUE)

# Define paths
DATA_INTERIM <- "data/interim"
OUTPUT_DIR <- file.path(DATA_INTERIM, "logs")
dir_create(OUTPUT_DIR)

# Load merged datasets
RI_all <- readRDS(file.path(DATA_INTERIM, "RI_all.rds"))
RR_all <- readRDS(file.path(DATA_INTERIM, "RR_all.rds"))

# Audit variable differences
audit_RI <- check_variable_diff(RI_all, file.path(OUTPUT_DIR, "RI_variable_audit.csv"))
audit_RR <- check_variable_diff(RR_all, file.path(OUTPUT_DIR, "RR_variable_audit.csv"))

# Finish script
message("Variable audit complete. Audit logs saved to ", OUTPUT_DIR)