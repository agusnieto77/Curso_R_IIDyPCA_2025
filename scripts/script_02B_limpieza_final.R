# Script 02B - Limpieza final compacta

library(tidyverse)
library(janitor)
library(lubridate)

datos_limpios <- read_csv("datos/dataset_sucio.csv") |>
  clean_names() |>
  mutate(
    edad_str = str_replace_all(edad, "años", ""),
    edad_str = str_trim(edad_str),
    edad_str = case_when(
      str_detect(edad_str, "treinta") ~ "30",
      edad_str == "" ~ NA_character_,
      TRUE ~ edad_str
    ),
    edad = as.numeric(edad_str),

    sexo = str_to_lower(sexo),
    sexo = str_trim(sexo),
    sexo = case_when(
      str_starts(sexo, "m") ~ "M",
      str_starts(sexo, "f") ~ "F",
      TRUE ~ NA_character_
    ),

    ingreso_str = ingreso_mensual |>
      str_replace_all("\\.", "") |>
      str_replace_all(",", "") |>
      str_replace_all("pesos", "") |>
      str_replace_all("\\$", "") |>
      str_trim(),
    ingreso = as.numeric(ingreso_str),

    fecha_registro = parse_date_time(
      fecha_registro,
      orders = c("ymd", "dmy", "bdY", "dmy", "ymd")
    ),

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
write_csv(datos_limpios, "datos/datos_limpios_desde_sucio_final.csv")
