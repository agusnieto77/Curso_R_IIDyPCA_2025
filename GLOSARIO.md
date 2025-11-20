# 📖 Glosario de términos de R y RStudio

Este glosario está diseñado para acompañar tu aprendizaje en el curso introductorio. Contiene definiciones concisas, ejemplos de código y referencias cruzadas.

## Índice alfabético

[A](#a) • [B](#b) • [C](#c) • [D](#d) • [E](#e) • [F](#f) • [G](#g) • [H](#h) • [I](#i) • [J](#j) • [K](#k) • [L](#l) • [M](#m) • [N](#n) • [O](#o) • [P](#p) • [Q](#q) • [R](#r) • [S](#s) • [T](#t) • [U](#u) • [V](#v) • [W](#w) • [X](#x) • [Y](#y) • [Z](#z)

---

## A

### **Archivo**
Documento digital almacenado en el disco. En R, típicamente trabajas con archivos de datos (`.csv`, `.xlsx`, `.rds`) o scripts (`.R`, `.Rmd`).
```r
# Listar archivos en el directorio actual
list.files()

# Verificar si un archivo existe
file.exists("datos.csv")

# Información sobre un archivo
file.info("script.R")
```
**Ver también:** [Ruta](#ruta), [Directorio de trabajo](#directorio-de-trabajo), [Importar](#importar)

---

### **Argumento**
Valor que se pasa a una función para que esta lo use en su operación. Puede ser obligatorio u opcional.
```r
# "x" es el argumento de la función mean()
mean(x = c(1, 2, 3, 4, 5))

# Múltiples argumentos con nombre
seq(from = 1, to = 10, by = 2)
#   ↑      ↑     ↑      ↑
#   función  argumentos
```
**Ver también:** [Función](#función), [Parámetro](#parámetro)

---

### **Array**
Estructura de datos multidimensional. Es una generalización de una matriz (que es 2D) a $n$ dimensiones.
```r
# Array de 3 dimensiones (2x3x4)
mi_array <- array(data = 1:24, dim = c(2, 3, 4))
```
**Ver también:** [Matriz](#matriz), [Vector](#vector)

---

### **Asignación**
Acción de guardar un valor en una variable. En R se prefiere el operador `<-`.
```r
# Asignación estándar (Recomendada)
edad <- 25

# Asignación con igual (Válida, pero menos idiomática en R)
edad = 25
```
**Ver también:** [Operador de asignación](#operador-de-asignación), [Variable](#variable)

---

## B

### **Base R**
El núcleo de R. Conjunto de funciones y paquetes instalados por defecto (como `base`, `utils`, `stats`) que funcionan sin instalar nada extra.
```r
# Funciones típicas de Base R
mean(c(1, 2, 3))
table(mtcars$cyl)
plot(1:10)
```
**Ver también:** [Paquete](#paquete), [Tidyverse](#tidyverse)

---

### **Booleano**
Ver [Logical](#logical).

---

### **Boxplot**
Diagrama de caja y bigotes. Muestra la distribución, centralidad y dispersión de los datos.
```r
boxplot(mtcars$mpg,
        main = "Distribución de Millas por Galón",
        ylab = "MPG")
# Muestra: mínimo, Q1, mediana, Q3, máximo y outliers
```
**Ver también:** [Cuartil](#cuartil), [Outlier](#outlier)

---

## C

### **`c()` (Combinar)**
Función fundamental para crear vectores o combinar valores. Significa *combine* o *concatenate*.
```r
# Crear un vector numérico
numeros <- c(1, 5, 10)

# Crear un vector de caracteres
nombres <- c("Ana", "Beto")
```
**Ver también:** [Vector](#vector)

---

### **Carácter** (Character)
Tipo de dato que representa texto. Siempre debe ir entre comillas.
```r
nombre <- "María"
ciudad <- 'Mar del Plata'  # Comillas simples o dobles funcionan
class(nombre)  # "character"
```
**Ver también:** [String](#string), [Tipo de dato](#tipo-de-dato)

---

### **Chunk**
Bloque de código ejecutable dentro de un documento R Markdown o Quarto.

````markdown
```{r}
# Esto es un chunk
x <- 5
print(x)
```
````

**Ver también:** [R Markdown](#r-markdown)

---

### **Clase** (Class)
Atributo que define qué tipo de objeto es y cómo reacciona ante funciones genéricas.
```r
class(5)          # "numeric"
class("hola")     # "character"
class(mtcars)     # "data.frame"
```
**Ver también:** [Tipo de dato](#tipo-de-dato), [Estructura de datos](#estructura-de-datos)

---

### **Columna**
Dimensión vertical en un data frame o matriz. Representa una variable.
```r
df$edad           # Acceso con $
df[, "edad"]      # Acceso matricial
```
**Ver también:** [Data frame](#data-frame), [Fila](#fila)

---

### **Comentario**
Texto ignorado por R, usado para explicar el código. Empieza con `#`.
```r
# Esto es un comentario
x <- 10  # Asigno 10 a x
```
**Ver también:** [Documentación](#documentación)

---

### **Consola**
Panel donde se ejecutan los comandos interactivamente y se ve la salida inmediata.
```
> 2 + 2
 4
```
**Ver también:** [Script](#script), [RStudio](#rstudio)

---

### **CRAN**
**Comprehensive R Archive Network**. Repositorio oficial mundial de paquetes de R.
```r
install.packages("ggplot2") # Descarga desde CRAN
```
**Ver también:** [Paquete](#paquete), [Repositorio](#repositorio)

---

### **CSV**
**Comma-Separated Values**. Formato de archivo de texto simple muy común para intercambiar datos.
```r
datos <- read.csv("datos.csv")
write.csv(datos, "mis_resultados.csv", row.names = FALSE)
```
**Ver también:** [Importar](#importar), [Data frame](#data-frame)

---

### **Cuartil**
Valores que dividen un conjunto ordenado de datos en cuatro partes iguales (25%, 50%, 75%).
```r
quantile(1:100, probs = c(0.25, 0.50, 0.75))
```
**Ver también:** [Mediana](#mediana), [Percentil](#percentil)

---

## D

### **Data frame**
Estructura tabular fundamental en R. Columnas = variables, Filas = observaciones. Puede tener distintos tipos de datos por columna (texto, números).
```r
df <- data.frame(
  id = 1:3,
  nombre = c("Ana", "Bob", "Ciro")
)
```
**Ver también:** [Tibble](#tibble), [Matriz](#matriz), [Columna](#columna), [Fila](#fila)

---

### **Dataset**
Conjunto de datos. R incluye varios para practicar.
```r
data(iris)   # Carga el dataset iris
head(iris)   # Muestra las primeras filas
```
**Ver también:** [Data frame](#data-frame)

---

### **Debug**
Proceso de encontrar y corregir errores en el código. RStudio tiene herramientas integradas para depuración.
```r
# Funciones útiles para debugging
print(x)           # Imprimir valores
str(objeto)        # Estructura del objeto
traceback()        # Ver pila de llamadas tras error
browser()          # Pausar ejecución para inspeccionar

# En RStudio: usa breakpoints (puntos rojos al lado del código)
```
**Ver también:** [Error](#error), [Warning](#warning)

---

### **Desviación estándar** (Standard Deviation)
Medida de cuánto se alejan los valores del promedio. Es la raíz cuadrada de la varianza.
```r
sd(c(1, 5, 10))
```
**Ver también:** [Varianza](#varianza), [Media](#media)

---

### **Dimensión**
Tamaño de una estructura de datos (número de filas y columnas).
```r
matriz <- matrix(1:12, nrow = 3, ncol = 4)

dim(matriz)      # 3 4 (3 filas, 4 columnas)
nrow(matriz)     # 3 (número de filas)
ncol(matriz)     # 4 (número de columnas)
```
**Ver también:** [Matriz](#matriz), [Data frame](#data-frame)

---

### **Directorio de trabajo** (Working Directory)
Carpeta donde R busca archivos para leer y donde guarda lo que exportas.
```r
getwd()          # ¿Dónde estoy?
setwd("C:/R/")   # Cambiar carpeta (No recomendado, usar Proyectos)
list.files()     # Listar archivos
```
**Ver también:** [Proyecto](#proyecto), [Ruta](#ruta), [Archivo](#archivo)

---

### **Distribución**
Patrón que describe cómo se dispersan los valores de una variable. Fundamental en estadística.
```r
# Visualizar distribución
hist(mtcars$mpg)  # Histograma
boxplot(mtcars$mpg)  # Boxplot
density(mtcars$mpg)  # Curva de densidad

# Distribuciones comunes
rnorm(100)    # Normal
runif(100)    # Uniforme
rpois(100, lambda = 3)  # Poisson
```
**Ver también:** [Histograma](#histograma), [Boxplot](#boxplot)

---

### **División entera**
Operador `%/%` que devuelve solo la parte entera de una división.
```r
17 %/% 5   # 3 (descarta el resto)
17 / 5     # 3.4 (división normal)
17 %% 5    # 2 (solo el resto)
```
**Ver también:** [Módulo](#módulo), [Operador](#operador)

---

### **Documentación**
Información de ayuda sobre funciones, paquetes o conceptos de R.
```r
?mean
help(mean)
??regression
example(mean)
```
**Ver también:** [Comentario](#comentario), [Help](#help)

---

### **dplyr**
Paquete del Tidyverse para manipulación de datos. Ofrece funciones intuitivas como `filter()`, `select()`, `mutate()`, `summarise()` y `arrange()`.
```r
library(dplyr)

mtcars %>%
  filter(mpg > 20) %>%
  select(mpg, cyl, hp) %>%
  arrange(desc(hp))
```
**Ver también:** [Tidyverse](#tidyverse), [Pipe](#pipe), [Filtrar](#filtrar)

---

## E

### **Editor**
Panel de RStudio donde escribes tus scripts. El código aquí no se ejecuta hasta que lo envías a la consola (Ctrl+Enter).
**Ver también:** [Script](#script), [RStudio](#rstudio)

---

### **Entero** (Integer)
Número sin decimales. Para forzarlo en R se usa una `L` al final.
```r
x <- 10L
class(x) # "integer"
```
**Ver también:** [Numeric](#numeric), [Tipo de dato](#tipo-de-dato)

---

### **Environment**
Panel que lista todos los objetos (variables, datos, funciones) creados en tu sesión actual.
```r
ls()  # Lista los objetos por código
rm(x) # Elimina un objeto del environment
```
**Ver también:** [Workspace](#workspace), [Objeto](#objeto), [RStudio](#rstudio)

---

### **Error**
Mensaje crítico que detiene la ejecución. Significa que la instrucción no pudo realizarse.
```
# Error: object 'x' not found
# Significa que intentas usar una variable que no has creado.
```
**Ver también:** [Warning](#warning), [Debug](#debug)

---

### **Exportar**
Guardar datos de R hacia archivos externos para compartir o usar en otras aplicaciones.
```r
# Exportar a CSV
write.csv(mi_dataframe, "datos_exportados.csv", row.names = FALSE)

# Exportar a Excel
library(writexl)
write_xlsx(mi_dataframe, "datos.xlsx")

# Exportar gráfico
ggsave("mi_grafico.png", width = 8, height = 6)
```
**Ver también:** [Importar](#importar), [CSV](#csv), [xlsx](#xlsx)

---

### **Estructura de datos**
Forma en que R organiza y almacena datos. Las principales son: vector, matriz, array, data frame y lista.
```r
v <- c(1, 2, 3)
m <- matrix(1:6, nrow = 2)
df <- data.frame(x = 1:3, y = c("a", "b", "c"))
l <- list(vector = v, matriz = m, dataframe = df)
```
**Ver también:** [Vector](#vector), [Matriz](#matriz), [Data frame](#data-frame), [Lista](#lista)

---

## F

### **Factor**
Estructura para datos categóricos (nominales u ordinales). Almacena etiquetas como números internamente.
```r
sexo <- factor(c("M", "F", "F", "M"))
levels(sexo) # "F" "M"
```
**Ver también:** [Levels](#levels), [Variable categórica](#variable-categórica)

---

### **Fila**
Dimensión horizontal en un data frame. Representa una observación o caso individual.
```r
df[1, ]      # Primera fila completa
df[2:3, ]    # Filas 2 y 3
```
**Ver también:** [Columna](#columna), [Data frame](#data-frame)

---

### **Filtrar**
Operación de seleccionar filas que cumplen una condición lógica.
```r
# Base R
subset(mtcars, mpg > 20)

# dplyr
library(dplyr)
filter(mtcars, mpg > 20)
```
**Ver también:** [Subset](#subset), [Data frame](#data-frame)

---

### **Función**
Bloque de código que realiza una tarea. Sigue la forma `nombre(argumentos)`.
```r
sum(1, 2)  # sum es la función

saludar <- function(nombre) {
  paste("Hola", nombre)
}
saludar("María")
```
**Ver también:** [Argumento](#argumento), [Parámetro](#parámetro), [Return](#return)

---

## G

### **Geom** (Geometría)
En `ggplot2`, define la forma visual del gráfico (puntos, líneas, barras).
```r
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point() +  # Puntos
  geom_smooth()   # Línea de tendencia
```
**Ver también:** [ggplot2](#ggplot2), [Gráfico](#gráfico)

---

### **ggplot2**
El paquete de visualización más popular de R, basado en la "Gramática de Gráficos".
```r
library(ggplot2)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  theme_minimal()
```
**Ver también:** [Tidyverse](#tidyverse), [Gráfico](#gráfico)

---

### **Gráfico** (Plot)
Visualización de datos.
```r
plot(x, y)              # Base R
hist(mtcars$mpg)        # Histograma
boxplot(mtcars$mpg)     # Boxplot
```
**Ver también:** [ggplot2](#ggplot2), [Visualización](#visualización)

---

## H

### **Help**
Ayuda oficial de R.
```r
?mean        # Ayuda rápida
help("mean") # Lo mismo
??regression # Búsqueda más amplia
```
**Ver también:** [Documentación](#documentación)

---

### **Histograma**
Gráfico para ver la distribución de una variable numérica continua.
```r
hist(mtcars$mpg,
     main = "Histograma de MPG",
     xlab = "MPG")
```
**Ver también:** [Gráfico](#gráfico), [Distribución](#distribución)

---

## I

### **Importar**
Leer datos externos hacia R.
```r
datos_csv <- read.csv("archivo.csv")

library(readxl)
datos_xlsx <- read_excel("archivo.xlsx")
```
**Ver también:** [Exportar](#exportar), [CSV](#csv)

---

### **Índice** (Index)
Posición numérica de un elemento. **R empieza a contar desde 1**.
```r
v <- c("A", "B", "C")
v[1] # "A"
```
**Ver también:** [Vector](#vector), [Subset](#subset)

---

### **Inf**
Valor especial que representa infinito.
```r
1 / 0       # Inf (infinito positivo)
-1 / 0      # -Inf (infinito negativo)
is.infinite(Inf)  # TRUE
```
**Ver también:** [NA](#na), [NaN](#nan)

---

### **IQR**
Rango Intercuartílico ($Q3 - Q1$). Mide la dispersión del 50% central de los datos.
```r
IQR(mtcars$mpg)
```
**Ver también:** [Cuartil](#cuartil), [Boxplot](#boxplot)

---

## J

### **Join** (Unir)
Operación para combinar dos data frames basándose en una o más columnas comunes. Similar a las uniones en SQL.
```r
# Ejemplo con dplyr
library(dplyr)

# Inner join: solo filas que coinciden en ambos
inner_join(df1, df2, by = "id")

# Left join: todas las filas de df1
left_join(df1, df2, by = "id")

# Full join: todas las filas de ambos
full_join(df1, df2, by = "id")
```
**Ver también:** [Merge](#merge), [Data frame](#data-frame), [dplyr](#dplyr)

---

### **JSON**
**JavaScript Object Notation**. Formato de intercambio de datos muy popular en APIs y aplicaciones web.
```r
library(jsonlite)

# Leer JSON
datos <- fromJSON("datos.json")

# Escribir JSON
toJSON(mi_dataframe, pretty = TRUE)
```
**Ver también:** [CSV](#csv), [Importar](#importar)

---

## K

### **Knit** (Tejer)
Proceso de convertir un archivo R Markdown en un documento final (HTML, PDF, Word).
```r
# En RStudio: botón "Knit"
# O desde código:
rmarkdown::render("mi_documento.Rmd")
```
**Ver también:** [R Markdown](#r-markdown), [Knitr](#knitr)

---

### **Knitr**
Paquete que ejecuta código R y genera reportes dinámicos. Es el motor detrás de R Markdown.
```r
library(knitr)

# Opciones de chunk comunes
opts_chunk$set(
  echo = TRUE,        # Mostrar código
  warning = FALSE,    # Ocultar warnings
  message = FALSE     # Ocultar mensajes
)
```
**Ver también:** [R Markdown](#r-markdown), [Knit](#knit), [Chunk](#chunk)

---

## L

### **Levels** (Niveles)
Las categorías únicas permitidas en un factor.
```r
f <- factor(c("Alto", "Bajo", "Medio"))
levels(f)
```
**Ver también:** [Factor](#factor)

---

### **Librería** (Library)
Directorio donde se almacenan los paquetes. A menudo se usa erróneamente como sinónimo de paquete.
```r
library(dplyr) # Carga un paquete instalado
```
**Ver también:** [Paquete](#paquete)

---

### **Lista**
Objeto muy flexible que puede contener cualquier otro objeto dentro (vectores, data frames, otras listas).
```r
mi_lista <- list(
  nombre = "Juan",
  notas  = c(10, 8, 9)
)
mi_lista$notas
```
**Ver también:** [Vector](#vector), [Data frame](#data-frame)

---

### **Logical**
Tipo de dato binario: `TRUE` (T) o `FALSE` (F).
```r
5 > 3  # TRUE
10 == 5 # FALSE
```
**Ver también:** [Booleano](#booleano), [Tipo de dato](#tipo-de-dato)

---

## M

### **Matriz**
Estructura 2D donde **todos** los datos deben ser del mismo tipo (todos números o todos caracteres).
```r
matrix(1:9, nrow = 3, ncol = 3)
```
**Ver también:** [Array](#array), [Data frame](#data-frame)

---

### **Media** (Mean)
Promedio aritmético.
```r
mean(c(10, 20)) # 15
```
**Ver también:** [Mediana](#mediana), [Moda](#moda)

---

### **Mediana** (Median)
Valor central de los datos. Es más robusta a valores extremos que la media.
```r
median(c(1, 2, 100)) # 2
```
**Ver también:** [Media](#media), [Cuartil](#cuartil)

---

### **Merge** (Fusionar)
Función de Base R para combinar dos data frames. Similar a `join()` de dplyr.
```r
# Merge por columna común
merge(df1, df2, by = "id")

# Diferentes tipos de merge
merge(df1, df2, by = "id", all = TRUE)    # Full join
merge(df1, df2, by = "id", all.x = TRUE)  # Left join
merge(df1, df2, by = "id", all.y = TRUE)  # Right join
```
**Ver también:** [Join](#join), [Data frame](#data-frame)

---

### **Moda** (Mode)
Valor que aparece con mayor frecuencia. R no tiene función nativa para calcularla.
```r
# Encontrar la moda manualmente
tabla <- table(c(1, 2, 2, 3, 3, 3, 4))
names(tabla)[which.max(tabla)]  # "3"

# Función personalizada
calcular_moda <- function(x) {
  uniq <- unique(x)
  uniq[which.max(tabulate(match(x, uniq)))]
}
```
**Ver también:** [Media](#media), [Mediana](#mediana)

---

### **Módulo**
Operador `%%` que devuelve el resto de una división.
```r
10 %% 3   # 1
```
**Ver también:** [División entera](#división-entera), [Operador](#operador)

---

## N

### **NA**
**Not Available**. Representa un dato faltante. Es "contagioso" en operaciones.
```r
mean(c(1, 2, NA))           # NA
mean(c(1, 2, NA), na.rm=TRUE)  # 1.5
```
**Ver también:** [NULL](#null), [NaN](#nan)

---

### **NaN**
**Not a Number**. Resultado matemático imposible (ej. $0/0$).
```r
0/0      # NaN
is.nan(0/0)  # TRUE
```
**Ver también:** [NA](#na), [Inf](#inf)

---

### **NULL**
El vacío. Indica que el objeto no existe o está vacío. Diferente a `NA`.
```r
x <- NULL
is.null(x) # TRUE
```
**Ver también:** [NA](#na)

---

### **Numeric**
Tipo de dato para números reales (con decimales). Es el tipo por defecto para números en R.
```r
x <- 1.5
class(x)  # "numeric"
```
**Ver también:** [Entero](#entero), [Tipo de dato](#tipo-de-dato)

---

## O

### **Objeto**
Todo en R es un objeto: variables, funciones, gráficos, resultados de modelos.
```r
x <- 5                    # Objeto numérico
f <- function() {}        # Objeto función
df <- data.frame()        # Objeto data frame
```
**Ver también:** [Variable](#variable), [Environment](#environment)

---

### **Operador**
Símbolos para cálculos o comparaciones.
- Aritméticos: `+`, `-`, `*`, `/`, `^`, `%%`, `%/%`
- Relacionales: `==`, `!=`, `>`, `<`, `>=`, `<=`
- Lógicos: `&` (AND), `|` (OR), `!` (NOT)
```r
5 > 3 & 2 < 1  # FALSE
```
**Ver también:** [Función](#función)

---

### **Operador de asignación**
Símbolo para asignar valores a variables: `<-` o `=`.
```r
edad <- 25
edad = 25
30 -> edad_nueva
```
**Ver también:** [Asignación](#asignación), [Variable](#variable)

---

### **Outlier**
Dato atípico que se aleja drásticamente del patrón del resto.
```r
datos <- c(10, 12, 15, 18, 20, 22, 100)  # 100 es un outlier
boxplot(datos)
```
**Ver también:** [Boxplot](#boxplot), [IQR](#iqr)

---

## P

### **Paquete** (Package)
Extensiones de R creadas por la comunidad. Contienen código, datos y documentación.
```r
install.packages("dplyr") # Instalar (una vez)
library(dplyr)            # Cargar (cada sesión)
installed.packages()      # Ver paquetes instalados
```
**Ver también:** [Librería](#librería), [CRAN](#cran)

---

### **Parámetro**
Variable definida en la creación de una función.
```r
mi_funcion <- function(x) {  # x es parámetro
  x * 2
}
mi_funcion(5)  # 5 es argumento
```
**Ver también:** [Argumento](#argumento), [Función](#función)

---

### **Percentil**
Valor que divide un conjunto ordenado de datos en 100 partes iguales.
```r
datos <- 1:100
quantile(datos, probs = 0.90)  # Percentil 90
```
**Ver también:** [Cuartil](#cuartil), [Quantile](#quantile)

---

### **Pipe** (`%>%` o `|>`)
Operador para encadenar funciones. Pasa el resultado de la izquierda como primer argumento de la derecha. "Y entonces...".
```r
# Estilo tidyverse (requiere magrittr/dplyr)
library(dplyr)
mtcars %>%
  filter(mpg > 20) %>%
  select(mpg, cyl)

# Estilo R base (nativo desde R 4.1)
mtcars |>
  subset(mpg > 20) |>
  with(mean(mpg))
```
**Ver también:** [dplyr](#dplyr), [Función](#función)

---

### **Plot**
Ver [Gráfico](#gráfico)

---

### **Proyecto** (.Rproj)
Funcionalidad de RStudio para manejar archivos. Fija automáticamente el Directorio de Trabajo en la carpeta del proyecto, evitando problemas de rutas.
**Ver también:** [Directorio de trabajo](#directorio-de-trabajo), [RStudio](#rstudio)

---

## Q

### **Quantile**
Ver [Cuartil](#cuartil) y [Percentil](#percentil)

---

## R

### **R**
Lenguaje de programación y entorno para análisis estadístico y gráficos.
```r
R.version.string
```
**Ver también:** [RStudio](#rstudio), [Base R](#base-r)

---

### **R Markdown**
Formato que combina código R con texto Markdown para crear documentos dinámicos (HTML, PDF, Word).

````markdown
---
title: "Mi Análisis"
output: html_document
---

## Introducción

Este es texto normal.

```{r}
x <- 1:10
mean(x)
```

El promedio es `r mean(x)`.
````

**Ver también:** [Chunk](#chunk), [Knitr](#knitr)

---

### **RData**
Formato de archivo de R para guardar objetos.
```r
save(x, y, file = "mis_datos.RData")
load("mis_datos.RData")
```
**Ver también:** [RDS](#rds), [Workspace](#workspace)

---

### **Repositorio**
Servidor donde se almacenan paquetes de R. CRAN es el repositorio oficial principal.
```r
# Ver repositorios configurados
getOption("repos")

# Instalar desde CRAN (repositorio por defecto)
install.packages("dplyr")

# Instalar desde GitHub (repositorio alternativo)
# install.packages("devtools")
# devtools::install_github("usuario/paquete")
```
**Ver también:** [CRAN](#cran), [Paquete](#paquete)

---

### **Return**
Palabra clave para devolver explícitamente un valor desde una función. No siempre es necesaria, ya que R devuelve automáticamente la última expresión evaluada.
```r
# Sin return (recomendado para casos simples)
sumar <- function(a, b) {
  a + b
}

# Con return (útil para salidas tempranas)
dividir <- function(a, b) {
  if (b == 0) {
    return(NA)  # Salida temprana
  }
  a / b
}
```
**Ver también:** [Función](#función), [Parámetro](#parámetro)

---

### **RDS**
Formato de archivo de R para guardar un solo objeto.
```r
saveRDS(mi_dataframe, "datos.rds")
mi_dataframe <- readRDS("datos.rds")
```
**Ver también:** [RData](#rdata)

---

### **RStudio**
Entorno de desarrollo integrado (IDE) para trabajar con R. Proporciona consola, editor, visualizador de gráficos, panel de environment, etc.
**Ver también:** [Consola](#consola), [Editor](#editor), [Environment](#environment), [Proyecto](#proyecto)

---

### **Ruta** (Path)
Ubicación de un archivo o directorio en el sistema. Pueden ser absolutas o relativas.
```r
# Ruta absoluta (desde la raíz)
"C:/Users/Usuario/Documentos/datos.csv"

# Ruta relativa (desde el directorio de trabajo)
"datos/archivo.csv"
"../carpeta_superior/archivo.csv"

# Buenas prácticas: usar rutas relativas y Proyectos de RStudio
# Evitar: setwd() y rutas absolutas
```
**Ver también:** [Directorio de trabajo](#directorio-de-trabajo), [Proyecto](#proyecto)

---

## S

### **Script** (`.R`)
Archivo de texto simple donde guardas tu código R para ejecutarlo después. Es una buena práctica trabajar siempre en scripts, no directo en la consola.
```r
# script_ejemplo.R
x <- 1:10
mean(x)
```
**Ver también:** [Editor](#editor), [Consola](#consola)

---

### **String**
Sinónimo de cadena de caracteres o texto.
```r
mensaje <- "Hola mundo"
class(mensaje)  # "character"
```
**Ver también:** [Carácter](#carácter)

---

### **Subset**
Subconjunto de datos. Extraer una parte de un objeto (filas, columnas, elementos) basado en índices o condiciones.
```r
# Elementos del 1 al 5
vector[1:5]

# Filas donde edad > 18
subset(datos, edad > 18)
```
**Ver también:** [Filtrar](#filtrar), [Índice](#índice)

---

### **Summary**
Función genérica muy útil que ofrece un resumen estadístico rápido de un objeto.
```r
summary(mtcars$mpg)
summary(mtcars)
```

---

## T

### **Tibble**
Una versión moderna y refinada del data frame, usada en el **Tidyverse**. Muestra mejor la información en consola y evita comportamientos automáticos molestos de los data frames clásicos.
```r
library(tibble)
as_tibble(iris)
```
**Ver también:** [Data frame](#data-frame)

---

### **Tidyverse**
Colección de paquetes R diseñados para la ciencia de datos que comparten una filosofía de diseño, gramática y estructuras de datos comunes. Incluye `ggplot2`, `dplyr`, `tidyr`, `readr`, entre otros.
```r
install.packages("tidyverse")
library(tidyverse)
```
**Ver también:** [Paquete](#paquete)

---

### **Tipo de dato**
La naturaleza del valor almacenado. Los atómicos principales en R son: `numeric`, `integer`, `character`, `logical` y `complex`.
**Ver también:** [Clase](#clase)

---

## U

### **Unlist**
Función para convertir una lista en un vector simple.
```r
lista <- list(a = 1, b = 2)
vector <- unlist(lista) # c(1, 2)
```
**Ver también:** [Lista](#lista)

---

## V

### **Variable**
Nombre simbólico que se le da a un valor o un objeto para almacenarlo en la memoria.
```r
mi_variable <- 10
```
**Ver también:** [Asignación](#asignación), [Objeto](#objeto)

---

### **Variable categórica**
Variable que representa categorías o grupos. En R se manejan con factores.
```r
# Variable categórica nominal (sin orden)
color <- factor(c("rojo", "azul", "verde", "rojo"))

# Variable categórica ordinal (con orden)
talla <- factor(c("S", "M", "L", "M"),
                levels = c("S", "M", "L"),
                ordered = TRUE)
```
**Ver también:** [Factor](#factor), [Levels](#levels)

---

### **Varianza**
Medida de dispersión (el cuadrado de la desviación estándar).
```r
var(c(1, 5, 10))
```
**Ver también:** [Desviación estándar](#desviación-estándar)

---

### **Vector**
La estructura de datos más básica en R. Una colección ordenada de elementos del **mismo tipo**. Incluso un solo número en R es un vector de longitud 1.
```r
v <- c(10, 20, 30)
length(v) # 3
```
**Ver también:** [c()](#c-combinar)

---

### **Vectorización**
Característica potente de R donde las operaciones se aplican a todo el vector a la vez sin necesidad de bucles (loops).
```r
x <- c(1, 2, 3)
y <- x * 2
# Resultado: 2, 4, 6 (multiplicó todos los elementos simultáneamente)
```

---

### **View**
Función de RStudio que abre una pestaña estilo hoja de cálculo para inspeccionar un data frame.
```r
View(mtcars) # Nota: La V es mayúscula
```

---

### **Visualización**
Representación gráfica de datos. R ofrece múltiples sistemas de visualización.
```r
# Base R
plot(mtcars$wt, mtcars$mpg)
hist(mtcars$mpg)
barplot(table(mtcars$cyl))

# ggplot2 (más moderno y flexible)
library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm")
```
**Ver también:** [ggplot2](#ggplot2), [Gráfico](#gráfico), [Plot](#plot)

---

## W

### **Warning**
Mensaje de advertencia. Algo "sospechoso" ocurrió, pero R pudo terminar la tarea. No detiene el código, pero debes revisarlo.
```
# Warning message:
# NAs introduced by coercion
```
**Ver también:** [Error](#error)

---

### **Workspace**
El espacio de trabajo que contiene todos los objetos creados durante la sesión. Al cerrar RStudio, te preguntará si quieres guardarlo (generalmente es mejor decir que **No** y volver a correr el script "limpio").
**Ver también:** [Environment](#environment)

---

## X

### **xlsx**
Formato de archivo de Microsoft Excel. R puede leer y escribir estos archivos con paquetes especializados.
```r
library(readxl)
# Leer archivo Excel
datos <- read_excel("archivo.xlsx", sheet = "Hoja1")

library(writexl)
# Escribir archivo Excel
write_xlsx(mi_dataframe, "resultados.xlsx")
```
**Ver también:** [CSV](#csv), [Importar](#importar)

---

### **xlab / ylab**
Argumentos de funciones gráficas para establecer las etiquetas de los ejes X e Y.
```r
plot(mtcars$wt, mtcars$mpg,
     xlab = "Peso del vehículo (1000 lbs)",
     ylab = "Millas por galón",
     main = "Relación Peso-Consumo")
```
**Ver también:** [Gráfico](#gráfico), [Plot](#plot)

---

## Y

### **YAML**
Lenguaje de marcado usado en el encabezado de archivos R Markdown para especificar metadatos y opciones.
```yaml
---
title: "Mi Análisis"
author: "Tu Nombre"
date: "2025-01-20"
output: html_document
---
```
**Ver también:** [R Markdown](#r-markdown), [Knit](#knit)

---

### **Yaxis / Xaxis**
Referencias a los ejes vertical (Y) y horizontal (X) en un gráfico. En `ggplot2` se controlan con funciones específicas.
```r
library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  scale_y_continuous(limits = c(0, 40)) +
  scale_x_continuous(breaks = seq(2, 5, 0.5))
```
**Ver también:** [ggplot2](#ggplot2), [Gráfico](#gráfico)

---

## Z

### **Zoo**
Paquete de R para trabajar con series temporales irregulares (datos ordenados en el tiempo).
```r
library(zoo)
# Crear objeto zoo
fechas <- as.Date(c("2024-01-01", "2024-01-05", "2024-01-10"))
valores <- c(10, 15, 12)
serie <- zoo(valores, fechas)
```
**Ver también:** [Paquete](#paquete), [Data frame](#data-frame)

---

### **Zero-indexing vs One-indexing**
Diferencia fundamental entre lenguajes. **R usa one-indexing** (empieza en 1), mientras que Python y muchos otros usan zero-indexing (empiezan en 0).
```r
# En R, el primer elemento es el índice 1
v <- c("primero", "segundo", "tercero")
v[1]  # "primero" ✓

# En Python sería v[0]
# Esto es importante al migrar código entre lenguajes
```
**Ver también:** [Índice](#índice), [Vector](#vector)
