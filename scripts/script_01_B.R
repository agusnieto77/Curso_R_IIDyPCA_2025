library(tidyverse)
library(rvest)

tablas <- html_table(read_html("https://es.wikipedia.org/wiki/Poblaci%C3%B3n_mundial"))
