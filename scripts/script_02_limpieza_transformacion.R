# Script 02 - Limpieza y transformación de datos
# Curso: Introducción práctica a R para ciencias sociales (IIDyPCA)
# Día 2

library(tidyverse)
library(janitor)
library(lubridate)

datos_sucios <- read_csv2("datos/dataset_sucio.csv")
head(datos_sucios)
glimpse(datos_sucios)
names(datos_sucios)

datos_sucios <- clean_names(datos_sucios)
names(datos_sucios)

datos_limpios <- datos_sucios |>
  mutate(
    # edad
    edad_str = str_replace_all(edad, "años", ""),
    edad_str = str_trim(edad_str),
    edad_str = case_when(
      str_detect(edad_str, "treinta") ~ "30",
      edad_str == "" ~ NA_character_,
      TRUE ~ edad_str
    ),
    edad = as.numeric(edad_str),

    # sexo
    sexo = str_to_lower(sexo),
    sexo = str_trim(sexo),
    sexo = case_when(
      str_starts(sexo, "m") ~ "M",
      str_starts(sexo, "f") ~ "F",
      TRUE ~ NA_character_
    ),

    # ingreso
    ingreso_str = ingreso_mensual |>
      str_replace_all("\\.", "") |>
      str_replace_all(",", "") |>
      str_replace_all("pesos", "") |>
      str_replace_all("\\$", "") |>
      str_trim(),
    ingreso = as.numeric(ingreso_str),

    # fecha
    fecha_registro = parse_date_time(
      fecha_registro,
      orders = c("ymd", "dmy", "bdY", "dmy", "ymd")
    ),

    # educación
    educacion = str_to_lower(educacion_max),
    educacion = case_when(
      str_detect(educacion, "posgrad") ~ "Posgrado",
      str_detect(educacion, "univer") ~ "Universitario",
      str_detect(educacion, "sec") ~ "Secundario",
      educacion == "" ~ NA_character_,
      TRUE ~ "Otro"
    )
  ) |>
  select(id, sexo, edad, ingreso, fecha_registro, educacion) |>
  arrange(fecha_registro)

glimpse(datos_limpios)
write_csv(datos_limpios, "datos/datos_limpios_desde_sucio.csv")
