# ============================================================================
# Limpieza y normalización de datos de comentarios de hotel
# Requiere: tidyverse (dplyr, stringr, purrr, readr, etc.)
# ============================================================================

# Cargamos el "meta-paquete" tidyverse, que incluye dplyr, ggplot2,
# tidyr, readr, purrr, stringr, etc.
library(tidyverse)

# 1) Cargar datos crudos -----------------------------------------------------

# Leemos un archivo .rds que contiene un objeto de R ya guardado.
# En este caso, esperamos que sea un data frame / tibble con comentarios de hotel.
comentarios <- readRDS("datos/comentarios.rds")

# glimpse() muestra una vista rápida de la estructura del data frame:
# nombres de columnas, tipo de datos y algunas filas de ejemplo.
glimpse(comentarios)


# 2) Funciones auxiliares ----------------------------------------------------
# Estas funciones nos ayudan a encapsular tareas repetitivas de limpieza,
# para no escribir el mismo código muchas veces.

# Convierte un string tipo "Escrito en 20 de noviembre de 2025" a un objeto Date.
parse_fecha_com <- function(x) {
  x |>
    # str_remove() elimina el texto inicial "Escrito en " si está presente.
    stringr::str_remove("^Escrito en\\s+") |>
    # parse_date() interpreta el string como una fecha, usando un formato
    # donde el patrón es: día "de" mes "de" año, con nombres de meses en español.
    readr::parse_date(
      format = "%d de %B de %Y",
      locale = readr::locale("es")  # le indicamos que los meses están en castellano.
    )
}

# Convierte puntajes tipo "8,0" a número 8.0 (numeric).
parse_puntaje <- function(x) {
  x |>
    # str_replace() reemplaza la coma por un punto, para que R lo entienda como número.
    stringr::str_replace(",", ".") |>
    # as.numeric() convierte el texto en número.
    as.numeric()
}

# Extrae el número inicial de strings tipo "67 comentarios", "5 votos".
# Queremos quedarnos solo con el 67, 5, etc. como entero.
extract_numero_inicial <- function(x) {
  x |>
    # str_extract() busca un patrón en el texto.
    # "\\d+" significa "una o más cifras (dígitos)".
    stringr::str_extract("\\d+") |>
    # as.integer() convierte el texto en un entero.
    as.integer()
}

# Limpia comillas “ ” " " y espacios extra de textos cortos.
limpiar_texto_corto <- function(x) {
  x |>
    # str_replace_all() reemplaza TODAS las comillas “ ” y " " por nada (las elimina).
    stringr::str_replace_all("[“”\"]", "") |>
    # str_squish() elimina espacios al inicio y al final, y colapsa espacios múltiples a uno solo.
    stringr::str_squish()
}


# 3) Limpieza y normalización -----------------------------------------------
# Usamos el operador |> (pipe nativo de R) para encadenar operaciones
# sobre el data frame "comentarios".

