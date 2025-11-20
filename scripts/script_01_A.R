# Script 01 - Introducción a R, RStudio e importación de datos
# Curso: Introducción práctica a R para ciencias sociales (IIDyPCA)
# Día 1

# -----------------------------------------------------------
# 0. Cargar paquetes
# -----------------------------------------------------------

# install.packages("tidyverse")
# install.packages("readxl")

library(tidyverse)
library(readxl)

# -----------------------------------------------------------
# 1. Working directory y proyectos
# -----------------------------------------------------------

getwd()

# -----------------------------------------------------------
# 2. Importar un archivo CSV
# -----------------------------------------------------------

datos_limpios <- read_csv("datos/dataset_limpio.csv")

head(datos_limpios)
glimpse(datos_limpios)
summary(datos_limpios)

# -----------------------------------------------------------
# 3. Seleccionar columnas y crear objetos
# -----------------------------------------------------------

datos_sub <- datos_limpios |>
  select(id, sexo, edad, ingreso)

edades <- datos_limpios$edad
mean(edades)

# -----------------------------------------------------------
# 4. Guardar un nuevo archivo
# -----------------------------------------------------------

write_csv(datos_sub, "datos/datos_sub.csv")
