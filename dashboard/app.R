library(shiny)
library(DT)
library(leaflet)
library(tidyverse)
library(tidytext)
library(wordcloud2)

ui <- fluidPage(
  titlePanel("Noticias de política"),
  tabsetPanel(
    tabPanel(
      "Tabla",
      DTOutput("tabla")
    ),
    tabPanel(
      "Mapa",
      leafletOutput("mapa", height = 500)
    ),
    tabPanel(
      "Nube de palabras",
      wordcloud2Output("nube")
    )
  )
)

server <- function(input, output, session) {
  df <- readr::read_csv("../datos/noticias_politica_geocodificadas.csv", show_col_types = FALSE)

  output$tabla <- renderDT({
    datatable(df, filter = "top", options = list(pageLength = 10))
  })

  output$mapa <- renderLeaflet({
    leaflet(df) |>
      addTiles() |>
      addCircleMarkers(
        lng = ~lon,
        lat = ~lat,
        radius = 6,
        popup = ~titulo,
        color = "#0072B2",
        fillOpacity = 0.8
      )
  })

  output$nube <- renderWordcloud2({
    palabras <- df |>
      select(titulo, categoria) |>
      unnest_tokens(output = palabra, input = titulo) |>
      count(palabra, sort = TRUE)

    wordcloud2(head(palabras, 100))
  })
}

shinyApp(ui, server)
