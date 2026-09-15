PROJECT: Soil moisture monitoring along an elevation gradient in the Pyrenees
=========================================================================

Author:      Johannes De Groeve
Institution: University of Amsterdam, IBED
Contact:     j.degroeve@uva.nl
Date:        August 2025
License:     CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/)

---

DESCRIPTION
-----------
This repository contains the data, scripts, and results associated with a
field study measuring soil moisture at five elevation sites (500–2500 m a.s.l.)
in the Spanish Pyrenees during the summer of 2024. The goal of the study was
to assess how soil moisture varies with elevation and vegetation type.

---

FOLDER STRUCTURE
----------------
data/
  raw/         - Original, unmodified field measurements (CSV)
  processed/   - Cleaned and derived datasets used in analyses (CSV)
scripts/       - R scripts used to process and analyse the data
results/       - Figures and summary statistics produced by the scripts

---

DATA COLLECTION
---------------
Soil moisture was measured using a Delta-T SM150T sensor (±2% accuracy).
Measurements were taken every 3 days at each site between June 1 and
August 31, 2024. Three replicate measurements were taken per site per visit.
GPS coordinates of each site are recorded in the site metadata file.

---

NOTES & LIMITATIONS
-------------------
- Site 3 (1500 m) has missing data for the period July 12–19 due to
  sensor malfunction. These rows are marked with NA in the processed data.
- Raw data have not been quality-filtered. All filtering steps are
  documented in scripts/01_data_cleaning.R.
- Results are preliminary and have not been peer-reviewed.

---

HOW TO REPRODUCE THE RESULTS
-----------------------------
1. Open R (version >= 4.3)
2. Install required packages: tidyverse, ggplot2, lubridate
3. Run scripts in order:
   - 01_data_cleaning.R
   - 02_analysis.R
   - 03_figures.R
All outputs will be saved to the results/ folder.
