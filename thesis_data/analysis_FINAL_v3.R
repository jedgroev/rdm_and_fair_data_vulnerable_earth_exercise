setwd("C:/Users/alex/Desktop/thesis/data")

d = read.csv("data_FINAL.csv")
s = read.csv("sites.csv")

d2 = d[d$val != 999, ]
d2 = d2[!is.na(d2$val), ]

library(lme4)
m = lmer(val ~ elev + (1|site), data = d2)
summary(m)

library(ggplot2)
ggplot(d2, aes(x=elev, y=val)) + geom_point() + geom_smooth(method="lm")
ggsave("C:/Users/alex/Desktop/thesis/plot1.png")
