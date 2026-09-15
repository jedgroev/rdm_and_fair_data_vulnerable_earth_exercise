setwd("C:/Users/alex/Desktop/thesis/data")

# trying something
d = read.csv("data.csv")
d$mean = (d$m1 + d$m2) / 2
plot(d$elev, d$mean)
