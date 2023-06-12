
############courbe de granulo classée ################

library(ggplot2)

# Importer les données de granulométrie classée
# Remplacer le nom et chemin "raw_data/wolman_2015_aval.csv" par votre nom de fichier et adressage

library(readr)
library(dplyr)

wolman_2015_aval <- read_csv("raw_data/wolman_2015_aval.csv")
View(wolman_2015_aval)

# Calculer les effectifs

effectifs <- table(wolman_2015_aval)
View(effectifs)
class(effectifs)

#transformer la table en data frame

dataframe_frequence <- as.data.frame(effectifs)
print(dataframe_frequence)

### Cumul des freq ######

wolman_cumul <- data.frame(Diam = dataframe_frequence$Diam, Freq=cumsum(dataframe_frequence$Freq))
print(wolman_cumul)

print(wolman_cumul)

write.csv(wolman_cumul,file = "raw_data/wolman_cumul.csv", row.names = FALSE)
# Tracer la courbe de granulométrie classée

ggplot(data=wolman_cumul, aes(x = Diam, y = Freq,group=1)) +
  geom_line() +
  labs(x ="Diametre", y = "Pourcentage cumulatif", title = "Courbe de granulométrie classée")

########   Calcul de médiane , D16,D50,D86

median(wolman_cumul$Y)

quantile(x = wolman_2015_aval$Diam, 
         probs = c(0.16, 0.5, 0.86))

