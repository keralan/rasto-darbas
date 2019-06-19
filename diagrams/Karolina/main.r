if (!require(readxl)) install.packages("readxl"); require(readxl)
if (!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)


tab = as.data.frame(read_excel("data.xlsx", 1))

margins.default = par("mar")
par(mar = c(7, 8, 7, 3))

png(
  filename = "diagrama1.png",
  units = "px",
  width = 1980,
  height = 1080,
  res = 300
)

bp <- barplot(
  tab$Emigrantai, 
  names.arg = tab$...1,
  las = 0,
  ylim = c(0, 60000),
  space = 1,
  col = c("#1a3663", "#254d8e", "#2e5fad", "#346ac1", "#3d79db"),
  border = NA,
  xlab = "Metai",
  ylab = "Emigrantu skaicius",
  xpd = TRUE
)
title(main = "Emigrantai", font.main = 4)
text(bp, (tab$`Emigrantai | asmenys`) * 1.08, labels = tab$`Emigrantai | asmenys`)

dev.off()
