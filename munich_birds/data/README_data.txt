================================================================================
README
================================================================================

Dataset Title: Acoustic bird diversity and community composition in relation to 
               urban greenness in Munich, Germany

Version: 1.0

Date of data collection: 2023-04-03 to 2023-08-06

Geographic location: Munich, Bavaria, Germany
                     Approximate bounding box: 48.08°N to 48.22°N, 11.39°E to 11.69°E

--------------------------------------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------

This dataset contains acoustic bird monitoring data collected from 86 sites 
across Munich, Germany, during spring and summer 2023. The data were used to 
investigate the relationship between urban greenness (measured as NDVI and 
vegetation volume) and bird diversity and community composition.

Bird detections were obtained using passive acoustic monitoring with Frontier 
Labs Bioacoustic Recorders (BAR and BAR_LT) deployed for one week at each site, 
recording continuously 24 hours per day at 48 kHz with a gain of 40. Recorders 
were mounted at approximately 4 m height on streetlamps. Recordings were 
analysed using BirdNET-Analyzer (v2.4) with recording week and location 
parameters, default sensitivity of 1.0, default overlap of 0 s, and a minimum 
confidence threshold of 0.8. Singleton detections were removed and species 
detected ten times or fewer were manually validated.

Sites were selected using stratified random sampling across two orthogonal 
gradients: NDVI values (5 bins from 0 to 0.71) and distance from city centre 
(5 rings of 3 km each, from 0-15 km from Marienplatz). A minimum distance of 
300 m between sites was maintained to ensure independence.

--------------------------------------------------------------------------------
FILE LIST
--------------------------------------------------------------------------------

1. diversity_green.csv
   Site-level data containing bird diversity metrics, recording effort, 
   geographic coordinates, and environmental variables (NDVI and vegetation 
   volume at multiple spatial scales).
   
   Number of records: 87 (1 header row + 86 sites)
   Number of variables: 28

2. community_matrix.csv
   Presence-absence matrix of bird species detected across monitoring sites.
   Rows represent sites and columns represent bird species (scientific names).
   
   Number of records: 87 (1 header row + 86 sites)
   Number of species: 86

3. README.txt
   This file.

--------------------------------------------------------------------------------
VARIABLE DESCRIPTIONS: diversity_green.csv
--------------------------------------------------------------------------------

site                      Site identifier (format: GR_[number])
week                      Week of the year when recording took place (14, 27, 29, or 31)
hours_recorded            Total hours of audio recorded at the site
richness                  Species richness (total number of bird species detected)
var                       Vocal Activity Rate - sum of species-specific VAR values
                          (VAR = number of 15-minute periods with detection / days recorded)
shannon                   Shannon diversity index calculated using VAR as abundance proxy
vegetation_volume_25      Mean vegetation volume (m³/m²) within 25 m buffer
vegetation_volume_50      Mean vegetation volume (m³/m²) within 50 m buffer
vegetation_volume_100     Mean vegetation volume (m³/m²) within 100 m buffer
vegetation_volume_200     Mean vegetation volume (m³/m²) within 200 m buffer
vegetation_volume_400     Mean vegetation volume (m³/m²) within 400 m buffer
vegetation_volume_800     Mean vegetation volume (m³/m²) within 800 m buffer
log_vegetation_volume_25  Natural log of vegetation_volume_25
log_vegetation_volume_50  Natural log of vegetation_volume_50
log_vegetation_volume_100 Natural log of vegetation_volume_100
log_vegetation_volume_200 Natural log of vegetation_volume_200
log_vegetation_volume_400 Natural log of vegetation_volume_400
log_vegetation_volume_800 Natural log of vegetation_volume_800
ndvi_25                   Mean NDVI within 25 m buffer (range: -1 to 1)
ndvi_50                   Mean NDVI within 50 m buffer
ndvi_100                  Mean NDVI within 100 m buffer
ndvi_200                  Mean NDVI within 200 m buffer
ndvi_400                  Mean NDVI within 400 m buffer
ndvi_800                  Mean NDVI within 800 m buffer
lat                       Latitude of site (decimal degrees, WGS84)
lon                       Longitude of site (decimal degrees, WGS84)
Distance_HC               Distance from city centre (Marienplatz) in metres
Distance_HC_km            Distance from city centre (Marienplatz) in kilometres

Notes on environmental variables:
- NDVI derived from WorldView-3 satellite imagery (30 cm resolution) acquired 04.07.2019
- Vegetation volume derived from normalised digital surface model (50 cm resolution) 
  and land cover classification based on WorldView-3 imagery and OpenStreetMap data
- Buffer sizes (25, 50, 100, 200, 400, 800 m) represent radii around each site

--------------------------------------------------------------------------------
VARIABLE DESCRIPTIONS: community_matrix.csv
--------------------------------------------------------------------------------

Column 1 (unnamed): Site identifier (format: GR_[number])

Columns 2-87: Bird species presence (1) or absence (0)
              Column headers are scientific names of species

