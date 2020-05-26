dsSet2 <- read.csv("dataset2.csv")

library("ggpubr")
ggline(dsSet2, x = "menu", y = "time", add = c("mean_sd", "jitter"),
       order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
       ylab = "Time", xlab = "Menu Type")
ggline(dsSet2, x = "menu", y = "error", add = c("mean_sd", "jitter"),
       order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
       ylab = "Error", xlab = "Menu Type")

ggboxplot(dsSet2, x = "menu", y = "time", color = "menu",
          palette = c("#00AFBB", "#E7B800", "#FC4E07", "#00FF00"),
          order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
          ylab = "Time", xlab = "Menu Type")
ggboxplot(dsSet2, x = "menu", y = "error", color = "menu",
          palette = c("#00AFBB", "#E7B800", "#FC4E07", "#00FF00"),
          order = c("toolglass", "flowmenu", "toolpalette", "controlmenu"),
          ylab = "Error", xlab = "Menu Type")

dsSet2$user <- factor(dsSet2$user)
resultManova <- manova(cbind(time, error) ~ menu + Error(user/menu), data = dsSet2)
summary(resultManova)

pairwise.t.test(dsSet2$time, dsSet2$menu, p.adjust.method = "bonferroni", paired = TRUE)
pairwise.t.test(dsSet2$error, dsSet2$menu, p.adjust.method = "bonferroni", paired = TRUE)
