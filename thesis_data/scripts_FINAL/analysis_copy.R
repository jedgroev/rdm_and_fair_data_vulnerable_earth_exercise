setwd("C:/Users/alex/Desktop/thesis/data")

# trying with shannon instead
d = read.csv("diversity_green.csv")
plot(d$ndvi_50, d$shannon)
