# ==============================================================================
# Script: Introducción a R - Conceptos Básicos
# ==============================================================================
# Descripción: Este script introduce los conceptos fundamentales de R para
#              estudiantes que están comenzando con programación y análisis
#              de datos en ciencias sociales y humanidades.
# Fecha: 2025-11-20
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. PRIMEROS PASOS: COMENTARIOS Y SINTAXIS BÁSICA
# ------------------------------------------------------------------------------

# Los comentarios en R comienzan con el símbolo '#'
# R ignora todo lo que está después de '#' en una línea
# Los comentarios son fundamentales para documentar tu código

# R es SENSIBLE A MAYÚSCULAS Y MINÚSCULAS
# Esto significa que 'Variable' y 'variable' son diferentes

Variable <- "Hola"
variable <- "mundo"

print(Variable)  # Imprime "Hola"
print(variable)  # Imprime "mundo"

# Los espacios en blanco NO afectan el funcionamiento del código
# Pero sí mejoran la legibilidad (usa espacios consistentemente)

x<-5      # Funciona pero es difícil de leer
x <- 5    # Recomendado: más legible
x  <-  5  # También funciona pero tiene espacios innecesarios

# ------------------------------------------------------------------------------
# 2. OPERADORES DE ASIGNACIÓN
# ------------------------------------------------------------------------------

# En R hay dos formas principales de asignar valores a objetos:
# <- (flecha) es la forma tradicional y recomendada
# = (igual) también funciona pero es menos común

edad <- 25        # Recomendado
edad = 25         # Funciona pero menos usado

# La flecha puede ir en ambas direcciones (pero <- es lo estándar)
30 -> edad_nueva  # Poco común pero válido

# ------------------------------------------------------------------------------
# 3. TIPOS DE DATOS BÁSICOS
# ------------------------------------------------------------------------------

# R tiene 6 tipos de datos atómicos (básicos):

# LOGICAL (lógico): TRUE o FALSE
es_estudiante <- TRUE
tiene_titulo <- FALSE

# NUMERIC (numérico): números con decimales
altura <- 1.75
temperatura <- 36.5

# INTEGER (entero): números sin decimales
# Se indica con 'L' al final
edad <- 25L
cantidad_hermanos <- 3L

# CHARACTER (texto/cadena): entre comillas
nombre <- "María"
ciudad <- 'Buenos Aires'  # Comillas simples o dobles funcionan igual

# COMPLEX (complejo): números complejos (raramente usado)
numero_complejo <- 3 + 2i

# RAW (crudo): bytes en bruto (raramente usado en ciencias sociales)

# Para verificar el tipo de dato usamos class() o typeof()
class(es_estudiante)    # "logical"
class(altura)           # "numeric"
class(edad)             # "integer"
class(nombre)           # "character"

# ------------------------------------------------------------------------------
# 4. ESTRUCTURAS DE DATOS: VECTORES
# ------------------------------------------------------------------------------

# Un VECTOR es la estructura más básica en R
# Contiene elementos del MISMO tipo

# Crear vectores con c() (combinar/concatenar)
edades <- c(23, 25, 30, 28, 22)
nombres <- c("Ana", "Juan", "María", "Pedro", "Laura")
aprobados <- c(TRUE, TRUE, FALSE, TRUE, TRUE)

# Ver el contenido
print(edades)
print(nombres)

# Operaciones con vectores numéricos
edades + 5           # Suma 5 a cada elemento
edades * 2           # Multiplica cada elemento por 2
mean(edades)         # Promedio
sum(edades)          # Suma total
length(edades)       # Cantidad de elementos

# Acceder a elementos individuales usando [ ]
# IMPORTANTE: R comienza a contar desde 1 (no desde 0)
primer_nombre <- nombres[1]      # "Ana"
tercera_edad <- edades[3]        # 30

# Acceder a múltiples elementos
primeros_tres <- nombres[1:3]    # Elementos 1, 2 y 3
algunos <- nombres[c(1, 3, 5)]   # Elementos 1, 3 y 5

# Crear secuencias de números
uno_al_diez <- 1:10              # Secuencia de 1 a 10
uno_al_diez_par <- seq(2, 10, by = 2)  # Números pares del 2 al 10

# Repetir valores
tres_doses <- rep(2, 3)          # c(2, 2, 2)
patron <- rep(c("A", "B"), 4)    # c("A", "B", "A", "B", "A", "B", "A", "B")

# ------------------------------------------------------------------------------
# 5. ESTRUCTURAS DE DATOS: MATRICES
# ------------------------------------------------------------------------------

# Una MATRIZ es un arreglo bidimensional (filas y columnas)
# Todos los elementos deben ser del mismo tipo

# Crear una matriz
matriz_numeros <- matrix(
  data = 1:12,      # Los datos a incluir
  nrow = 3,         # Número de filas
  ncol = 4          # Número de columnas
)

print(matriz_numeros)

# Acceder a elementos: matriz[fila, columna]
elemento <- matriz_numeros[2, 3]    # Elemento en fila 2, columna 3
fila_completa <- matriz_numeros[1, ]     # Toda la fila 1
columna_completa <- matriz_numeros[, 2]  # Toda la columna 2

