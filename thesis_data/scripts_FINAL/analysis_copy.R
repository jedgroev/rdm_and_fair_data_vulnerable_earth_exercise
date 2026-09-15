setwd("C:/Users/alex/Desktop/thesis/data")

d = read.csv("data.csv")

# trying something
d$mean = (d$m1 + d$m2) / 2
plot(d$elev, d$mean)
