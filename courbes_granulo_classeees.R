usethis::use_github()

############courbe de granulo classée ################

library(ggplot2)

# Importer les données de granulométrie classée
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

#########cumul des freq#########

wolman_cumul <- data.frame(X = dataframe_frequence$Diam, Y=cumsum(dataframe_frequence$Freq))
print(wolman_cumul)

print(wolman_cumul)
# Tracer la courbe de granulométrie classée

ggplot(data=wolman_cumul, aes(x = factors(Diam), y = Freq)) +
  geom_line() +
  labs(x ="Diametre", y = "Pourcentage cumulatif", title = "Courbe de granulométrie classée")

usethis::use_github()