# Dimensiones de la matriz
dim(matriz_numeros)     # Devuelve c(filas, columnas)
nrow(matriz_numeros)    # Número de filas
ncol(matriz_numeros)    # Número de columnas

# ------------------------------------------------------------------------------
# 6. ESTRUCTURAS DE DATOS: DATA FRAMES
# ------------------------------------------------------------------------------

# Un DATA FRAME es como una tabla o planilla de Excel
# Puede contener diferentes tipos de datos en cada columna
# Es la estructura MÁS IMPORTANTE para análisis de datos

# Crear un data frame
estudiantes <- data.frame(
  nombre = c("Ana", "Juan", "María", "Pedro", "Laura"),
  edad = c(23, 25, 30, 28, 22),
  carrera = c("Sociología", "Historia", "Economía", "Sociología", "Psicología"),
  promedio = c(8.5, 7.8, 9.2, 8.0, 8.8),
  aprobado = c(TRUE, TRUE, TRUE, TRUE, TRUE)
)

# Ver el data frame completo
print(estudiantes)

# Ver las primeras filas
head(estudiantes, 3)  # Primeras 3 filas

# Ver las últimas filas
tail(estudiantes, 2)  # Últimas 2 filas

# Estructura del data frame
str(estudiantes)  # Muestra tipo de cada columna

# Resumen estadístico
summary(estudiantes)  # Estadísticas para cada columna

# Acceder a columnas (tres formas equivalentes)
estudiantes$edad           # Usando $
estudiantes[["edad"]]      # Usando [[ ]]
estudiantes[, "edad"]      # Usando [, ]

# Acceder a filas y columnas específicas
estudiantes[1, ]           # Primera fila completa
estudiantes[, 2]           # Segunda columna completa
estudiantes[1, 2]          # Elemento en fila 1, columna 2
estudiantes[1:3, c("nombre", "edad")]  # Filas 1-3, columnas nombre y edad

# Filtrar datos (filas que cumplen una condición)
mayores_25 <- estudiantes[estudiantes$edad > 25, ]
sociologos <- estudiantes[estudiantes$carrera == "Sociología", ]

# ------------------------------------------------------------------------------
# 7. ESTRUCTURAS DE DATOS: LISTAS
# ------------------------------------------------------------------------------

# Una LISTA puede contener diferentes tipos de objetos
# Incluso puede contener otras listas

# Crear una lista
mi_lista <- list(
  numeros = c(1, 2, 3, 4, 5),
  texto = "Hola mundo",
  logico = TRUE,
  matriz = matrix(1:4, nrow = 2),
  dataframe = estudiantes
)

# Ver la estructura
str(mi_lista)

# Acceder a elementos de la lista
mi_lista$numeros           # Usando $
mi_lista[[1]]              # Usando [[ ]] con índice
mi_lista[["numeros"]]      # Usando [[ ]] con nombre

# ------------------------------------------------------------------------------
# 8. OPERADORES LÓGICOS Y DE COMPARACIÓN
# ------------------------------------------------------------------------------

# Operadores de comparación
5 == 5    # Igual a (TRUE)
5 != 3    # Diferente de (TRUE)
5 > 3     # Mayor que (TRUE)
5 < 3     # Menor que (FALSE)
5 >= 5    # Mayor o igual que (TRUE)
5 <= 4    # Menor o igual que (FALSE)

# Operadores lógicos
TRUE & TRUE    # AND (Y): ambos deben ser TRUE
TRUE | FALSE   # OR (O): al menos uno debe ser TRUE
!TRUE          # NOT (NO): invierte el valor lógico

# Ejemplos prácticos
edad <- 20
es_adulto <- edad >= 18        # TRUE
es_menor <- edad < 18          # FALSE

nota <- 7
aprueba <- nota >= 6           # TRUE
nota_alta <- nota >= 8         # FALSE
aprueba_bajo <- aprueba & !nota_alta  # TRUE (aprueba pero no con nota alta)

# ------------------------------------------------------------------------------
# 9. FUNCIONES BÁSICAS ÚTILES
# ------------------------------------------------------------------------------

# Directorio de trabajo
getwd()                    # ¿Dónde estoy trabajando?
# setwd("ruta/al/directorio")  # Cambiar directorio (descomentado cuando necesites)

# Listar archivos y directorios
list.files()              # Archivos en el directorio actual
list.dirs()               # Subdirectorios

# Funciones matemáticas básicas
abs(-5)                   # Valor absoluto: 5
sqrt(16)                  # Raíz cuadrada: 4
round(3.14159, 2)         # Redondear a 2 decimales: 3.14
floor(3.7)                # Redondear hacia abajo: 3
ceiling(3.2)              # Redondear hacia arriba: 4

