# ============================================================================
# Ejemplos de análisis de texto, geocodificación y uso de modelos de lenguaje
# con el paquete ACEP, mapas interactivos y Ollama (local y cloud).
#
# Este script está pensado como material de curso:
#  - Primero: detección de palabras clave en textos.
#  - Segundo: extracción de entidades y mapeo en leaflet.
#  - Tercero: geocodificación con tidygeocoder.
#  - Cuarto: uso de modelos de lenguaje vía ACEP + Ollama.
#  - Quinto: ejemplo de OCR con un modelo multimodal (Qwen) desde R.
# ============================================================================

# (Opcional) Instalación de paquetes necesarios ------------------------------
# Estas líneas se corren solo una vez, en la consola, no en cada script.

# install.packages("devtools")
# devtools::install_github("agusnieto77/ACEP")  # instala la versión de desarrollo de ACEP
# install.packages("leaflet")
# install.packages("tidygeocoder")
# install.packages("httr2")
# install.packages("jsonlite")
# install.packages("base64enc")

# Carga de librerías ---------------------------------------------------------

library(ACEP)          # Funciones específicas del proyecto ACEP (NLP, tagging, LLM, etc.)
library(httr2)         # Para hacer requests HTTP de forma cómoda desde R.
library(leaflet)       # Para crear mapas interactivos (usa OpenStreetMap como base).
library(jsonlite)      # Para trabajar con JSON (parsear, convertir listas, etc.).
library(base64enc)     # Para codificar binarios (como imágenes) en base64.
library(tidygeocoder)  # Para geocodificar (convertir direcciones a coordenadas).
library(stringr)       # Para manipulación de textos (str_replace, str_extract, etc.)

# ============================================================================
# 1) Ejemplo simple: detección de palabras clave en textos
# ============================================================================

# Creamos un data.frame con una columna de texto "texto".
df <- data.frame(
  texto = c(
    "El SUTEBA fue al paro. Reclaman mejoras salariales.",
    "El SOIP lleva adelante un plan de lucha con paros y piquetes."
  )
)

# Definimos un "diccionario" de palabras clave que queremos detectar.
diccionario <- c("paro", "lucha", "piquetes")

# Usamos acep_count() para contar cuántas veces aparecen las palabras
# del diccionario en cada texto.
df$detect <- acep_count(df$texto, diccionario)

# Vemos el resultado: ahora df tiene una columna extra "detect".
df


# ============================================================================
# 2) Etiquetado gramatical y extracción de entidades + mapa con leaflet
# ============================================================================

# Definimos un vector de textos de ejemplo.
textos <- c(
  "En Mar del Plata el SOIP declara la huelga en demanda de aumento salarial.",
  "La manifestacion se realizo en Buenos Aires el 15 de marzo.",
  "El presidente visito Tierra del Fuego para inaugurar la nueva planta."
)

# Ejecutamos acep_postag() para hacer etiquetado gramatical (POS tagging)
# y, opcionalmente, extracción de entidades nombradas.
# - texto: vector de textos de entrada.
# - bajar_core = FALSE indica que no vuelva a bajar el modelo si ya está instalado.
resultado <- acep_postag(texto = textos, bajar_core = FALSE)

# Vemos las primeras filas de la tabla con texto etiquetado palabra por palabra.
head(resultado$texto_tag)

# Vemos las primeras filas de la tabla que contiene solo entidades de tipo "location"
# con sus coordenadas (latitud/longitud), si ACEP logró geocodificarlas.
head(resultado$texto_only_entity_loc)

# Guardamos esta tabla en un objeto df para usarlo en el mapa.
df <- resultado$texto_only_entity_loc

# Creamos un mapa interactivo con leaflet usando como base OpenStreetMap.
leaflet(df) |>
  # addTiles() agrega el mapa base de OSM.
  addTiles() |>
  # addCircleMarkers() agrega marcadores circulares para cada fila de df.
  addCircleMarkers(
    lng = ~long,  # columna "long" se usa como longitud (eje x).
    lat = ~lat,   # columna "lat" se usa como latitud (eje y).
    # popup define el contenido que muestra al hacer clic en cada marcador.
    popup = ~paste0(
      "<b>Entidad:</b> ", entity, "<br>",
      "<b>Tipo:</b> ", entity_type, "<br>",
      "<b>doc_id:</b> ", doc_id, "<br>"
    ),
    radius = 3,      # tamaño del círculo en píxeles.
    stroke = FALSE,  # sin borde.
    fillOpacity = 0.5  # transparencia del relleno (0 = transparente, 1 = opaco).
  )


