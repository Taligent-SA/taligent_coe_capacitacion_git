# Material de dictado

Los fuentes de las presentaciones de la capacitación. **Estos archivos son la fuente
de verdad**: el visor y los PDF se generan a partir de acá, no al revés.

Las dos clases están en el brand kit de Taligent (estilo "Agentic Dark", 1920×1080).

| archivo | contenido | duración |
|---|---|---|
| `clase_1_fundamentos_y_gitflow.dc.html` | Bloques 1–3 + ejercicios 1, 2 y 3 | 2 hs |
| `clase_2_colaboracion_cicd_y_bi.dc.html` | Repaso + bloques 4–6 + ejercicios 4 y 5 | 2 hs |

Existe además una versión de **clase única** de 3,5 hs con el mismo contenido sin
dividir. Su fuente se perdió y sólo quedó el PDF; estas dos clases se reconstruyeron
a partir de él. Ese es justamente el problema que este repositorio enseña a evitar —
por eso los fuentes viven acá y no sueltos en una carpeta.

## El formato

Un deck es **un solo archivo** `.dc.html`: cada diapositiva es un `<section>` con los
estilos inline. De ahí salen los dos entregables, y ninguno se edita a mano:

| archivo | cómo se genera | para qué |
|---|---|---|
| `*.dc.html` | se escribe a mano | la fuente |
| `*.preview.html` | `build_preview.py` | **se proyecta**: pantalla completa en el navegador, navegación por teclado |
| `*.pdf` | `scripts/build_pdf.py` | para repartir — **no se versiona**, está en `.gitignore` |

```sh
# el visor — el script vive en el brand kit, no en este repo
python3 <ruta-al-brand-kit>/build_preview.py docs/clases/clase_1_fundamentos_y_gitflow.dc.html

# el PDF
python3 scripts/build_pdf.py docs/clases/clase_1_fundamentos_y_gitflow.dc.html
```

El brand kit está en Drive, en `Trabajo/Taligent/taligent-brand/`. Las reglas de
diseño (paleta, tipografías, componentes) están en su `brand-kit/DESIGN.md`.

> El `.dc.html` **no se puede abrir directo en el navegador**: usa `<helmet>` y
> `<x-import>`, que sólo interpreta Claude Design. Sin esas etiquetas resueltas, las
> `<section>` se apilan como una página larga. Para ver el deck se usa el
> `.preview.html`.

### Si hay que editar

Los estilos van **inline en cada elemento**, sin variables CSS ni clases: es un
requisito del formato. Los valores de la paleta y la escala tipográfica salen de
`DESIGN.md` del brand kit — conviene copiarlos de ahí y no inventar colores.

Después de editar, regenerar el `.preview.html` y el `.pdf`, y revisar que ninguna
slide desborde: el contenedor tiene `overflow:hidden`, así que lo que sobra no queda
cortado a la vista, simplemente desaparece.

El diagrama de GitFlow de la clase 1 es un SVG inline, sin imágenes externas.
Su paleta original (verde/azul/violeta/rojo) se readaptó a la del brand kit:
`main` verde, `develop` blanco cálido, `feature` naranja, `release` oro, `hotfix` rojo.

Los colores tienen el mismo significado en las dos clases: verde es `main` y lo
correcto, rojo es `hotfix` y lo que no se versiona, el degradado naranja marca lo
destacado. Conviene no romper esa correspondencia al editar.