comentarios_limpios <- comentarios |>
  # mutate() crea nuevas columnas o modifica columnas existentes.
  mutate(
    # --- Fechas -------------------------------------------------------------
    # Creamos una nueva columna "fecha_com_date" aplicando nuestra función
    # parse_fecha_com() a la columna de texto "fecha_com".
    fecha_com_date = parse_fecha_com(fecha_com),

    # --- Puntaje ------------------------------------------------------------
    # Creamos una nueva columna numérica "puntaje_num" a partir de "puntaje".
    puntaje_num = parse_puntaje(puntaje),

    # --- Valoración general (texto corto) -----------------------------------
    # Limpiamos comillas y espacios de la columna "valo_gral",
    # y guardamos el resultado en "valo_gral_limpia".
    valo_gral_limpia = limpiar_texto_corto(valo_gral),

    # --- Comentarios positivos/negativos -----------------------------------
    # str_squish() para asegurarnos de que no haya espacios extra.
    comen_pos_limpia = stringr::str_squish(comen_pos),
    comen_neg_limpia = stringr::str_squish(comen_neg),

    # --- Autoría y país -----------------------------------------------------
    # Limpiamos espacios de los nombres de autor y país.
    autoria_limpia = stringr::str_squish(autoria),
    pais_limpio    = stringr::str_squish(pais),

    # --- Cantidad de comentarios y votos (números) -------------------------
    # Extraemos el número de las columnas de texto "n_coment" y "n_votos".
    n_coment_num = extract_numero_inicial(n_coment),
    n_votos_num  = extract_numero_inicial(n_votos),

    # --- Indicador de “sin comentario” -------------------------------------
    # Creamos una columna lógica (TRUE/FALSE) "sin_comentario".
    # Consideramos que hay "sin comentario" cuando la columna no_coment NO es NA.
    # (es decir, !is.na(no_coment) es TRUE).
    # En estos casos suele decir "Esta entrada..." y no hay texto libre del usuario.
    sin_comentario = !is.na(no_coment),

    # --- Tratamiento detallado de metadata ---------------------------------
    # La columna "metadata" suele tener algo como:
    # "• Viaje de ocio\n• Pareja\n• Habitación ...\n• Estancia de 4 noches"
    # La idea es:
    # 1) Separar cada ítem en un vector (split por salto de línea).
    # 2) Quitar el símbolo "•" y espacios.
    # 3) A partir de esa lista de ítems, extraer distintos datos
    #    (motivo de viaje, tipo de viajero, tipo de habitación y noches).

    # Primero: separamos la cadena en un vector de ítems usando el salto de línea (\n).
    metadata_items = stringr::str_split(metadata, "\\n") |>
      # purrr::map() aplica una función a cada elemento de la lista.
      purrr::map(~ .x |>
        # str_remove_all() saca el "•" al principio de cada ítem y espacios después.
        stringr::str_remove_all("^•\\s*") |>
        # str_squish() limpia espacios al inicio, final y múltiples espacios internos.
        stringr::str_squish()
      ),

    # 1) Motivo del viaje (p.ej. "Viaje de ocio", "Viaje por trabajo")
    # Recorremos metadata_items (lista de vectores de texto) y, para cada vector .x:
    viaje_motivo = purrr::map_chr(
      metadata_items,
      ~ .x |>
        # str_extract("^Viaje.*") se queda con el ítem que empieza con "Viaje".
        stringr::str_extract("^Viaje.*") |>
        # discard(is.na) elimina los elementos NA resultantes (si no matcheó nada).
        purrr::discard(is.na) |>
        # first() toma el primer elemento del vector (si hay más de uno).
        dplyr::first() |>
        # coalesce() reemplaza NA por NA_character_ (aseguramos que el resultado sea texto).
        dplyr::coalesce(NA_character_)
    ),

    # 2) Tipo de viajero (p.ej. "Pareja", "Familia", "Grupo", etc.)
    viaje_tipo = purrr::map_chr(
      metadata_items,
      ~ .x |>
        # str_extract() busca ítems que sean exactamente uno de esos tipos de viajero.
        stringr::str_extract("^(Pareja|Familia|Grupo|Viajero solo|Amigos)") |>
        purrr::discard(is.na) |>
        dplyr::first() |>
        dplyr::coalesce(NA_character_)
    ),

    # 3) Tipo de habitación (p.ej. "Habitación Clásica con 2 camas individuales")
    habitacion_tipo = purrr::map_chr(
      metadata_items,
      ~ .x |>
        # Buscamos ítems que empiecen con "Habitación".
        stringr::str_extract("^Habitación.*") |>
        purrr::discard(is.na) |>
        dplyr::first() |>
        dplyr::coalesce(NA_character_)
    ),

    # 4) Duración de la estancia: extrae el número de noches
    # Ejemplo de ítem: "Estancia de 4 noches".
    noches_estadia = purrr::map_chr(
      metadata_items,
      ~ .x |>
        # str_extract() busca el texto que contenga "Estancia de X noches".
        stringr::str_extract("Estancia de \\d+ noches?") |>
        purrr::discard(is.na) |>
        dplyr::first() |>
        dplyr::coalesce(NA_character_)
    ) |>
      # De ese texto, extraemos solo el número (\\d+).
      stringr::str_extract("\\d+") |>
      # Convertimos ese número de texto a entero.
      as.integer()
  ) |>
  # 4) Seleccionar y renombrar columnas “finales” ---------------------------
  # transmute() crea un nuevo data frame con SOLO las columnas indicadas
  # y, además, permite renombrarlas en el mismo paso.
  transmute(
    # Renombramos fecha_com_date -> fecha_com (y la dejamos como Date).
    fecha_com   = fecha_com_date,
    # Renombramos puntaje_num -> puntaje.
    puntaje     = puntaje_num,
    # Renombramos valo_gral_limpia -> valor_general.
    valor_general = valo_gral_limpia,

    # Incluimos la columna lógica sin_comentario.
    sin_comentario,
    # Renombramos comen_pos_limpia / comen_neg_limpia.
    comentario_positivo = comen_pos_limpia,
    comentario_negativo = comen_neg_limpia,

    # Renombramos autoria_limpia / pais_limpio.
    autor = autoria_limpia,
    pais  = pais_limpio,

    # Cantidades de comentarios y votos como números.
    n_comentarios = n_coment_num,
    n_votos       = n_votos_num,

    # Mantengo fecha_est tal cual vino, puede contener info útil de la estadía.
    fecha_est,

    # Campos estructurados derivados de metadata.
    viaje_motivo,
    viaje_tipo,
    habitacion_tipo,
    noches_estadia,

    # Por las dudas, conservamos la metadata original sin tocar.
    metadata_raw = metadata
  )

# 5) Chequeo rápido ----------------------------------------------------------

# Volvemos a mirar la estructura del nuevo data frame ya limpio.
glimpse(comentarios_limpios)

# Contamos cuántos registros hay por cada tipo de "viaje_motivo",
# ordenando de mayor a menor frecuencia.
comentarios_limpios |>
  count(viaje_motivo, sort = TRUE)

# Resumen estadístico de la columna numérica "puntaje".
summary(comentarios_limpios$puntaje)


# 6) Guardar resultados ------------------------------------------------------

# Guardamos el data frame limpio en un nuevo archivo .rds,
# para usarlo más adelante sin tener que rehacer toda la limpieza.
saveRDS(comentarios_limpios, "datos/comentarios_limpios.rds")