# ============================================================================
# 3) Geocodificación con tidygeocoder (postalcode, city, etc.)
# ============================================================================

# Ejemplo 1: geocodificar un código postal.
# geo() intenta encontrar coordenadas (lat/long) a partir de información de ubicación.
datos_cp <- geo(postalcode = "B7600")

# Creamos un mapa centrado en el resultado de la geocodificación.
leaflet(datos_cp) |>
  addTiles() |>
  # setView() centra el mapa en una lat/long determinada y con cierto zoom.
  # Usamos la primera fila del resultado (datos_cp$long[1], datos_cp$lat[1]).
  setView(lng = datos_cp$long[1], lat = datos_cp$lat[1], zoom = 17) |>
  addCircleMarkers(
    lng = ~long,
    lat = ~lat,
    popup = ~paste0(
      "<b>Info:</b> ", postalcode, "<br>"
    ),
    radius = 3,
    stroke = FALSE,
    fillOpacity = 0.5
  )

# Ejemplo 2: geocodificar varias ciudades a la vez.
datos_geo <- geo(
  city    = c("Balcarce", "Mar del Plata", "Miramar"),
  state   = rep("Buenos Aires", 3),
  country = rep("Argentina", 3)
)

# Creamos un mapa con las tres ciudades.
datos_geo |>
  leaflet() |>
  addTiles() |>
  # Centramos el mapa en la segunda ciudad (Mar del Plata, índice 2).
  setView(lng = datos_geo$long[2], lat = datos_geo$lat[2], zoom = 8) |>
  addCircleMarkers(
    lng = ~long,
    lat = ~lat,
    popup = ~paste0(
      "<b>Ciudad:</b> ", city, "<br>"
    ),
    radius = 6,
    stroke = FALSE,
    fillOpacity = 0.5
  )


# ============================================================================
# 4) Uso de ACEP + Ollama para modelos de lenguaje (texto)
# ============================================================================

# NOTA: Para esta sección necesitás:
#  - Tener Ollama instalado en tu máquina.
#  - Haber descargado al menos un modelo, por ejemplo: llama3.1
# En la terminal (no en R) se haría algo como:
#   ollama pull llama3.1

# 4.1) Ejemplo: extracción de entidades con acep_ollama() --------------------

# Definimos un texto de ejemplo.
texto <- "El SUTEBA convoco a un paro en Buenos Aires el 15 de marzo."

# Definimos instrucciones para el modelo (lo que sería el "prompt").
instrucciones <- "Extrae todas las entidades nombradas del texto."

# Definimos un esquema de salida usando acep_gpt_schema().
# En este caso "extraccion_entidades" es un esquema predefinido en ACEP.
schema <- acep_gpt_schema("extraccion_entidades")

# Llamamos a acep_ollama() para enviar el texto y las instrucciones al modelo local.
resultado <- acep_ollama(texto, instrucciones, schema = schema)

# Imprimimos el resultado (debería contener entidades estructuradas según el schema).
print(resultado)

# 4.2) Ejemplo: análisis de sentimiento -------------------------------------

texto <- "La protesta fue pacifica y bien organizada."

# Obtenemos un esquema de salida específico para "sentimiento".
schema <- acep_gpt_schema("sentimiento")

# Pasamos el texto y unas instrucciones simples, junto con el schema.
resultado <- acep_ollama(
  texto,
  "Analiza el sentimiento del texto",
  schema = schema
)

# Imprimimos solo el campo "sentimiento_general" del resultado.
print(resultado$sentimiento_general)


# ============================================================================
# 5) Uso de Ollama Cloud API (modelos remotos, sin GPU local)
# ============================================================================

# Para usar Ollama en modo cloud:
# 1) Necesitás una API key de Ollama.
# 2) La configurás como variable de entorno OLLAMA_API_KEY.
#
# Ejemplo (NO poner tu clave real en el script, mejor en .Renviron):
# Sys.setenv(OLLAMA_API_KEY = "tu-api-key")

texto <- "El SUTEBA convoco a un paro en Buenos Aires el 15 de marzo."

# Llamamos a acep_ollama() indicando:
#  - modelo = "deepseek-v3.1:671b-cloud": modelo remoto de gran tamaño.
#  - host   = "https://ollama.com": endpoint de la API cloud de Ollama.
resultado_remoto <- acep_ollama(
  texto        = texto,
  instrucciones = "Extrae entidades",
  modelo       = "deepseek-v3.1:671b-cloud",  # Modelo cloud de 671B parámetros
  host         = "https://ollama.com",
  schema       = acep_gpt_schema("extraccion_entidades")
)

