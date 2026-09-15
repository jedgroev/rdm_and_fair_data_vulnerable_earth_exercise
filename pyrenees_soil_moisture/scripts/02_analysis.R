# =============================================================================
# 02_analysis.R
# Purpose : Test whether soil moisture decreases significantly with elevation
#           using a linear mixed-effects model (site as random effect).
# Author  : Maria Santos (m.santos@uva.nl)
# Date    : 2025-08-05
# Input   : data/processed/soil_moisture_clean.csv
# Output  : results/model_summary.txt
# =============================================================================

library(tidyverse)
library(lme4)

clean <- read_csv("data/processed/soil_moisture_clean.csv") %>%
  filter(flag == "OK")

# Linear model: moisture ~ elevation
model <- lmer(moisture_mean_pct ~ elevation_m + (1 | site_id), data = clean)

# Save summary
sink("results/model_summary.txt")
cat("Linear mixed-effects model: moisture ~ elevation_m + (1|site_id)\n\n")
print(summary(model))
sink()
message("Exported: results/model_summary.txt")
