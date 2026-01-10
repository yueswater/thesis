# Load libraries
library(readr)
library(tidyr)
library(dplyr)
library(progress)

# Source functions
source("scripts/functions/process_year_data.R")
source("scripts/functions/code_mappings.R") 

# Read variable mapping
map_wide <- read_csv("data/variable_map.csv", show_col_types = FALSE)
# Convert to long format
map_long <- map_wide %>%
    pivot_longer(
        cols = -target_var,
        names_to = "source_col",
        values_to = "original_var"
    )
    # Load location mapping
    location_map <- get_location_map("data/location_map.json")
    # List all raw data files
    ri_files <- list.files("data/raw/RI_data", pattern = "\\.dta$", full.names = TRUE)
    rr_files <- list.files("data/raw/RR_data", pattern = "\\.dta$", full.names = TRUE)
    all_files <- c(ri_files, rr_files)
    # Set up progress bar
    pb <- progress_bar$new(
    format = "  processing [:bar] :percent",
    total = length(all_files),
    clear = FALSE,
    show_after = 0,
    width = 60
)

# Process each file and save cleaned data
invisible(lapply(all_files, function(f) {
    # Process each file
    pb$tick()
    # Call the processing function
    suppressMessages(process_year_data(
        file_path = f,
        map_long = map_long,
        location_map = location_map, 
        output_dir = "data/interim"
    ))
}))

message("Merging all year data...")

# Read all cleaned files and merge into full panel
clean_files <- list.files("data/interim", pattern = "\\.rds$", full.names = TRUE)

# Combine all cleaned data
full_panel <- clean_files %>%
    lapply(readRDS) %>%
    bind_rows() %>%
    arrange(id, source_year)

# Save final merged panel data
saveRDS(full_panel, "data/processed/panel_complete.rds")
write_csv(full_panel, "data/processed/panel_complete.csv")

# Final message
message("Complete! Files saved to data/processed/")