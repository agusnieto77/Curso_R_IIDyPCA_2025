# Curso Introductorio a R (IIDyPCA)

Este repositorio reúne los materiales del curso introductorio a R.
A continuación se resumen los contenidos y actividades sugeridas para cada día.

## Día 1 - Primeros pasos con R y RStudio

**Objetivos**
- Comprender la lógica de proyectos en RStudio.
- Importar datos en formato CSV con `readr`.
- Explorar data frames con `glimpse()`, `summary()` y `head()`.

**Funciones clave**: `getwd()`, `read_csv()`, `glimpse()`, `summary()`, `select()`, `write_csv()`.

**Ejercicio 1**
1. Crear un nuevo proyecto RStudio apuntando a la carpeta del curso.
2. Abrir `scripts/script_01_intro_import.R` y ejecutar los bloques uno por uno.
3. Importar `datos/dataset_limpio.csv` y responder:
   - ¿Cuántas personas hay en el dataset?
   - ¿Cuál es el ingreso promedio?
4. Guardar una versión reducida con las columnas `id`, `sexo`, `edad` e `ingreso`.
