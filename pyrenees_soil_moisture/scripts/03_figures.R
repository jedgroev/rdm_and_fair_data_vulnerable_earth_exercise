# =============================================================================
# 03_figures.R
# Purpose : Produce figures for the results folder.
# Author  : Johannes De Groeve (j.degroeve@uva.nl)
# Date    : 2025-08-06
# Input   : data/processed/site_monthly_summary.csv
# Output  : results/fig01_moisture_by_elevation.png
#           results/fig02_moisture_over_time.png
# =============================================================================

library(tidyverse)

monthly <- read_csv("data/processed/site_monthly_summary.csv")

# Figure 1: Mean moisture vs elevation per month
p1 <- ggplot(monthly, aes(x = elevation_m, y = moisture_mean_pct,
                           colour = factor(month), group = factor(month))) +
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin = moisture_mean_pct - moisture_sd_pct,
                    ymax = moisture_mean_pct + moisture_sd_pct), width = 40) +
  scale_colour_manual(values = c("1" = "#2166ac", "2" = "#fdae61", "3" = "#d73027"),
                      labels = c("June", "July", "August")) +
  labs(x = "Elevation (m a.s.l.)", y = "Soil moisture (%)",
       colour = "Month",
       title = "Soil moisture decreases with elevation",
       caption = "Error bars = ±1 SD") +
  theme_bw()

ggsave("results/fig01_moisture_by_elevation.png", p1, width = 7, height = 5, dpi = 300)
message("Exported: results/fig01_moisture_by_elevation.png")

