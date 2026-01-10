# Load libraries
library(dplyr)
library(tidyr)
library(readr)
library(progress)

# Read the initial merged dataset
message("Reading panel_complete.rds...")
panel_data <- readRDS("data/processed/panel_complete.rds")

# Define time-invariant variables to be imputed
static_vars <- c(
    "birth_place", 
    "birth_county", 
    "birth_year", 
    "sex", 
    "edu_level",       
    "spouse_birth_place"
)

# Ensure only existing variables are selected
static_vars <- intersect(static_vars, names(panel_data))

message("Starting panel imputation (this may take a moment)...")

# Prepare data chunks for progress tracking
all_ids <- unique(panel_data$id)
n_ids <- length(all_ids)

# Split IDs into chunks (max 100 chunks)
n_chunks <- min(n_ids, 100)
chunk_indices <- split(all_ids, cut(seq_along(all_ids), n_chunks, labels = FALSE))

# Initialize progress bar
pb <- progress_bar$new(
  format = "  imputing [:bar] :percent",
  total = length(chunk_indices),
  clear = FALSE,
  width = 60
)

# Execute batch imputation
imputed_chunks <- lapply(chunk_indices, function(ids_chunk) {
    pb$tick()

    # Filter data for current chunk
    panel_data %>%
    filter(id %in% ids_chunk) %>%
    group_by(id) %>%
    # Fill missing values: first fill down, then fill up
    fill(all_of(static_vars), .direction = "downup") %>%
    ungroup()
})

# Combine all chunks back into a single dataframe
panel_imputed <- bind_rows(imputed_chunks)

# Display imputation statistics for verification
if("birth_place" %in% names(panel_data)) {
    # Calculate missing rates before and after imputation
    before_na <- mean(is.na(panel_data$birth_place))
    after_na <- mean(is.na(panel_imputed$birth_place))

    # Print missing rate statistics
    message(sprintf("Missing rate (birth_place) before: %.2f%%", before_na * 100))
    message(sprintf("Missing rate (birth_place) after:  %.2f%%", after_na * 100))
}

# Save final datasets
saveRDS(panel_imputed, "data/processed/panel_complete.rds")
write_csv(panel_imputed, "data/processed/panel_complete.csv")

message("Imputation complete. Files saved to data/processed/")