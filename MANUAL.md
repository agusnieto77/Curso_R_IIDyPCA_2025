# Manual de primeros pasos con R y RStudio

## 📚 Introducción

Este manual está diseñado para estudiantes que están dando sus primeros pasos en R y RStudio. Aprenderás los conceptos fundamentales del lenguaje de programación R y cómo usar el entorno RStudio de manera efectiva.

## 📋 Tabla de contenidos

- [Instalación](#instalación)
- [Conociendo RStudio](#conociendo-rstudio)
- [Primeros Pasos en R](#primeros-pasos-en-r)
- [Tipos de Datos](#tipos-de-datos)
- [Estructuras de Datos](#estructuras-de-datos)
- [Operaciones Básicas](#operaciones-básicas)
- [Importar y Exportar Datos](#importar-y-exportar-datos)
- [Recursos Adicionales](#recursos-adicionales)

---

## 🔧 Instalación

### Paso 1: Instalar R

1. Ve a [https://cran.r-project.org/](https://cran.r-project.org/)
2. Selecciona tu sistema operativo (Windows, Mac, Linux)
3. Descarga la versión más reciente
4. Ejecuta el instalador y sigue las instrucciones

### Paso 2: Instalar RStudio

1. Ve a [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
2. Descarga RStudio Desktop (versión gratuita)
3. Instala RStudio después de haber instalado R

> **Nota:** R es el lenguaje de programación. RStudio es el entorno de desarrollo que hace más fácil trabajar con R.

---

## 🖥️ Conociendo RStudio

Al abrir RStudio verás cuatro paneles principales:

### 1. **Editor de Scripts** (Superior Izquierda)
- Aquí escribes y guardas tus scripts de R
- Para crear un nuevo script: `File > New File > R Script`
- Para ejecutar una línea: `Ctrl + Enter` (Windows/Linux) o `Cmd + Enter` (Mac)

### 2. **Consola** (Inferior Izquierda)
- Aquí se ejecutan los comandos
- Muestra los resultados inmediatamente
- Puedes escribir comandos directamente aquí

### 3. **Environment/History** (Superior Derecha)
- **Environment**: Muestra los objetos que has creado
- **History**: Historial de comandos ejecutados

### 4. **Files/Plots/Packages/Help** (Inferior Derecha)
- **Files**: Navegador de archivos
- **Plots**: Visualización de gráficos
- **Packages**: Gestión de paquetes instalados
- **Help**: Documentación y ayuda

### Configuración inicial recomendada
```r
# Ver el directorio de trabajo actual
getwd()

# Cambiar el directorio de trabajo (ajusta la ruta a tu carpeta)
setwd("C:/Users/TuUsuario/Documentos/ProyectosR")

# Verificar el cambio
getwd()
```

---

## 🚀 Primeros pasos en R

### Comentarios

Los comentarios te ayudan a documentar tu código. R ignora todo lo que está después de `#`.
```r
# Esto es un comentario
# R no ejecuta esta línea

2 + 2  # También puedes comentar al final de una línea
```

### R como calculadora
```r
# Operaciones básicas
2 + 3        # Suma: 5
10 - 4       # Resta: 6
5 * 6        # Multiplicación: 30
20 / 4       # División: 5
2^3          # Potencia: 8
20 / 3       # División con decimales: 6.666667
20 %/% 3     # División entera (sin decimales): 6
10 %% 3      # Módulo (resto de la división): 1
```

### Asignación de variables

En R usamos `<-` para asignar valores a variables (también funciona `=` pero `<-` es más común).
```r
# Asignar valores a variables
edad <- 25
nombre <- "María"
es_estudiante <- TRUE

# Ver el contenido de una variable
print(edad)
edad  # También funciona sin print()

# Realizar operaciones con variables
edad_en_5_años <- edad + 5
print(edad_en_5_años)  # 30
```

### Reglas para nombres de variables
```r
# ✅ Válidos
mi_variable <- 10
variable1 <- 20
variable.dos <- 30

# ❌ No válidos
# 1variable <- 10      # No puede empezar con número
# mi-variable <- 10    # No puede contener guiones medios
# mi variable <- 10    # No puede tener espacios
```

> **Importante:** R distingue entre MAYÚSCULAS y minúsculas. `Edad` y `edad` son variables diferentes.

---

## 📊 Tipos de datos

R tiene varios tipos de datos básicos:

### 1. Numeric (Numérico)

Números con decimales.
```r
altura <- 1.75
temperatura <- 36.5

class(altura)  # "numeric"
```

### 2. Integer (Entero)

Números sin decimales. Se indican con `L` al final.
```r
edad <- 25L
cantidad <- 100L

class(edad)  # "integer"
```

### 3. Character (Texto)

Cadenas de texto entre comillas simples o dobles.
```r
nombre <- "Juan"
ciudad <- 'Buenos Aires'

class(nombre)  # "character"
```

### 4. Logical (Lógico)

Valores de verdad: `TRUE` o `FALSE`.
```r
aprobado <- TRUE
es_mayor <- FALSE

class(aprobado)  # "logical"
```

### Verificar y convertir tipos
```r
# Verificar tipo
x <- 5.5
is.numeric(x)     # TRUE
is.character(x)   # FALSE

# Convertir tipos
numero <- 42
texto <- as.character(numero)   # "42"
de_vuelta <- as.numeric(texto)  # 42

logico <- TRUE
numero_logico <- as.numeric(logico)  # 1 (TRUE = 1, FALSE = 0)
```

---

## 📦 Estructuras de datos

### 1. Vectores

Los vectores son la estructura más básica. Contienen elementos del **mismo tipo**.
```r
# Crear vectores con c() (combinar)
edades <- c(23, 25, 30, 28, 22)
nombres <- c("Ana", "Juan", "María", "Pedro", "Laura")
aprobados <- c(TRUE, TRUE, FALSE, TRUE, TRUE)

# Ver contenido
print(edades)
length(edades)  # Cantidad de elementos: 5

# Acceder a elementos (R cuenta desde 1, no desde 0 como en python)
primer_nombre <- nombres[1]      # "Ana"
tercera_edad <- edades[3]        # 30

# Acceder a múltiples elementos
primeros_tres <- nombres[1:3]    # "Ana", "Juan", "María"
algunos <- edades[c(1, 3, 5)]    # 23, 30, 22

# Operaciones con vectores numéricos
edades + 5           # Suma 5 a cada elemento
edades * 2           # Multiplica cada elemento por 2
mean(edades)         # Promedio: 25.6
sum(edades)          # Suma total: 128
max(edades)          # Máximo: 30
min(edades)          # Mínimo: 22
```

#### Crear secuencias
```r
# Secuencia simple
uno_al_diez <- 1:10
print(uno_al_diez)

# Secuencia con incrementos
pares <- seq(from = 2, to = 20, by = 2)
print(pares)  # 2, 4, 6, 8, 10, 12, 14, 16, 18, 20

# Repetir valores
tres_cincos <- rep(5, times = 3)  # 5, 5, 5
patron <- rep(c("A", "B"), times = 4)  # "A", "B", "A", "B", "A", "B", "A", "B"
```

### 2. Matrices

Arreglos bidimensionales (filas y columnas) del mismo tipo.
```r
# Crear una matriz
mi_matriz <- matrix(
  data = 1:12,
  nrow = 3,
  ncol = 4
)
print(mi_matriz)

# Acceder a elementos: matriz[fila, columna]
elemento <- mi_matriz[2, 3]        # Fila 2, Columna 3
primera_fila <- mi_matriz[1, ]     # Toda la primera fila
segunda_columna <- mi_matriz[, 2]  # Toda la segunda columna

# Dimensiones
dim(mi_matriz)   # 3 filas, 4 columnas
nrow(mi_matriz)  # 3 filas
ncol(mi_matriz)  # 4 columnas
```

### 3. Data Frames

**La estructura más importante para análisis de datos.** Es como una tabla o planilla de Excel.
```r
# Crear un data frame
estudiantes <- data.frame(
  nombre = c("Ana", "Juan", "María", "Pedro", "Laura"),
  edad = c(23, 25, 30, 28, 22),
  carrera = c("Sociología", "Historia", "Economía", "Sociología", "Psicología"),
  promedio = c(8.5, 7.8, 9.2, 8.0, 8.8),
  aprobado = c(TRUE, TRUE, TRUE, TRUE, TRUE)
)

# Ver el data frame
print(estudiantes)
View(estudiantes)  # Abre una vista en RStudio

# Información básica
str(estudiantes)      # Estructura del data frame
summary(estudiantes)  # Resumen estadístico
head(estudiantes, 3)  # Primeras 3 filas
tail(estudiantes, 2)  # Últimas 2 filas
nrow(estudiantes)     # Número de filas: 5
ncol(estudiantes)     # Número de columnas: 5
```

#### Acceder a datos en Data Frames
```r
# Acceder a columnas (tres formas)
estudiantes$edad              # Usando $
estudiantes[["edad"]]         # Usando [[]]
estudiantes[, "edad"]         # Usando [,]

# Acceder a filas y columnas
estudiantes[1, ]              # Primera fila completa
estudiantes[, 2]              # Segunda columna completa
estudiantes[1, 2]             # Fila 1, Columna 2
estudiantes[1:3, c("nombre", "edad")]  # Filas 1-3, columnas específicas
```

#### Filtrar Data Frames
```r
# Filtrar filas que cumplen una condición
mayores_25 <- estudiantes[estudiantes$edad > 25, ]
print(mayores_25)

# Múltiples condiciones (& = AND, | = OR)
buenos_estudiantes <- estudiantes[estudiantes$promedio >= 8.5 & estudiantes$edad < 30, ]
print(buenos_estudiantes)

# Filtrar por categoría
sociologos <- estudiantes[estudiantes$carrera == "Sociología", ]
print(sociologos)
```

#### Agregar y modificar datos
```r
# Agregar una nueva columna
estudiantes$beca <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Modificar valores
estudiantes$promedio[1] <- 9.0  # Cambiar el primer promedio

# Agregar una nueva fila
nuevo_estudiante <- data.frame(
  nombre = "Carlos",
  edad = 26,
  carrera = "Filosofía",
  promedio = 7.5,
  aprobado = TRUE,
  beca = FALSE
)
estudiantes <- rbind(estudiantes, nuevo_estudiante)
```

### 4. Listas

Pueden contener diferentes tipos de objetos, incluso otras listas.
```r
# Crear una lista
mi_lista <- list(
  numeros = c(1, 2, 3, 4, 5),
  texto = "Hola mundo",
  matriz = matrix(1:6, nrow = 2),
  dataframe = estudiantes
)

# Acceder a elementos
mi_lista$numeros          # Usando $
mi_lista[[1]]             # Usando [[]] con índice
mi_lista[["numeros"]]     # Usando [[]] con nombre

# Ver estructura
str(mi_lista)
```

---

## 🔢 Operaciones básicas

### Operadores de comparación
```r
5 == 5    # Igual a: TRUE
5 != 3    # Diferente de: TRUE
5 > 3     # Mayor que: TRUE
5 < 3     # Menor que: FALSE
5 >= 5    # Mayor o igual: TRUE
5 <= 4    # Menor o igual: FALSE
```

### Operadores lógicos
```r
TRUE & TRUE     # AND: TRUE (ambos deben ser TRUE)
TRUE & FALSE    # AND: FALSE
TRUE | FALSE    # OR: TRUE (al menos uno debe ser TRUE)
FALSE | FALSE   # OR: FALSE
!TRUE           # NOT: FALSE (invierte el valor)
!FALSE          # NOT: TRUE
```

### Ejemplo Práctico
```r
edad <- 20
tiene_dni <- TRUE

# ¿Puede votar?
puede_votar <- edad >= 16 & tiene_dni
print(puede_votar)  # TRUE
```

### Funciones matemáticas
```r
abs(-5)              # Valor absoluto: 5
sqrt(16)             # Raíz cuadrada: 4
round(3.14159, 2)    # Redondear a 2 decimales: 3.14
floor(3.7)           # Redondear hacia abajo: 3
ceiling(3.2)         # Redondear hacia arriba: 4
log(10)              # Logaritmo natural
exp(1)               # Exponencial
```

### Funciones estadísticas
```r
numeros <- c(2, 4, 6, 8, 10, 12)

mean(numeros)        # Media: 7
median(numeros)      # Mediana: 7
sd(numeros)          # Desviación estándar: 3.74
var(numeros)         # Varianza: 14
min(numeros)         # Mínimo: 2
max(numeros)         # Máximo: 12
range(numeros)       # Rango: 2 12
sum(numeros)         # Suma: 42
quantile(numeros)    # Cuartiles
```

### Tablas de frecuencia
```r
# Crear datos categóricos
colores <- c(
  rep("rojo", 15),
  rep("azul", 25),
  rep("verde", 10),
  rep("amarillo", 8)
)

# Tabla de frecuencias absolutas
tabla <- table(colores)
print(tabla)

# Frecuencias relativas (proporciones)
prop.table(tabla)

# Porcentajes
prop.table(tabla) * 100

# Ordenar tabla
tabla[order(tabla, decreasing = TRUE)]  # De mayor a menor

# Visualización
barplot(tabla,
        main = "Distribución de Colores",
        xlab = "Color",
        ylab = "Frecuencia",
        col = c("yellow", "blue", "green", "red"))
```

---

## 📂 Importar y exportar datos

### Trabajar con CSV

#### Importar CSV
```r
# Importar archivo CSV
datos <- read.csv("datos.csv")

# Si el archivo usa punto y coma como separador
datos <- read.csv("datos.csv", sep = ";")

# Si la primera fila NO son nombres de columnas
datos <- read.csv("datos.csv", header = FALSE)

# Ver los datos importados
head(datos)
str(datos)
```

#### Exportar CSV
```r
# Crear datos de ejemplo
estudiantes <- data.frame(
  nombre = c("Ana", "Juan", "María"),
  edad = c(23, 25, 30),
  carrera = c("Sociología", "Historia", "Economía")
)

# Exportar a CSV
write.csv(estudiantes, "estudiantes.csv", row.names = FALSE)

# row.names = FALSE evita que se guarde una columna extra con números de fila
```

### Guardar y cargar objetos de R
```r
# Guardar un objeto
save(estudiantes, file = "estudiantes.RData")

# Guardar múltiples objetos
save(estudiantes, mi_matriz, file = "mis_datos.RData")

# Guardar todo el workspace
save.list(ls(), file = "todo.RData")

# Cargar objetos guardados
load("estudiantes.RData")

# Guardar en formato RDS (recomendado para un solo objeto)
saveRDS(estudiantes, "estudiantes.rds")

# Cargar RDS
estudiantes <- readRDS("estudiantes.rds")
```

---

## 📚 Funciones de ayuda
```r
# Ayuda sobre una función específica
?mean
help(mean)

# Buscar por palabra clave
??regression

# Ver ejemplos de uso
example(mean)

# Buscar en toda la documentación
help.search("linear regression")

# Ayuda de un paquete
help(package = "stats")
```

---

## 🎨 Gráficos básicos

### Gráfico de dispersión
```r
# Datos de ejemplo
x <- 1:10
y <- x^2

# Gráfico de dispersión
plot(x, y,
     main = "Mi Primer Gráfico",
     xlab = "Eje X",
     ylab = "Eje Y",
     col = "blue",
     pch = 19)  # pch define el tipo de punto
```

### Histograma
```r
# Datos aleatorios
datos <- rnorm(100, mean = 50, sd = 10)

# Histograma
hist(datos,
     main = "Distribución de Datos",
     xlab = "Valores",
     ylab = "Frecuencia",
     col = "lightblue",
     breaks = 20)  # Número de barras
```

### Gráfico de barras
```r
# Datos categóricos
categorias <- c("A", "B", "C", "D")
valores <- c(23, 45, 12, 67)

# Gráfico de barras
barplot(valores,
        names.arg = categorias,
        main = "Ventas por Categoría",
        xlab = "Categoría",
        ylab = "Ventas",
        col = rainbow(4))
```

### Boxplot (Diagrama de caja)
```r
# Datos de ejemplo
grupo1 <- rnorm(50, mean = 5, sd = 1)
grupo2 <- rnorm(50, mean = 7, sd = 1.5)
grupo3 <- rnorm(50, mean = 6, sd = 2)

# Combinar en data frame
datos <- data.frame(
  valor = c(grupo1, grupo2, grupo3),
  grupo = rep(c("Grupo 1", "Grupo 2", "Grupo 3"), each = 50)
)

# Boxplot
boxplot(valor ~ grupo,
        data = datos,
        main = "Comparación entre Grupos",
        xlab = "Grupo",
        ylab = "Valor",
        col = c("red", "green", "blue"))
```

---

## 💡 Consejos y buenas prácticas

### 1. Organización del código
```r
# ✅ BUENO: Código organizado y comentado
# Cargar datos
datos <- read.csv("datos.csv")

# Limpiar datos
datos_limpios <- datos[!is.na(datos$edad), ]

# Calcular estadísticas
promedio <- mean(datos_limpios$edad)

# ❌ MALO: Todo junto sin comentarios
datos<-read.csv("datos.csv")
datos_limpios<-datos[!is.na(datos$edad),]
promedio<-mean(datos_limpios$edad)
```

### 2. Nombres descriptivos
```r
# ✅ BUENO
edad_promedio <- mean(edades)
estudiantes_aprobados <- estudiantes[estudiantes$promedio >= 6, ]

# ❌ MALO
x <- mean(edades)
df2 <- estudiantes[estudiantes$promedio >= 6, ]
```

### 3. Usar espacios
```r
# ✅ BUENO
resultado <- (a + b) * c

# ❌ MALO
resultado<-(a+b)*c
```

### 4. Guardar trabajo regularmente
```r
# Guarda tu script frecuentemente: Ctrl + S (Windows/Linux) o Cmd + S (Mac)

# Guarda objetos importantes
saveRDS(datos_importantes, "backup.rds")
```

### 5. Verificar datos importados
```r
# Siempre verifica los datos después de importarlos
datos <- read.csv("archivo.csv")

# Verificaciones básicas
head(datos)      # Primeras filas
str(datos)       # Estructura
summary(datos)   # Resumen
dim(datos)       # Dimensiones
```

---

## 🐛 Errores comunes y soluciones

### Error 1: Objeto no encontrado
```r
# ❌ Error
print(edad_promedio)
# Error: object 'edad_promedio' not found

# ✅ Solución: Asegúrate de haber creado el objeto primero
edad_promedio <- mean(c(20, 25, 30))
print(edad_promedio)
```

### Error 2: Archivo no encontrado
```r
# ❌ Error
datos <- read.csv("datos.csv")
# Error: cannot open file 'datos.csv'

# ✅ Solución: Verifica la ruta y el directorio de trabajo
getwd()  # Ver dónde estás
list.files()  # Ver archivos disponibles
# Usa la ruta completa si es necesario
datos <- read.csv("C:/Users/TuUsuario/Documentos/datos.csv")
```

### Error 3: Tipos de datos incompatibles
```r
# ❌ Error
"5" + 3
# Error: non-numeric argument to binary operator

# ✅ Solución: Convierte al tipo correcto
as.numeric("5") + 3  # 8
```

### Error 4: Índice fuera de rango
```r
# ❌ Error
vector <- c(1, 2, 3)
vector[5]  # NA (no hay elemento en posición 5)

# ✅ Solución: Verifica la longitud
length(vector)  # 3
vector[3]  # OK
```

---

## 📦 Paquetes esenciales

R tiene miles de paquetes que extienden su funcionalidad. Aquí algunos esenciales:

### Instalar paquetes
```r
# Instalar un paquete (solo una vez)
install.packages("tidyverse")

# Cargar un paquete (cada vez que inicias R)
library(tidyverse)
```

### Paquetes recomendados para empezar
```r
# Manipulación de datos
install.packages("dplyr")
library(dplyr)

# Visualización de datos
install.packages("ggplot2")
library(ggplot2)

# Importar diferentes formatos
install.packages("readxl")      # Para Excel
install.packages("haven")       # Para SPSS, Stata, SAS
library(readxl)
library(haven)

# El "tidyverse" incluye muchos paquetes útiles
install.packages("tidyverse")
library(tidyverse)
```

### Ejemplo con dplyr
```r
library(dplyr)

# Filtrar y seleccionar
resultado <- estudiantes %>%
  filter(edad > 25) %>%
  select(nombre, edad, promedio)

print(resultado)
```

---

## 🎯 Ejercicios prácticos

### Ejercicio 1: Vectores
```r
# 1. Crea un vector con las edades: 18, 22, 25, 30, 35
# 2. Calcula la edad promedio
# 3. Encuentra la edad máxima y mínima
# 4. Cuenta cuántas personas son mayores de 25

# Solución:
edades <- c(18, 22, 25, 30, 35)
promedio <- mean(edades)
maximo <- max(edades)
minimo <- min(edades)
mayores_25 <- sum(edades > 25)
```

### Ejercicio 2: Data Frame
```r
# Crea un data frame con información de 5 películas:
# - título
# - año
# - duración (minutos)
# - visto (TRUE/FALSE)

# Solución:
peliculas <- data.frame(
  titulo = c("Inception", "Matrix", "Interstellar", "Avatar", "Titanic"),
  año = c(2010, 1999, 2014, 2009, 1997),
  duracion = c(148, 136, 169, 162, 195),
  visto = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

# Filtra las películas que has visto
vistas <- peliculas[peliculas$visto == TRUE, ]

# Filtra películas de más de 150 minutos
largas <- peliculas[peliculas$duracion > 150, ]
```

### Ejercicio 3: Análisis de datos
```r
# Crea un vector con 20 notas aleatorias entre 0 y 10
notas <- runif(20, min = 0, max = 10)

# Calcula:
# 1. Promedio
# 2. Cuántos aprobaron (nota >= 6)
# 3. Porcentaje de aprobados

# Solución:
promedio <- mean(notas)
aprobados <- sum(notas >= 6)
porcentaje_aprobados <- (aprobados / length(notas)) * 100

# Visualiza con un histograma
hist(notas,
     main = "Distribución de Notas",
     xlab = "Nota",
     ylab = "Frecuencia",
     col = "lightblue")
abline(v = 6, col = "red", lwd = 2, lty = 2)  # Línea en nota 6
```

---

## 📖 Recursos adicionales

### Documentación oficial
- [The R Project](https://www.r-project.org/)
- [RStudio Education](https://education.rstudio.com/)
- [CRAN](https://cran.r-project.org/)

### Tutoriales interactivos
- [swirl](https://swirlstats.com/) - Aprende R dentro de R
```r
install.packages("swirl")
library(swirl)
swirl()
```

### Libros gratuitos
- [R for Data Science](https://r4ds.had.co.nz/)
- [R Para Ciencia de Datos](https://es.r4ds.hadley.nz/)
- [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)
- [Introducción a R](https://cran.r-project.org/doc/contrib/R-intro-1.1.0-espanol.1.pdf)
- [Manuel de R](https://fhernanb.github.io/Manual-de-R/)

### Comunidad
- [RStudio Community](https://community.rstudio.com/)
- [Comunidad R-Hispano](https://r-es.org/)
- [Stack Overflow - R](https://stackoverflow.com/questions/tagged/r)
- [R-bloggers](https://www.r-bloggers.com/)
- [R-Ladies](https://rladies.org/)
- [RPub](https://rpubs.com/)

### Cheat Sheets (Hojas de referencia)
- [RStudio Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/)

### Manual y Glosario
- [Manual](https://github.com/agusnieto77/Curso_R_IIDyPCA_2025/blob/main/MANUAL.md)
- [Glosario](https://github.com/agusnieto77/Curso_R_IIDyPCA_2025/blob/main/GLOSARIO.md)

### Tutoriales
- [R para dummies](https://www.youtube.com/watch?v=txr53VqSGoM)
- [R en 90 minutos](https://www.youtube.com/watch?v=WCcHcWsMN1o)
- [R en 2 minutos](https://www.youtube.com/watch?v=7RkkE35ZMnE)
- [R para muy principiantes](https://www.youtube.com/@rparamuyprincipiantes8278/videos)

### R vs Python
- [R vs Python 💥 ¿Cuál es mejor?](https://www.youtube.com/watch?v=i9mPOvT0X6M)
---

## 📝 Notas finales

### Lo más importante para recordar

1. **Practica regularmente**: La programación se aprende haciendo
2. **No te frustres**: Los errores son parte del aprendizaje
3. **Documenta tu código**: Los comentarios son tus amigues
4. **Usa nombres descriptivos**: Tu "yo" del futuro te lo agradecerá
5. **Guarda frecuentemente**: `Ctrl + S` / `Cmd + S` es tu mejor amige

### Próximos pasos

Una vez que domines estos conceptos básicos, puedes avanzar a:

- Control de flujo (`if`, `for`, `while`)
- Crear tus propias funciones
- Paquetes avanzados (`caret`, `tidymodels`, `shiny`)
- Análisis estadístico
- Machine Learning

---

## 📄 Licencia

Este material es de uso libre para fines educativos.

---

**¡Feliz programación en R! 🎉**