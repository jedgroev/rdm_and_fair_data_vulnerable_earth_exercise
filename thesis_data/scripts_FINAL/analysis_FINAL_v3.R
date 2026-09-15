setwd("C:/Users/alex/Desktop/thesis/data")
d <- read.csv("data_FINAL.csv")
d2 <- d[d$val1 > 15, ]
mean(d2$val1)
# this worked eventually
plot(d2$x, d2$val1)
