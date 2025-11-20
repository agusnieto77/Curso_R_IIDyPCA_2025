# ==============================================================================
# Script: Web Scraping de Reseñas de Booking
# ==============================================================================
# Descripción: Este script extrae reseñas de un hotel en Booking.com,
#              recopila información detallada de 20 páginas de comentarios.
# Fecha: 2025-11-20
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. CARGA DE LIBRERÍAS
# ------------------------------------------------------------------------------

library(rvest)      # Para web scraping y manipulación de contenido HTML
library(tidyverse)  # Conjunto de paquetes para manipulación y visualización de datos

# ------------------------------------------------------------------------------
# 2. CONSTRUCCIÓN DE URLs
# ------------------------------------------------------------------------------

# Genera un vector con 20 URLs, una por cada página de reseñas
# paste0() concatena strings sin espacios
# 1:20 crea una secuencia de números del 1 al 20 para las páginas
urls <- paste0(
  "https://www.booking.com/reviews/ar/hotel/sheraton-libertador-buenos-aires.es.html?",
  "r_lang=all&",           # Incluye reseñas en todos los idiomas
  "customer_type=total&",  # Muestra todos los tipos de clientes
  "order=completed_desc&", # Ordena por fecha de finalización (más reciente primero)
  "page=", 1:20            # Número de página (del 1 al 20)
)

# ------------------------------------------------------------------------------
# 3. EXTRACCIÓN DE ELEMENTOS HTML
# ------------------------------------------------------------------------------

# Inicializa una lista vacía para almacenar los elementos HTML extraídos
coment_xml <- list()

# Itera sobre cada URL para extraer el contenido de las reseñas
for (u in urls) { 
  # read_html(u) lee el contenido HTML de la página
  # html_elements() extrae elementos según el selector XPath especificado
  # XPath selecciona cada item <li> que contiene una reseña individual
  # append() agrega los nuevos elementos a la lista existente
  coment_xml <- append(
    coment_xml, 
    html_elements(
      read_html(u), 
      xpath = '//*[@id="review_list_page_container"]/ul/li'
    )
  )
}

# ------------------------------------------------------------------------------
# 4. PROCESAMIENTO Y ESTRUCTURACIÓN DE DATOS
# ------------------------------------------------------------------------------

# Inicializa un tibble (dataframe moderno de tidyverse) vacío
comentarios <- tibble()

# Itera sobre cada elemento HTML extraído para convertirlo en datos estructurados
for (i in coment_xml) {
  # rbind() combina filas: agrega cada nueva reseña al dataframe
  comentarios <- rbind(
    comentarios, 
    tibble(
      # html_element() extrae UN elemento usando selector CSS
      # html_text2() convierte el HTML a texto limpio (elimina espacios extra)
      
      # Fecha en que se publicó el comentario
      fecha_com = html_text2(html_element(i, "p.review_item_date")),
      
      # Puntuación numérica otorgada al hotel (escala 0-10)
      puntaje   = html_text2(html_element(i, ".review-score-badge")),
      
      # Valoración general o título de la reseña
      valo_gral = html_text2(html_element(i, ".review_item_header_content_container")),
      
      # Indicador si el usuario no dejó comentario escrito
      no_coment = html_text2(html_element(i, ".review_none")),
      
      # Comentarios positivos del huésped sobre su estadía
      comen_pos = html_text2(html_element(i, ".review_pos")),
      
      # Comentarios negativos o aspectos a mejorar señalados por el huésped
      comen_neg = html_text2(html_element(i, ".review_neg")),
      
      # Nombre del usuario que escribió la reseña
      autoria   = html_text2(html_element(i, "p.reviewer_name")),
      
      # País de origen del revisor
      pais      = html_text2(html_element(i, ".reviewer_country")),
      
      # Número total de comentarios que ha escrito este usuario en Booking
      n_coment  = html_text2(html_element(i, ".review_item_user_review_count")),
      
      # Cantidad de votos "útiles" que ha recibido este usuario
      n_votos   = html_text2(html_element(i, ".review_item_user_helpful_count")),
      
      # Fecha en que el huésped se hospedó en el hotel
      fecha_est = html_text2(html_element(i, ".review_staydate")),
      
      # Información adicional: motivo del viaje, etc.
      metadata  = html_text2(html_element(i, ".review_item_info_tags"))
    )
  )
}

# ------------------------------------------------------------------------------
# 5. GUARDADO DE DATOS
# ------------------------------------------------------------------------------

# Guarda el dataframe en formato RDS (formato nativo y comprimido de R)
# Asegúrate de que la carpeta "datos/" exista antes de ejecutar esta línea
saveRDS(comentarios, "datos/comentarios.rds")

# ------------------------------------------------------------------------------
# NOTAS IMPORTANTES:
# ------------------------------------------------------------------------------
# 1. Este script puede tardar varios minutos en ejecutarse (20 páginas)
# 2. Si la estructura HTML cambia, los selectores CSS necesitarán actualizarse
# 3. Para cargar los datos: comentarios <- readRDS("datos/comentarios.rds")
# ==============================================================================