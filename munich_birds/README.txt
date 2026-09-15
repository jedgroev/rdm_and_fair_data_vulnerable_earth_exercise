PROJECT: Urban bird diversity and greenness in Munich, Germany
==============================================================

Author      : Johannes De Groeve (j.degroeve@uva.nl)
              University of Amsterdam, IBED
Date        : 2025-09-15
License     : CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/)

---

DATA SOURCE
-----------
This repository uses a publicly available dataset published on Zenodo:

  Fairbairn, A.J., Katholnigg, S., Leichtle, T., Merkens, L., Schroll, L.,
  Weisser, W.W. & Meyer, S.T. (2025) Acoustic bird diversity and community
  composition in relation to urban greenness in Munich, Germany [Dataset].
  Zenodo. https://doi.org/10.5281/zenodo.17991471

The original data files (diversity_green.csv, community_matrix.csv, and
README_data.txt) are reproduced here unmodified under the CC BY 4.0 license.
Please cite the original authors when using or referring to this data.

Related publication:
  Fairbairn et al. (2025) NDVI and vegetation volume as predictors of urban
  bird diversity. Scientific Reports 15, 12863.
  https://doi.org/10.1038/s41598-025-96098-0

---

DESCRIPTION
-----------
This repository contains an analysis of urban bird diversity in relation to
urban greenness across 86 sites in Munich, Germany (spring/summer 2023).
Passive acoustic recorders were deployed for one week per site. Bird species
were identified using BirdNET-Analyzer. Greenness was measured as NDVI and
vegetation volume at multiple spatial scales (25–800 m buffers).

---

FOLDER STRUCTURE
----------------
data/
  diversity_green.csv   - Site-level data: coordinates, diversity metrics,
                          NDVI and vegetation volume per buffer size (86 sites)
  community_matrix.csv  - Presence/absence matrix: 86 sites × 86 bird species
  README_data.txt       - Full metadata for both data files (from Zenodo)
scripts/
  01_analysis.R         - R script: model and figures relating richness to NDVI
results/
  fig01_richness_vs_ndvi.png  - Scatter plot: richness vs NDVI (100 m buffer)
  fig02_map_richness.png      - Map of species richness across Munich sites
  model_summary.txt           - Linear model output

---

HOW TO REPRODUCE THE RESULTS
-----------------------------
1. Open R (version >= 4.3)
2. Install required packages:
     install.packages(c("tidyverse"))
3. Set your working directory to this folder (the project root)
4. Run: source("scripts/01_analysis.R")

All outputs will be saved to the results/ folder.
