# Material de dictado

Los fuentes de las presentaciones de la capacitación. **Estos archivos son la fuente
de verdad**: los PDF se generan a partir de acá, no al revés.

| archivo | contenido | duración |
|---|---|---|
| `clase_1_fundamentos_y_gitflow.html` | Bloques 1–3 + ejercicios 1, 2 y 3 | 2 hs |
| `clase_2_colaboracion_cicd_y_bi.html` | Repaso + bloques 4–6 + ejercicios 4 y 5 | 2 hs |

Existe además una versión de **clase única** de 3,5 hs con el mismo contenido sin
dividir. Su fuente se perdió y sólo quedó el PDF; estas dos clases se reconstruyeron
a partir de él. Ese es justamente el problema que este repositorio enseña a evitar —
por eso los fuentes viven acá y no sueltos en una carpeta.

## Generar los PDF

Cada `.html` es un documento autocontenido: no tiene dependencias externas, todo el
CSS va embebido. Una página del HTML es una página del PDF.

```sh
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="clase_1_fundamentos_y_gitflow.pdf" \
  "file://$PWD/clase_1_fundamentos_y_gitflow.html"
```

En Linux o CI, reemplazar la ruta por `google-chrome` o `chromium`.

> `--no-pdf-header-footer` es necesario: sin esa opción Chrome imprime la URL del
> archivo y la fecha en los márgenes.

## Si hay que editar

Cada diapositiva es un `<div class="slide">`. Los colores, tipografías y espaciados
salen de las variables CSS declaradas en `:root` al principio del archivo — conviene
tocar ahí y no valores sueltos, para que las dos clases no se desincronicen.

El diagrama de GitFlow de la clase 1 es un SVG inline, sin imágenes externas.
