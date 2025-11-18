# Script 02A - Limpieza paso a paso
# Pensado para usar en vivo y mostrar cada transformación

library(tidyverse)
library(janitor)
library(lubridate)

raw <- read_csv("datos/dataset_sucio.csv")
print(raw)

datos <- clean_names(raw)
glimpse(datos)

# ---- Edad ----
datos <- datos |>
  mutate(edad_sin_texto = str_remove_all(edad, "años")) |>
  mutate(edad_limpia = str_trim(edad_sin_texto)) |>
  mutate(edad_limpia = case_when(
    str_detect(edad_limpia, "treinta") ~ "30",
    edad_limpia == "" ~ NA_character_,
    TRUE ~ edad_limpia
  )) |>
  mutate(edad_num = as.numeric(edad_limpia))

View(select(datos, edad, edad_num))

# ---- Sexo ----
datos <- datos |>
  mutate(sexo_lower = str_to_lower(sexo)) |>
  mutate(sexo_lower = str_trim(sexo_lower)) |>
  mutate(sexo_limpio = case_when(
    str_starts(sexo_lower, "m") ~ "M",
    str_starts(sexo_lower, "f") ~ "F",
    TRUE ~ NA_character_
  ))

View(select(datos, sexo, sexo_limpio))

# ---- Ingreso ----
datos <- datos |>
  mutate(ingreso_sin_puntos = str_replace_all(ingreso_mensual, "\\.", "")) |>
  mutate(ingreso_sin_comas = str_replace_all(ingreso_sin_puntos, ",", "")) |>
  mutate(ingreso_sin_pesos = str_replace_all(ingreso_sin_comas, "pesos", "")) |>
  mutate(ingreso_sin_simbolo = str_replace_all(ingreso_sin_pesos, "\\$", "")) |>
  mutate(ingreso_final = str_trim(ingreso_sin_simbolo)) |>
  mutate(ingreso_num = as.numeric(ingreso_final))

View(select(datos, ingreso_mensual, ingreso_num))

# ---- Fecha ----
datos <- datos |>
  mutate(fecha_limpia = parse_date_time(
    fecha_registro,
    orders = c("ymd", "dmy", "bdY", "ymd")
  ))

View(select(datos, fecha_registro, fecha_limpia))

# ---- Educación ----
datos <- datos |>
  mutate(educacion_lower = str_to_lower(educacion_max)) |>
  mutate(educacion_limpia = case_when(
    str_detect(educacion_lower, "posgrad") ~ "Posgrado",
    str_detect(educacion_lower, "univer") ~ "Universitario",
    str_detect(educacion_lower, "sec") ~ "Secundario",
    educacion_lower == "" ~ NA_character_,
    TRUE ~ "Otro"
  ))

View(select(datos, educacion_max, educacion_limpia))

# ---- Resultado final ----
resultado <- datos |>
  transmute(
    id,
    sexo = sexo_limpio,
    edad = edad_num,
    ingreso = ingreso_num,
    fecha_registro = fecha_limpia,
    educacion = educacion_limpia
  ) |>
  arrange(fecha_registro)

glimpse(resultado)
write_csv(resultado, "datos/datos_limpios_desde_sucio_paso_a_paso.csv")