# Funciones estadísticas
numeros <- c(2, 4, 6, 8, 10, 12)
mean(numeros)             # Media/promedio
median(numeros)           # Mediana
sd(numeros)               # Desviación estándar
var(numeros)              # Varianza
min(numeros)              # Mínimo
max(numeros)              # Máximo
range(numeros)            # Rango (min y max)
quantile(numeros)         # Cuartiles

# ------------------------------------------------------------------------------
# 10. TRABAJAR CON TABLAS DE FRECUENCIA
# ------------------------------------------------------------------------------

# Crear datos categóricos
colores <- c(
  rep("rojo", 15),
  rep("azul", 25),
  rep("verde", 10),
  rep("amarillo", 8)
)

# Tabla de frecuencias
tabla_colores <- table(colores)
print(tabla_colores)

# Ordenar tabla
tabla_ordenada_asc <- tabla_colores[order(tabla_colores)]         # Ascendente
tabla_ordenada_desc <- tabla_colores[order(tabla_colores, decreasing = TRUE)]  # Descendente

# Proporciones (frecuencias relativas)
prop.table(tabla_colores)     # Proporciones
prop.table(tabla_colores) * 100  # Porcentajes

# Visualización básica
barplot(tabla_colores,
        main = "Distribución de Colores",
        xlab = "Color",
        ylab = "Frecuencia",
        col = c("yellow", "blue", "green", "red"))

# ------------------------------------------------------------------------------
# 11. VALORES ESPECIALES EN R
# ------------------------------------------------------------------------------

# NA: Not Available (dato faltante)
edades_con_na <- c(23, 25, NA, 28, 22)
mean(edades_con_na)              # Devuelve NA
mean(edades_con_na, na.rm = TRUE)  # Calcula ignorando NAs

# NULL: objeto vacío o inexistente
objeto_vacio <- NULL
is.null(objeto_vacio)            # TRUE

# NaN: Not a Number (resultado de operación inválida)
resultado_invalido <- 0/0        # NaN
sqrt(-1)                         # NaN (en números reales)

# Inf: Infinito
infinito <- 1/0                  # Inf
menos_infinito <- -1/0           # -Inf

# Verificar valores especiales
is.na(NA)                        # TRUE
is.null(NULL)                    # TRUE
is.nan(NaN)                      # TRUE
is.infinite(Inf)                 # TRUE

# ------------------------------------------------------------------------------
# 12. FUNCIONES DE AYUDA
# ------------------------------------------------------------------------------

# Obtener ayuda sobre una función
?mean                # Abre documentación de la función mean
help(mean)           # Equivalente a ?mean

# Buscar ayuda por palabra clave
??regression         # Busca "regression" en toda la documentación

# Ver ejemplos de uso
example(mean)        # Ejecuta ejemplos de la función mean

# Buscar funciones en un paquete
help(package = "stats")  # Ayuda del paquete stats

# ------------------------------------------------------------------------------
# 13. OPERACIONES CON CADENAS DE TEXTO
# ------------------------------------------------------------------------------

# Concatenar texto
paste("Hola", "mundo")                    # "Hola mundo" (con espacio)
paste0("Hola", "mundo")                   # "Holamundo" (sin espacio)
paste("Hola", "mundo", sep = "-")         # "Hola-mundo" (separador custom)

# Longitud del texto
nchar("Hola mundo")                       # 10 caracteres

# Convertir a mayúsculas/minúsculas
toupper("hola mundo")                     # "HOLA MUNDO"
tolower("HOLA MUNDO")                     # "hola mundo"

# Extraer parte de un texto
substr("Hola mundo", start = 1, stop = 4) # "Hola"

# ------------------------------------------------------------------------------
# 14. EJERCICIOS PRÁCTICOS RECOMENDADOS
# ------------------------------------------------------------------------------

# EJERCICIO 1: Crea un vector con las edades de 5 personas y calcula:
# - La edad promedio
# - La edad máxima y mínima
# - Cuántas personas son mayores de 25 años

# EJERCICIO 2: Crea un data frame con información de 4 libros:
# - Título
# - Autor
# - Año de publicación
# - Número de páginas
# - ¿Leído? (TRUE/FALSE)

# EJERCICIO 3: Filtra el data frame anterior para mostrar solo:
# - Libros leídos
# - Libros con más de 300 páginas
# - Libros publicados después del año 2000

# EJERCICIO 4: Crea una tabla de frecuencias con datos categóricos
# y visualízala con un gráfico de barras

# ==============================================================================
# NOTAS FINALES
# ==============================================================================
# 
# Conceptos clave para recordar:
# 1. R es sensible a mayúsculas/minúsculas
# 2. Los vectores contienen elementos del mismo tipo
# 3. Los data frames son como tablas y pueden tener diferentes tipos de datos
# 4. Usa <- para asignar valores
# 5. R cuenta desde 1 (no desde 0)
# 6. Los comentarios (#) son fundamentales para documentar
# 7. Practica regularmente para interiorizar estos conceptos
#
# Próximos pasos:
# - Aprender sobre control de flujo (if, for, while)
# - Instalar y usar paquetes (tidyverse, ggplot2)
# - Importar y exportar datos
# - Crear funciones personalizadas
# ==============================================================================