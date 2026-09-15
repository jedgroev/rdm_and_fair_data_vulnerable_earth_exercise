setwd("C:/Users/alex/Desktop/thesis/data")
d <- read.csv("data.csv")
# trying something
d$mean <- (d$val1 + d$val2) / 2
plot(d$x, d$mean)
