assert_panel_keys <- function(df, keys) {
    # Load required package
    require(dplyr)
    # Check if all keys are present in the dataframe
    missing_keys <- setdiff(keys, names(df))
    # If any keys are missing, throw an error
    if (length(missing_keys) > 0) {
        stop("Missing key columns: ", paste(missing_keys, collapse = ", "))
    }
    # Check for duplicate combinations of keys
    dup <- df |>
        count(across(all_of(keys))) |>
        filter(n > 1)
    # If duplicates are found, throw an error
    if (nrow(dup) > 0) {
        stop(
            "Panel keys are not unique. ",
            nrow(dup),
            " duplicated combinations found."
        )
    }
    # If all checks pass, return TRUE invisibly
    invisible(TRUE)
}
