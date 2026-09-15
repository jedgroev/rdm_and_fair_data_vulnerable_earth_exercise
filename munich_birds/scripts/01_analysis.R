# =============================================================================
# 01_analysis.R
# Purpose : Explore the relationship between urban greenness (NDVI) and
#           bird species richness across 86 sites in Munich.
# Author  : Johannes De Groeve (j.degroeve@uva.nl)
# Date    : 2025-09-15
# Input   : data/diversity_green.csv
#           data/community_matrix.csv
# Output  : results/fig01_richness_vs_ndvi.png
#           results/fig02_map_richness.png
#           results/model_summary.txt
# =============================================================================

library(tidyverse)

# --- 1. Load data -------------------------------------------------------------
sites <- read_csv("data/diversity_green.csv")
community <- read_csv("data/community_matrix.csv")

# --- 2. Quick summary --------------------------------------------------------
cat("Number of sites    :", nrow(sites), "\n")
cat("Number of species  :", ncol(community) - 1, "\n")
cat("Richness range     :", min(sites$richness), "–", max(sites$richness), "\n")
cat("NDVI range (100m)  :", round(min(sites$ndvi_100), 2), "–",
                           round(max(sites$ndvi_100), 2), "\n")

# --- 3. Linear model: richness ~ NDVI (100 m buffer) -------------------------
model <- lm(richness ~ ndvi_100, data = sites)

sink("results/model_summary.txt")
cat("Linear model: richness ~ ndvi_100\n\n")
print(summary(model))
sink()
message("Exported: results/model_summary.txt")

# --- 4. Figure 1: richness vs NDVI -------------------------------------------
p1 <- ggplot(sites, aes(x = ndvi_100, y = richness)) +
  geom_point(alpha = 0.7, colour = "#2c7bb6") +
  geom_smooth(method = "lm", colour = "#d7191c", se = TRUE) +
  labs(
    x     = "NDVI (100 m buffer)",
    y     = "Bird species richness",
    title = "More green, more birds?",
    subtitle = "86 urban monitoring sites, Munich 2023"
  ) +
  theme_bw()

ggsave("results/fig01_richness_vs_ndvi.png", p1, width = 7, height = 5, dpi = 300)
message("Exported: results/fig01_richness_vs_ndvi.png")

# --- 5. Figure 2: map of richness per site -----------------------------------
p2 <- ggplot(sites, aes(x = lon, y = lat, colour = richness)) +
  geom_point(size = 3) +
  scale_colour_viridis_c(option = "plasma", name = "Species\nrichness") +
  labs(
    x        = "Longitude",
    y        = "Latitude",
    title    = "Bird species richness across Munich",
    subtitle = "86 passive acoustic monitoring sites, spring/summer 2023"
  ) +
  coord_equal() +
  theme_bw()

ggsave("results/fig02_map_richness.png", p2, width = 7, height = 6, dpi = 300)
message("Exported: results/fig02_map_richness.png")
