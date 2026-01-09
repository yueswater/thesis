# =====================================================================
# Project entry point
# This script runs the entire data pipeline in order
# =====================================================================

rm(list = ls())

message("========================================")
message(" Starting thesis data pipeline")
message("========================================")

PIPELINE_SCRIPTS <- c(
  "scripts/pipeline/01_merge_raw_data.R",
  "scripts/pipeline/02_variable_audit.R",
  "scripts/pipeline/03_clean_data.R",
  "scripts/pipeline/04_build_panel.R"
)

for (script in PIPELINE_SCRIPTS) {
  message("\n▶ Running: ", script)

  if (!file.exists(script)) {
    stop("Script not found: ", script)
  }

  source(script)

  message("✔ Completed: ", script)
}

message("\n========================================")
message(" All pipeline steps completed successfully")
message("========================================")
