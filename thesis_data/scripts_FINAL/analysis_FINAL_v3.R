setwd("C:/Users/alex/Desktop/thesis/data")

d = read.csv("diversity_green.csv")

# plot
plot(d$ndvi_100, d$richness)

m = lm(richness ~ ndvi_100, data=d)
summary(m)

# this worked
library(ggplot2)
ggplot(d, aes(ndvi_100, richness)) + geom_point() + geom_smooth(method="lm")
ggsave("C:/Users/alex/Desktop/thesis/results_v2/plot.png")
