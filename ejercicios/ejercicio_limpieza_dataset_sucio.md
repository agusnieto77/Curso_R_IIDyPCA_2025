# Ejercicio de entrega - Limpieza de datos

**Objetivo:** construir un script reproducible que tome `datos/dataset_sucio.csv`, lo limpie siguiendo los lineamientos del Día 2 y genere un archivo `datos_limpios_entrega.csv`.

## Pasos sugeridos
1. Crear un script llamado `script_limpieza_APELLIDO.R` (reemplazar con tu apellido).
2. Importar el dataset sucio y hacer un `glimpse()` inicial.
3. Normalizar las columnas:
   - `edad`: eliminar texto, convertir a numérico, manejar valores faltantes.
   - `sexo`: homogenizar a `M`/`F`.
   - `ingreso_mensual`: quitar símbolos, puntos y comas, convertir a numérico.
   - `fecha_registro`: parsear en formato fecha.
   - `educacion_max`: clasificar en Secundario, Universitario, Posgrado u Otro.
4. Guardar el resultado como `datos_limpios_entrega.csv` (mismas columnas que el script docente).
5. Incluir al final un bloque `sessionInfo()` para chequear versiones.

## Criterios de evaluación
- Código comentado y ordenado.
- Uso apropiado de `dplyr` y `stringr`.
- Reproducibilidad (el script corre sin intervenir manualmente).
- Entrega a tiempo a través del campus.
