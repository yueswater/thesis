# Load libraries
library(dplyr)
library(jsonlite)

# Function to read location mapping from JSON file
get_location_map <- function(json_path = "data/location_map.json") {
    # Check if file exists
    if (!file.exists(json_path)) {
        stop(paste("錯誤：找不到 Mapping 檔案:", json_path))
    }
    # Read and process JSON data
    map_data <- fromJSON(json_path, flatten = TRUE)
    # Convert to tibble
    map_data <- as_tibble(map_data) %>%
        mutate(code = as.character(code))
    return(map_data)
}

# Function to assign sector based on industry code
assign_sector <- function(ind_code) {
    # Convert to numeric
    code <- as.numeric(ind_code)
    # Determine sector
    if (is.na(code) || code < 0) return(NA_character_)
    # Sector classification logic
    if (code >= 1 && code <= 5) return("Ag")
    if (code >= 8 && code <= 39) return("Manufacturing")
    return("Services")
}