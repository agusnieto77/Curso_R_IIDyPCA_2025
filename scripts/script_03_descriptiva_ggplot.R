# Script 03 - Estadística descriptiva y visualización con ggplot2
# Curso: Introducción práctica a R para ciencias sociales (IIDyPCA)
# Día 3

library(tidyverse)

datos <- read_csv("datos/dataset_limpio.csv")
glimpse(datos)

# Descriptiva
summary(select(datos, edad, ingreso))
datos |> count(sexo)
datos |> count(educacion)

datos |>
  group_by(sexo) |>
  summarise(
    n = n(),
    ingreso_prom = mean(ingreso),
    edad_prom = mean(edad)
  )

# Histogramas, barras, boxplots
ggplot(datos, aes(x = edad)) +
  geom_histogram(bins = 10) +
  labs(title = "Distribución de edad") +
  theme_minimal()

ggplot(datos, aes(x = educacion)) +
  geom_bar() +
  labs(title = "Nivel educativo") +
  theme_minimal()

ggplot(datos, aes(x = sexo, y = ingreso)) +
  geom_boxplot() +
  labs(title = "Ingreso mensual por sexo") +
  theme_minimal()

ggsave("figuras/hist_edad.png", width = 6, height = 4)
ggsave("figuras/bar_educacion.png", width = 6, height = 4)
ggsave("figuras/box_ingreso_sexo.png", width = 6, height = 4)
