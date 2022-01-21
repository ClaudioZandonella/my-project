#############################
####    Analysis Plan    ####
#############################

#----    settings    ----

library(targets)

# Load packages

# List all scripts in R/
script_list <- list.files("R", full.names = TRUE)

# Source scripts
invisible(sapply(script_list, source))

# Options
options(tidyverse.quiet = TRUE)

#----    Plan    ----


list(
  # Get data
  tar_target(raw_data_file, "Data/raw-data.csv", format = "file"),
  tar_target(my_data, get_my_data(raw_data_file)),
  
  # Inferential statistics
  tar_target(lm_fit, get_lm_fit(data = my_data))
)

#----
