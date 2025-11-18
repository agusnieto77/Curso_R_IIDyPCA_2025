# Cuadernillo de actividades - Curso Introducción práctica a R (IIDyPCA)

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
5. Escribir un breve párrafo en el bloc de notas del proyecto con las conclusiones iniciales.

## Día 2 - Limpieza y transformación de datos

1. Explorar `datos/dataset_sucio.csv` y describir los principales problemas.
2. Reproducir el flujo de `script_02A_limpieza_paso_a_paso.R` y anotar qué hace cada bloque.
3. Ejecutar `script_02B_limpieza_final.R` y comparar el resultado con el del paso a paso.
4. Completar el entregable definido en `ejercicios/ejercicio_limpieza_dataset_sucio.md`.

## Día 3 - Descriptiva, visualización y ventanas avanzadas

1. Con `scripts/script_03_descriptiva_ggplot.R` replicar los gráficos propuestos.
2. Utilizar `datos/dataset_intermedio.csv` para practicar imputación sencilla y creación de factores ordenados.
3. Cargar `datos/dataset_geoespacial.csv` y crear un mapa rápido con `ggplot2::geom_point()` sobre un `map_data("world")`.
4. Revisar los demos avanzados (`run_all.R`, `geocodificacion_tidygeocoder.R`, `ner_spacyr.R`, `dashboard/app.R` e informes Quarto) para preparar el cierre del curso.
