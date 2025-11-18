# Pipeline La Nación - scraping + limpieza + exportación
# Usa rvest, tidyverse y backends de base de datos para generar
# diferentes salidas a partir de la portada de política.

library(rvest)
library(dplyr)
library(purrr)
library(stringr)
library(lubridate)
library(openxlsx)
library(DBI)
library(RSQLite)
library(duckdb)

BASE_URL <- "https://www.lanacion.com.ar/politica/"

get_safe <- function(node, selector) {
  html_element(node, selector) |>
    html_text2() |>
    purrr::pluck(1, .default = NA_character_)
}

get_attr_safe <- function(node, selector, attr) {
  html_element(node, selector) |>
    html_attr(attr) |>
    purrr::pluck(1, .default = NA_character_)
}

leer_nota <- function(url) {
  message("Leyendo nota: ", url)
  tryCatch(
    {
      pagina <- read_html(url)
      cuerpo <- pagina |>
        html_elements("article p") |>
        html_text2() |>
        str_c(collapse = "\n")
      list(url = url, cuerpo = cuerpo)
    },
    error = function(e) list(url = url, cuerpo = NA_character_)
  )
}

scrape_portada_politica <- function() {
  portada <- read_html(BASE_URL)
  tarjetas <- html_elements(portada, "article")

  tibble(
    titulo = map_chr(tarjetas, get_safe, selector = "h2 a"),
    copete = map_chr(tarjetas, get_safe, selector = "p"),
    url = map_chr(tarjetas, get_attr_safe, selector = "h2 a", attr = "href"),
    autor = map_chr(tarjetas, get_safe, selector = ".com-author"),
    fecha = map_chr(tarjetas, get_safe, selector = "time")
  ) |>
    mutate(url = if_else(str_detect(url, "^http"), url, str_c("https://www.lanacion.com.ar", url)))
}

limpiar_noticias <- function(df) {
  notas <- df |>
    mutate(
      fecha = parse_date_time(fecha, orders = c("ymd HM", "dmy HM", "dmy")),
      categoria = case_when(
        str_detect(str_to_lower(titulo), "econom") ~ "Economia",
        str_detect(str_to_lower(titulo), "docent|educ") ~ "Educacion",
        str_detect(str_to_lower(titulo), "protest|conflicto|reclamo") ~ "Conflicto",
        TRUE ~ "Politica"
      )
    )

  cuerpos <- map_dfr(notas$url, leer_nota)

  notas |>
    left_join(cuerpos, by = c("url" = "url")) |>
    mutate(
      id_nota = row_number(),
      provincia = case_when(
        str_detect(cuerpo, "Buenos Aires|CABA") ~ "Buenos Aires",
        str_detect(cuerpo, "Córdoba") ~ "Córdoba",
        str_detect(cuerpo, "Santa Fe|Rosario") ~ "Santa Fe",
        TRUE ~ "Desconocido"
      ),
      ubicacion_detectada = provincia
    )
}

exportar_excel <- function(df, path) {
  message("Escribiendo ", path)
  openxlsx::write.xlsx(df, file = path, overwrite = TRUE)
}

guardar_sqlite <- function(df, path = "datos/noticias_politica.sqlite") {
  message("Guardando en SQLite")
  con <- dbConnect(SQLite(), path)
  on.exit(dbDisconnect(con))
  dbWriteTable(con, "noticias", df, overwrite = TRUE)
}

guardar_duckdb <- function(df, path = "datos/noticias_politica.duckdb") {
  message("Guardando en DuckDB")
  con <- dbConnect(duckdb::duckdb(), path)
  on.exit(dbDisconnect(con, shutdown = TRUE))
  dbWriteTable(con, "noticias", df, overwrite = TRUE)
}

raw <- scrape_portada_politica()
clean <- limpiar_noticias(raw)

exportar_excel(clean, "datos/noticias_politica_limpias.xlsx")
guardar_sqlite(clean)
guardar_duckdb(clean)

readr::write_csv(clean, "datos/noticias_politica_limpias.csv")
