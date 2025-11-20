# Curso Introductorio a R (IIDyPCA)

Este repositorio reúne los materiales del curso introductorio a R.
A continuación se resumen los contenidos y actividades sugeridas para cada día.

## Manual, Glosario y Bibliografia académica
- [Manual](https://github.com/agusnieto77/Curso_R_IIDyPCA_2025/blob/main/MANUAL.md)
- [Glosario](https://github.com/agusnieto77/Curso_R_IIDyPCA_2025/blob/main/GLOSARIO.md)
- [Bibliografia académica](https://github.com/agusnieto77/Curso_R_IIDyPCA_2025/blob/main/BIBLIOGRAFIA.md)

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

### [Hojas de trucos](https://github.com/agusnieto77/TalleR/raw/main/recursos/chuletas_es_r.pdf)

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

# Bibliografía recomendada

## Bibliografía sobre distintos tópicos de programación con R

-   [Chian: Data Science con R: Fundamentos y
    Aplicaciones](https://bookdown.org/BEST/DSFA/)

-   [Gil Bellosta: R para profesionales de los datos: una
    introducción](https://www.datanalytics.com/libro_r/index.html)

-   [Grolemund & Wickham: R para Ciencia de
    Datos](https://es.r4ds.hadley.nz/index.html)

-   [Hyndman & Athanasopoulos: Forecasting: Principles and
    Practice](https://otexts.com/fpp3/)

-   [Lee: Curso de formación en
    R](http://idaejin.github.io/courses/R/2019/euskaltel/)

-   [McNulty: Tidy web scraping in R — Tutorial and
    resources](https://towardsdatascience.com/tidy-web-scraping-in-r-tutorial-and-resources-ac9f72b4fe47)

-   [Mendoza Vega: Introducción a la mineria de textos con
    R](https://rpubs.com/jboscomendoza/mineria-de-textos-con-r)

-   [Mendoza Vega: Webscrapping, APIs y minería de texto con
    R](https://medium.com/@jboscomendoza/webscrapping-apis-y-miner%C3%ADa-de-texto-con-r-an%C3%A1lisis-de-sentimientos-de-coheed-and-cambria-d0f24804da1d)

-   [Mislej: Visualización de datos en
    R](http://www.fundacionsadosky.org.ar/pcd-salud/dataviz.pdf)

-   [Montane: Ciencia de datos para
    curiosos](https://martinmontane.github.io/CienciaDeDatosBook/index.html)

-   [Quanteda: Guía de Inicio
    Rápido](https://quanteda.io/articles/pkgdown/quickstart_es.html)

-   [Rodríguez: Clasificación de documentos de texto con
    R](http://sigma.iimas.unam.mx/carloserwin/clasificacion.html)

-   [Rosati: La visualización de datos es trabajo
    esencial](https://medium.com/factor-data/la-visualizaci%C3%B3n-de-datos-es-trabajo-esencial-ea7acc20b5d3)

-   [Ruiz: Usando R para la Ciencia de
    Datos](https://rstudio.com/resources/webinars/usando-r-para-la-ciencia-de-datos/)

-   [Urdinez & Cruz Labrín: AnalizaR Datos
    Políticos](https://arcruz0.github.io/libroadp/index.html)

## Bibliografía sobre Web Scraping con R

-   [Bradley & James: Web Scraping Using
    R](https://journals.sagepub.com/doi/full/10.1177/2515245919859535) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/WebScraping0.pdf)

-   [Doguku & Çetinkaya-Rundel: Web Scraping in the Statistics and Data
    Science Curriculum: Challenges and
    Opportunities](https://www.tandfonline.com/doi/full/10.1080/10691898.2020.1787116) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/WebScraping2.pdf)

-   [Khalil & Fakir: RCrawler: An R package for parallel web crawling
    and
    scraping](https://www.sciencedirect.com/science/article/pii/S2352711017300110) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/RCrawler.pdf)

-   [Krotov & Tennyson: Web Scraping in the R Language: A
    Tutorial](https://aisel.aisnet.org/jmwais/vol2021/iss1/5/) - [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/WebScraping5.pdf)

-   [Munzert: Automated Data Collection with R: a practical guide to web
    scraping and text
    mining](https://www.tandfonline.com/doi/full/10.1080/10691898.2020.1787116) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/WebScraping3.pdf)

-   [Pittard: Web Scraping with
    R](https://steviep42.github.io/webscraping/book/)

-   [Thota & Elmasri:
    NLP-Suite](https://dl.acm.org/doi/fullHtml/10.1145/3453892.3461333) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/WebScraping1.pdf)

## Bibliografía sobre ciencias sociales computacionales para el análisis de la conflictividad

-   [Albrieu & Palazzo: Categorización de conflictos sociales en el
    ámbito de los recursos naturales: un estudio de las actividades
    extractivas mediante la minería de
    textos](https://www.cepal.org/es/publicaciones/45952-categorizacion-conflictos-sociales-ambito-recursos-naturales-un-estudio) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/Palazzo2.pdf)

-   [Deutschmann et.al: Computational Conflict
    Research](https://link.springer.com/book/10.1007/978-3-030-29333-8) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/Deutschmann.pdf)

-   [Franzosi:
    NLP-Suite](https://github.com/NLP-Suite/NLP-Suite/wiki/About)

-   [Franzosi: What’s in a text? Bridging the gap between quality and
    quantity in the digital
    era](https://link.springer.com/article/10.1007/s11135-020-01067-6) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/Franzosi.pdf)

-   [Ghai: Finding the needle in the haystack: Fine-tuning transformers
    to classify protest events in a sea ofnews articles, with Bayesian
    uncertainty measures
    era](https://github.com/chrisghai/protest-event-detection) - [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/chris_ghai_thesis.pdf)

-   [Nardulli et.al: Graphing the grammar of motives in National
    Security Strategies: Cultural interpretation, automated text
    analysis and the drama of global
    politics](https://doi.org/10.1177/0081175015581378) - [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/nardulli2015.pdf)

-   [Mhor et.al: A Progressive Supervised-learning Approach to
    Generating Rich Civil Strife
    Data](https://doi.org/10.1016/j.poetic.2013.08.003) - [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/mhor2013.pdf)

-   [Olsson et.al: Text Categorization for Conflict Event
    Annotation](https://aclanthology.org/2020.aespen-1.5/) - [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/2020.aespen-1.5.pdf)

-   [Palazzo: Midiendo los costos sociales de la abundancia en Recursos
    Naturales: Una nueva herramienta
    estadística](https://www.redsudamericana.org/recursos-naturales-desarrollo/midiendo-los-costos-sociales-de-la-abundancia-en-recursos-naturales) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/Palazzo1.pdf)

-   [Steinert-Threlkeld & Joo: Protest Event Data from Geolocated Social
    Media
    Content](https://preprints.apsanet.org/engage/apsa/article-details/5f594a6b1d75ae001b0fab90) -
    [en
    PDF](https://estudiosmaritimossociales.org/Data_TalleR/protest-event-data-from-geolocated-social-media-content.pdf)

    ## Videos Clases

    [**Clase 1**](https://youtu.be/05EFYtArkQs)