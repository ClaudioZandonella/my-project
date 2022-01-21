########################
####    Analysis    ####
########################

#----    Analysis    ----

targets::tar_config_set(script = "Analysis/Targets-workflow.R",
                        store = "Analysis/_targets")

# Check plan
targets::tar_manifest(fields = "command")
targets::tar_visnetwork()

# Run analysis
targets::tar_make()

# Ends
targets::tar_visnetwork()

#----    Results    ----

targets::tar_load(my_data)
targets::tar_read(plot_obs)
targets::tar_read(my_data)
targets::tar_load(lm_fit)

summary(lm_fit)

#----
