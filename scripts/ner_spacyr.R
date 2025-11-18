# Detección de entidades geográficas con spaCy

library(tidyverse)
library(spacyr)

spacy_initialize(model = "es_core_news_lg")

noticias <- read_csv("datos/noticias_politica_geocodificadas.csv", show_col_types = FALSE)

parsed <- spacy_parse(noticias$cuerpo, entity = TRUE)

ubicaciones <- parsed |>
  filter(entity_type %in% c("LOC", "GPE")) |>
  group_by(doc_id) |>
  summarise(ubicaciones_ner = str_c(unique(entity), collapse = ", "), .groups = "drop")

noticias_final <- noticias |>
  mutate(doc_id = as.character(row_number())) |>
  left_join(ubicaciones, by = c("doc_id" = "doc_id")) |>
  select(-doc_id)

write_csv(noticias_final, "datos/noticias_politica_geocodificadas.csv")
