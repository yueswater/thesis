merge_dta_by_year <- function(base_dir, prefix) {
    # Load required packages
    require(haven)
    require(dplyr)
    require(purrr)
    require(stringr)
    require(fs)

    # List all .dta files
    dta_files <- dir_ls(base_dir, glob = "*.dta")

    # Check if any .dta files were found
    if (length(dta_files) == 0) {
        stop("No .dta files found in ", base_dir)
    }

    # Read and combine all .dta files
    map_dfr(dta_files, function(f) {
        message("Reading: ", f)
        # Extract year from file name
        year <- str_extract(path_file(f), "\\d{4}") |> as.integer()
        # Check if year extraction was successful
        if (is.na(year)) {
            stop("Cannot extract year from file name: ", f)
        }
        # Read .dta file and add metadata columns
        read_dta(f) |>
        mutate(
            year   = year,
            source = prefix,
            file   = path_file(f)
        )
    })
}
