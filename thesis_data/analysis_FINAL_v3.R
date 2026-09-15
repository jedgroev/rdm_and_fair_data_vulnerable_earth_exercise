setwd("C:/Users/alex/Desktop/thesis/data")

d = read.csv("data_FINAL.csv")
s = read.csv("sites.csv")

d$mean = (d$m1 + d$m2 + d$m3) / 3
d2 = d[d$mean != 999, ]
d2 = d2[!is.na(d2$mean), ]

library(lme4)
m = lmer(mean ~ elev + (1|site), data = d2)
summary(m)

library(ggplot2)
ggplot(d2, aes(x=elev, y=mean)) + geom_point() + geom_smooth(method="lm")
ggsave("C:/Users/alex/Desktop/thesis/plot1.png")