Species list (86 species):
Accipiter nisus, Actitis hypoleucos, Aegithalos caudatus, Alauda arvensis, 
Alcedo atthis, Anas crecca, Anas platyrhynchos, Anser anser, Anthus trivialis, 
Apus apus, Ardea cinerea, Branta canadensis, Buteo buteo, Carduelis carduelis, 
Certhia brachydactyla, Certhia familiaris, Charadrius dubius, Chloris chloris, 
Ciconia ciconia, Coccothraustes coccothraustes, Columba livia, Columba oenas, 
Columba palumbus, Corvus corax, Corvus cornix, Corvus corone, Corvus frugilegus, 
Corvus monedula, Curruca curruca, Cyanistes caeruleus, Delichon urbicum, 
Dendrocopos major, Dendrocoptes medius, Dryobates minor, Dryocopus martius, 
Emberiza citrinella, Erithacus rubecula, Falco tinnunculus, Ficedula hypoleuca, 
Fringilla coelebs, Fulica atra, Gallinula chloropus, Garrulus glandarius, 
Hirundo rustica, Larus michahellis, Lophophanes cristatus, Motacilla alba, 
Motacilla cinerea, Motacilla flava, Muscicapa striata, Nycticorax nycticorax, 
Oriolus oriolus, Parus major, Passer domesticus, Passer montanus, Periparus ater, 
Phasianus colchicus, Phoenicurus ochruros, Phoenicurus phoenicurus, 
Phylloscopus collybita, Pica pica, Picus viridis, Poecile palustris, 
Prunella modularis, Pyrrhula pyrrhula, Rallus aquaticus, Regulus ignicapilla, 
Regulus regulus, Serinus serinus, Sitta europaea, Spinus spinus, 
Streptopelia decaocto, Strix aluco, Sturnus vulgaris, Sylvia atricapilla, 
Sylvia borin, Tachybaptus ruficollis, Tringa nebularia, Tringa ochropus, 
Troglodytes troglodytes, Turdus merula, Turdus philomelos, Turdus pilaris, 
Turdus viscivorus, Upupa epops, Vanellus vanellus

--------------------------------------------------------------------------------
METHODS SUMMARY
--------------------------------------------------------------------------------

Site Selection:
- 86 sites selected via stratified random sampling across NDVI and distance 
  gradients
- Minimum 300 m spacing between sites
- Sampling points located on streetlamps closest to selected raster cell centres

Data Collection:
- Equipment: Frontier Labs Bioacoustic Recorder (BAR) or BAR Long-Term (BAR_LT)
- Recording period: One week per site (weeks 14, 27, 29, 31 of 2023)
- Recording schedule: Continuous, 24 hours/day
- Sample rate: 48 kHz
- Gain: 40
- Mounting height: Approximately 4 m

Data Processing:
- Software: BirdNET-Analyzer v2.4
- Parameters: Sensitivity 1.0, overlap 0 s, minimum confidence 0.8
- Post-processing: Singleton removal, manual validation of rare detections
- Approximately 13,399 hours of recordings analysed
- Approximately 337,000 bird detections obtained

Remote Sensing Data:
- Optical imagery: WorldView-3 (30 cm resolution), acquired 04.07.2019
- NDVI calculated from red and near-infrared bands
- Vegetation volume derived from normalised digital surface model (50 cm) and 
  land cover classification

--------------------------------------------------------------------------------
RELATED PUBLICATION
--------------------------------------------------------------------------------

Fairbairn, A.J., Katholnigg, S., Leichtle, T., Merkens, L., Schroll, L., 
Weisser, W.W. & Meyer, S.T. (2025) NDVI and vegetation volume as predictors 
of urban bird diversity. Scientific Reports 15, 12863. 
https://doi.org/10.1038/s41598-025-96098-0

--------------------------------------------------------------------------------
FUNDING
--------------------------------------------------------------------------------

- German Research Foundation (DFG) Research Training Group 2679 
  "Urban Green Infrastructure"
- TUM International Graduate School of Science and Engineering

--------------------------------------------------------------------------------
LICENSE
--------------------------------------------------------------------------------

This dataset is licensed under the Creative Commons Attribution 4.0 
International License (CC-BY 4.0).

You are free to:
- Share: copy and redistribute the material in any medium or format
- Adapt: remix, transform, and build upon the material for any purpose

Under the following terms:
- Attribution: You must give appropriate credit, provide a link to the license, 
  and indicate if changes were made.

Full license text: https://creativecommons.org/licenses/by/4.0/

--------------------------------------------------------------------------------
CITATION
--------------------------------------------------------------------------------

If you use this dataset, please cite both the dataset and the associated 
publication:

Dataset:
Fairbairn, A.J., Katholnigg, S., Leichtle, T., Merkens, L., Schroll, L., 
Weisser, W.W. & Meyer, S.T. (2025) Acoustic bird diversity and community 
composition in relation to urban greenness in Munich, Germany [Dataset]. 
Zenodo. https://doi.org/[DOI]

Publication:
Fairbairn, A.J., Katholnigg, S., Leichtle, T., Merkens, L., Schroll, L., 
Weisser, W.W. & Meyer, S.T. (2025) NDVI and vegetation volume as predictors 
of urban bird diversity. Scientific Reports 15, 12863. 
https://doi.org/10.1038/s41598-025-96098-0

--------------------------------------------------------------------------------
CONTACT
--------------------------------------------------------------------------------

Andrew J. Fairbairn
Technical University of Munich
School of Life Sciences, Chair for Terrestrial Ecology
Hans-Carl-von-Carlowitz-Platz 2, D-85354 Freising, Germany
Email: andrew.fairbairn@tum.de
ORCID: 0000-0002-2826-3465

Wolfgang W. Weisser
Technical University of Munich
School of Life Sciences, Chair for Terrestrial Ecology
Hans-Carl-von-Carlowitz-Platz 2, D-85354 Freising, Germany
Email: wolfgang.weisser@tum.de
ORCID: 0000-0002-2757-8959

Sebastian T. Meyer
Technical University of Munich
School of Life Sciences, Chair for Terrestrial Ecology
Hans-Carl-von-Carlowitz-Platz 2, D-85354 Freising, Germany
Email: sebastian.t.meyer@tum.de
ORCID: 0000-0003-0833-1472

================================================================================
END OF README
================================================================================
