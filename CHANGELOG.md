# Changelog

## [1.2.0] — las clases en el brand kit de Taligent

### Cambiado
- Las dos clases se rehicieron con el brand kit de Taligent (estilo "Agentic Dark"):
  1920×1080 apaisado, fondo oscuro, Space Grotesk / IBM Plex. Antes eran documentos
  Letter verticales. **El contenido se portó tal cual** — cambió el formato, no el
  texto.
- El material para dictar pasa a ser un `.preview.html`: se abre en cualquier
  navegador, ocupa la pantalla completa y se navega por teclado. Para compartir
  pantalla es mejor que un PDF, que arrastra la interfaz del visor.
- Los fuentes ahora son `clase_N_*.dc.html`, un archivo por clase con los estilos
  inline. El `.preview.html` se genera desde ahí con `build_preview.py`, que vive
  en el brand kit.
- El diagrama de GitFlow de la clase 1 se readaptó a la paleta oscura. La original
  usaba verde, azul, violeta y rojo, y el brand kit no tiene ni azul ni violeta:
  quedó `main` verde, `develop` blanco cálido, `feature` naranja, `release` oro y
  `hotfix` rojo. Los colores significan lo mismo en las dos clases.

### Agregado
- `scripts/build_pdf.py`, que apila las diapositivas una por página para imprimir
  en 16:9. El `.preview.html` no sirve para eso porque muestra una por vez.

### Eliminado
- Los fuentes HTML del formato anterior. Las URLs de GitHub Pages que terminaban en
  `clases/clase_1_fundamentos_y_gitflow.html` y `clases/clase_2_colaboracion_cicd_y_bi.html`
  dejan de existir; las nuevas son las mismas con `.preview.html` al final.
- Los PDF dejaron de versionarse: son artefactos derivados y ahora están en
  `.gitignore`. Se regeneran con `scripts/build_pdf.py`.

## [1.1.1] — corrección del ejercicio 2 y publicación web

### Corregido
- El ejercicio 2 de la clase 1 describía el grafo del repositorio como estaba al
  escribir el material: *"tres features, una versión publicada y un hotfix"*.
  Después entraron el material de dictado y la release 1.1.0, así que ya no
  coincidía con lo que ve quien corre `git log --oneline --graph --all`.
  Ahora describe el grafo real y, de paso, convierte el ejercicio en una
  verificación de la regla de los dos merges.

### Agregado
- `docs/.nojekyll`, para que GitHub Pages sirva los HTML de las clases tal cual,
  sin procesarlos con Jekyll.

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
