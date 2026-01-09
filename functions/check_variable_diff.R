check_variable_diff <- function(df, year_var = "year") {
    # Load required packages
    require(dplyr)
    require(tidyr)
    require(purrr)

    # Ensure year_var exists in the data frame
    if (!year_var %in% names(df)) {
        stop("year variable not found: ", year_var)
    }
    # Reshape and summarize variable presence across years
    df |>
        select(all_of(year_var), everything()) |>
        pivot_longer(
            cols = -all_of(year_var),
            names_to = "variable",
            values_to = "value"
        ) |>
        group_by(variable) |>
        summarise(
            n_years    = n_distinct(.data[[year_var]]),
            years      = list(sort(unique(.data[[year_var]]))),
            .groups    = "drop"
        ) |>
        arrange(n_years)
}
