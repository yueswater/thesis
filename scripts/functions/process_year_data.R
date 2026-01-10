# Load libraries
library(haven)
library(dplyr)
library(tidyr)
library(readr)
library(stringr)

# Function to process year data file
process_year_data <- function(file_path, map_long, location_map, output_dir) {
    # Extract file name without extension
    fname <- tools::file_path_sans_ext(basename(file_path))
    # Identify the relevant mapping
    current_map <- map_long %>%
        filter(source_col == fname) %>%
        filter(!is.na(original_var) & original_var != "")
    # If no mapping found, skip processing
    if (nrow(current_map) == 0) {
        return(NULL)
    }
    # Read raw data
    raw_data <- read_dta(file_path)
    # Create selection expression
    select_expr <- setNames(current_map$original_var, current_map$target_var)
    # Select existing variables only
    existing_vars <- select_expr[select_expr %in% names(raw_data)]
    # Clean and transform data
    clean_data <- raw_data %>%
        select(all_of(existing_vars))
    # Ensure essential columns exist
    cols_to_ensure <- c("birth_place", "work_place", "industry", "id")
    # Add missing columns with NA
    for(col in cols_to_ensure) {
        if(!col %in% names(clean_data)) {
        
        clean_data[[col]] <- NA
        }
    }
    # Add metadata and perform mappings
    clean_data <- clean_data %>%
        # Add source year and type metadata
        mutate(
            source_year = as.integer(str_extract(fname, "\\d{4}")),
            source_type = str_extract(fname, "[A-Za-z]+"),
            id = as.character(id),
            birth_place_str = sprintf("%03d", as.numeric(birth_place)),
            work_place_str = sprintf("%03d", as.numeric(work_place))
        ) %>%
        # Map birth and work place codes to county names
        left_join(location_map, by = c("birth_place_str" = "code")) %>%
        rename(birth_county = county_name) %>%
        # Map work place codes to county names and assign sector
        left_join(location_map, by = c("work_place_str" = "code")) %>%
        rename(work_county = county_name) %>%
        # Assign sector based on industry code
        mutate(
            sector = sapply(industry, assign_sector)
        ) %>%
        # Final selection of columns
        select(-birth_place_str, -work_place_str)

    # Save cleaned data
    out_path <- file.path(output_dir, paste0(fname, "_clean.rds"))
    saveRDS(clean_data, out_path)
}