if (!require(readr)) install.packages("readr"); require(readr)

tab <- as.data.frame(read_csv("data2.csv"))

# Kadangi read_csv grazina ne matrix tipo kintamaji, negalime naudoti 'filter' f-jos
# todel turime panaudoti tokia pati funkcija, tik skirta data.frame kintamiems 'subset'
df <- subset(tab, 
             Apskritys == "Lietuvos Respublika" &
               Lytis == "Vyrai ir moterys" &
               `Gyvenamoji vietovė` == "Miestas ir kaimas"
)

margins.default = par("mar")
par(mar = c(7, 8, 7, 3))

png(
  filename = "diagrama2.png",
  units = "px",
  width = 1980,
  height = 1080,
  res = 300
)

bp <- barplot(
  df$Reikšmė, 
  names.arg = df$Laikotarpis, 
  las = 0,
  ylim = c(0, 1200),
  space = 1,
  col = c("#1a3663", "#254d8e", "#2e5fad", "#346ac1", "#3d79db"),
  border = NA,
  xlab = "Metai",
  ylab = "Kiekis"
)
title(main = "Neaktyvūs gyventojai", font.main = 4)
text(bp, (df$Reikšmė) * 1.08, labels = df$Reikšmė)

dev.off()