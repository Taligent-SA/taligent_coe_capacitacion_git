# Changelog

## [1.1.0] — material de dictado

### Agregado
- Fuentes HTML de la capacitación dividida en **dos clases de 2 hs**
  (`docs/clases/`), que complementan la versión de clase única de 3,5 hs.
- Guía del facilitador (`docs/GUIA_FACILITADOR.md`).
- Guía de ejercicios del taller (`docs/EJERCICIOS.md`).
- Explicación del modelo de ramas y por qué existe cada una (`docs/GITFLOW.md`).

### Cambiado
- El quality gate se puede ejecutar manualmente, sin esperar a un Pull Request.

### Corregido
- El chequeo de encabezado de metadatos no se aplicaba en Linux. `grep` en macOS
  acepta un patrón que empieza con `--`; el de Linux lo interpreta como fin de
  opciones, así que la verificación pasaba siempre sin mirar nada.

## [1.0.1] — corrección en producción

### Corregido
- División por cero en `margen_bruto` cuando no hay ventas en el período.

## [1.0.0] — primera versión publicada

### Agregado
- Métrica de facturación mensual por unidad de negocio.
- Métrica de ticket promedio.
- Métrica de margen bruto.
- Quality gate automático en cada Pull Request.
