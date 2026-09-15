# =============================================================================
# 01_data_cleaning.R
# Purpose : Load raw soil moisture data, remove outliers, handle missing values,
#           and export cleaned datasets to data/processed/
# Author  : Maria Santos (m.santos@uva.nl)
# Date    : 2025-08-01
# Input   : data/raw/soil_moisture_raw.csv
#           data/raw/site_coordinates.csv
# Output  : data/processed/soil_moisture_clean.csv
#           data/processed/site_monthly_summary.csv
# =============================================================================

library(tidyverse)
library(lubridate)

# --- 1. Load data -------------------------------------------------------------
raw <- read_csv("data/raw/soil_moisture_raw.csv")
sites <- read_csv("data/raw/site_coordinates.csv")

# --- 2. Average replicates per site per date ----------------------------------
daily <- raw %>%
  group_by(date, site_id, elevation_m) %>%
  summarise(
    moisture_mean_pct = mean(moisture_pct, na.rm = TRUE),
    moisture_sd_pct   = sd(moisture_pct, na.rm = TRUE),
    n_replicates      = sum(!is.na(moisture_pct)),
    .groups = "drop"
  )

# --- 3. Flag outliers (>3 SD from site mean) and sensor failures --------------
daily <- daily %>%
  group_by(site_id) %>%
  mutate(
    site_mean = mean(moisture_mean_pct, na.rm = TRUE),
    site_sd   = sd(moisture_mean_pct, na.rm = TRUE),
    flag = case_when(
      n_replicates == 0                                    ~ "SENSOR_FAIL",
      abs(moisture_mean_pct - site_mean) > 3 * site_sd    ~ "OUTLIER_REMOVED",
      TRUE                                                 ~ "OK"
    )
  ) %>%
  select(-site_mean, -site_sd)

# --- 4. Remove known sensor malfunction (Site 3, July 12-19) -----------------
daily <- daily %>%
  mutate(flag = if_else(
    site_id == "S3" & date >= "2024-07-12" & date <= "2024-07-19",
    "SENSOR_FAIL", flag
  ))

# --- 5. Export cleaned daily data --------------------------------------------
write_csv(daily, "data/processed/soil_moisture_clean.csv")
message("Exported: data/processed/soil_moisture_clean.csv")

# --- 6. Compute monthly summary (exclude flagged rows) -----------------------
monthly <- daily %>%
  filter(flag == "OK") %>%
  mutate(month = month(date) - 5) %>%   # June=1, July=2, August=3
  group_by(site_id, elevation_m, month) %>%
  summarise(
    moisture_mean_pct = round(mean(moisture_mean_pct), 1),
    moisture_sd_pct   = round(sd(moisture_mean_pct), 1),
    n_dates           = n(),
    .groups = "drop"
  )

write_csv(monthly, "data/processed/site_monthly_summary.csv")
message("Exported: data/processed/site_monthly_summary.csv")
