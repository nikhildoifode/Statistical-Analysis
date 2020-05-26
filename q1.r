dsSet1 <- read.csv("dataset1.csv")

library("ggpubr")
ggline(dsSet1, x = "menu", y = "time", add = c("mean_sd", "jitter"),
       order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
       ylab = "Time", xlab = "Menu Type")

ggboxplot(dsSet1, x = "menu", y = "time", color = "menu",
          palette = c("#00AFBB", "#E7B800", "#FC4E07", "#00FF00"),
          order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
          ylab = "Time", xlab = "Menu Type")

resultAnova <- aov(time ~ menu, data = dsSet1)
summary(resultAnova)

hist(resultAnova$residuals, xlab = "Standardised Residuals", main = "Histogram of Standardised Residuals")

pairwise.t.test(dsSet1$time, dsSet1$menu, p.adjust.method = "bonferroni")
