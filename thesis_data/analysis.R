setwd("C:/Users/alex/Desktop/thesis")
library(tidyverse)
library(lubridate)
library(lme4)

raw <- read_csv("data_FINAL.csv")
sites <- read_csv("sites.csv")

daily <- raw %>%
  group_by(Date, loc, elev) %>%
  summarise(moisture_mean_pct = mean(val, na.rm = TRUE), moisture_sd_pct = sd(val, na.rm = TRUE), n_replicates = sum(!is.na(val)), .groups = "drop")

daily <- daily %>%
  group_by(loc) %>%
  mutate(site_mean = mean(moisture_mean_pct, na.rm = TRUE), site_sd = sd(moisture_mean_pct, na.rm = TRUE), flag = case_when(n_replicates == 0 ~ "SENSOR_FAIL", abs(moisture_mean_pct - site_mean) > 3 * site_sd ~ "OUTLIER_REMOVED", TRUE ~ "OK")) %>%
  select(-site_mean, -site_sd)

daily <- daily %>%
  mutate(flag = if_else(loc == "S3" & Date >= "2024-07-12" & Date <= "2024-07-19", "SENSOR_FAIL", flag))

monthly <- daily %>%
  filter(flag == "OK") %>%
  mutate(month = month(Date) - 5) %>%
  group_by(loc, elev, month) %>%
  summarise(moisture_mean_pct = round(mean(moisture_mean_pct), 1), moisture_sd_pct = round(sd(moisture_mean_pct), 1), n_dates = n(), .groups = "drop")

model <- lmer(moisture_mean_pct ~ elev + (1 | loc), data = daily %>% filter(flag == "OK"))
sink("plot1.png")
print(summary(model))
sink()

p1 <- ggplot(monthly, aes(x = elev, y = moisture_mean_pct, colour = factor(month), group = factor(month))) +
  geom_line() + geom_point(size = 2) +
  geom_errorbar(aes(ymin = moisture_mean_pct - moisture_sd_pct, ymax = moisture_mean_pct + moisture_sd_pct), width = 40) +
  scale_colour_manual(values = c("1" = "#2166ac", "2" = "#fdae61", "3" = "#d73027"), labels = c("June", "July", "August")) +
  labs(x = "Elevation (m a.s.l.)", y = "Soil moisture (%)", colour = "Month", title = "Soil moisture decreases with elevation", caption = "Error bars = ±1 SD") + theme_bw()
ggsave("C:/Users/alex/Desktop/thesis/plot1.png", p1, width = 7, height = 5, dpi = 300)