# Vemos el resultado remoto.
resultado_remoto


# ============================================================================
# 6) Ejemplo avanzado: OCR + extracción estructurada con un modelo multimodal
#    (Qwen 2.5 VL) vía Ollama desde R
# ============================================================================

# Supongamos que tenemos un recorte de un periódico antiguo (siglo XIX)
# guardado como imagen JPG en la carpeta ./img.
img_path <- "./img/1871_10_28_BUE_LP_U_00_001.jpg"

# Leemos el archivo de imagen en formato binario (raw).
img_bytes <- readBin(img_path, "raw", file.info(img_path)$size)

# Codificamos esos bytes en base64, que es el formato que espera la API.
img_b64 <- base64encode(img_bytes)

# Definimos el "prompt" con instrucciones al modelo:
#  - que haga OCR (transcriba el texto)
#  - que identifique fechas
#  - que identifique lugares
#  - que devuelva TODO en un JSON bien formado.
prompt <- paste(
  "Estás procesando un recorte de un periódico argentino del siglo XIX.",
  "1) Transcribí el texto completo de la nota respetando estrictamente los párrafos y los saltos de línea.",
  "2) Identificá todas las fechas mencionadas.",
  "3) Identificá lugares (ciudades, puertos, barrios, provincias, países).",
  "IMPORTANTE: devolvé EXCLUSIVAMENTE un JSON válido,",
  "sin explicaciones, sin ``` y sin indicar json u otro lenguaje.",
  "Solo el JSON, comenzando en '{' y terminando en '}'.",
  "La estructura debe ser:",
  '{',
  '  \"texto_completo\": \"…\",',
  '  \"fechas_mencionadas\": [\"…\"],',
  '  \"lugares_mencionados\": [\"…\"]',
  '}'
)

# Construimos el cuerpo (body) del request HTTP que vamos a enviar a Ollama.
# Usamos el endpoint /api/chat, que acepta:
#  - model: nombre del modelo.
#  - messages: lista de mensajes (como en la API de OpenAI).
#  - stream: FALSE para recibir la respuesta completa de una sola vez.
body <- list(
  model = "qwen2.5vl:latest",    # nombre del modelo multimodal en Ollama
  messages = list(
    list(
      role    = "user",          # rol del mensaje (usuario)
      content = prompt,          # texto del prompt
      images  = list(img_b64)    # imagen en base64 asociada al mensaje
    )
  ),
  stream = FALSE                 # sin streaming, respuesta completa
)

# Creamos un request con httr2 apuntando al servidor local de Ollama:
#  - por defecto, Ollama corre en localhost:11434
resp <- request("http://localhost:11434/api/chat") |>
  # req_body_json() convierte el body en JSON y lo adjunta al request.
  # auto_unbox = TRUE evita que vectores de longitud 1 se envuelvan en listas extra.
  req_body_json(body, auto_unbox = TRUE) |>
  # req_perform() envía efectivamente el request y obtiene la respuesta.
  req_perform()

# Extraemos el contenido de la respuesta como lista R (parseando JSON).
res_json <- resp_body_json(resp)
res_json  # lo imprimimos para ver la estructura completa.

# En res_json$message$content suele venir el texto generado por el modelo.
raw <- res_json$message$content
raw  # lo imprimimos para ver qué devolvió exactamente.

# Muchos modelos devuelven el JSON envuelto en un bloque de código de Markdown:
# ```json
# { ... }
# ```
# Por eso, limpiamos esos "fences" usando stringr::str_replace().
json_str <- raw |>
  # Eliminamos el encabezado ```json y posibles saltos de línea siguientes.
  stringr::str_replace("^```json\\s*", "") |>
  # Eliminamos el cierre ``` al final, con posibles espacios o saltos de línea.
  stringr::str_replace("```\\s*$", "")

# Vemos el JSON "puro" como texto.
cat(json_str)

# Si el modelo respetó realmente la consigna y devolvió JSON válido,
# podemos parsearlo directamente con fromJSON().
resultado <- fromJSON(json_str)

# Inspeccionamos la estructura del resultado: debería tener
#  - texto_completo
#  - fechas_mencionadas
#  - lugares_mencionados
str(resultado)

# Imprimimos el texto completo transcripto por el modelo.
cat(resultado$texto_completo)
