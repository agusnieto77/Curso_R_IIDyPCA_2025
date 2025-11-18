# Geocodificación con tidygeocoder 

library(tidyverse)
library(tidygeocoder)

noticias <- read_csv("datos/noticias_politica_limpias.csv", show_col_types = FALSE)

detecciones <- noticias |>
  mutate(ubicacion_detectada = if_else(is.na(ubicacion_detectada), "Buenos Aires", ubicacion_detectada)) |>
  distinct(id_nota, ubicacion_detectada)

coordenadas <- detecciones |>
  geocode(
    address = ubicacion_detectada,
    method = "osm",
    lat = lat,
    long = lon
  )

noticias_final <- noticias |>
  left_join(coordenadas, by = c("id_nota", "ubicacion_detectada"))

write_csv(noticias_final, "datos/noticias_politica_geocodificadas.csv")
