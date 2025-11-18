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

## Recursos

Una ventaja importante de R es su comunidad. Cualquier problema que
enfrentemos ante nuestra pantalla seguro ya fue consultado y solucionado
en [Stack Overflow](https://es.stackoverflow.com/).

### [Hojas de trucos](https://github.com/agusnieto77/TalleR/tree/main/recursos/chuletas_es_r.pdf)

Es útil para darnos una idea sobre las funciones de los principales
paquetes de tidyverse. Sabremos qué hacen y como aplicarlo.

### Aquí van a encontrar algunos recursos muy útiles para realizar minería de texto en R o cualquier otro lenguaje de programación

Un recurso imprescindible para trabajar con cadenas de caracteres son
las llamadas expresiones regulares. “Las expresiones regulares son
patrones utilizados para encontrar una determinada combinación de
caracteres dentro de una cadena de texto. Las expresiones regulares
proporcionan una manera muy flexible de buscar o reconocer cadenas de
texto”
([Wikipedia](https://es.wikipedia.org/wiki/Expresi%C3%B3n_regular)).

#### Hoja de trucos para RegEx en R con las funciones del paquete stringr de tidyverse

![](https://estudiosmaritimossociales.org/Data_TalleR/regex.png)

Para practicar un poco:

-   [regexr](https://regexr.com/)
-   [regex 101](https://regex101.com/)
-   [regex con
    R (1)](https://rpubs.com/ydmarinb/429756#:~:text=Que%20son%20las%20expresiones%20regulares,caracteres%20u%20operaciones%20de%20sustituciones.)
-   [regex con
    R (2)](http://griverorz.net/big-data/06-text-analysis/01-intro-regex.nb.html)
-   [regex con
    R (3)](https://www.diegocalvo.es/expresiones-regulares-en-r/)

## Otro recurso es el referido a las abreviaturas del etiquetado POS (Parts Of Speech)

-   [Sobre los
    ‘upos’](https://universaldependencies.org/u/pos/index.html)
-   [Sobre los ‘feats’](https://universaldependencies.org/docs/sl/feat/)
-   [Sobre los ‘dep\_rel’](https://universaldependencies.org/u/dep/)