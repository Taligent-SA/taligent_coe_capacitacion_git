# Changelog

## [1.5.0] — saber en qué momento va cada ejercicio

### Agregado
- **Llamadas de ejercicio en la guía del facilitador.** Cada bloque que precede a un ejercicio
  cierra ahora con una marca —`⏱ ACÁ VA EL EJERCICIO N`— que dice cuál es, en qué minuto cae,
  cuánto dura, en qué slide se apoya, qué mirar mientras los participantes trabajan y qué hacer si
  se va tarde. Son cuatro: bloque 2 → ejercicio 1, bloque 3 → ejercicio 2, bloque 4 → ejercicio 3,
  bloque 5 → ejercicio 4.
  Antes los ejercicios aparecían **sólo** en la tabla de tiempos, y al dictar no había forma de
  darse cuenta, leyendo el bloque, de que el ejercicio venía justo ahí.
- La referencia inversa en la guía de ejercicios: cada ejercicio abre diciendo a qué clase y a qué
  bloque pertenece y en qué slide se apoya. Sirve para quien dicta y para quien lo lee desde el
  repositorio y quiere ubicarse.

## [1.4.1] — el guión de `.git`, más corto

### Cambiado
- El guión de los cinco minutos de qué hay adentro de `.git` pasa de 608 a **375 palabras
  habladas** —de cuatro minutos y medio a dos y medio—, para que las preguntas quepan dentro de los
  cinco minutos en lugar de desbordarlos. Salen los objetos y los hashes, la deduplicación, el index
  como concepto con nombre propio, la palabra «referencias» y el comando `git cat-file`. Queda el
  vocabulario de fotos encadenadas y papelitos con una dirección: menos preciso a propósito, sin
  dejar de ser cierto.
- La demo en vivo baja de cinco comandos a tres, y se agrega una respuesta de una línea para la
  pregunta previsible por la cadena de caracteres de una rama.

## [1.4.0] — cuatro ejercicios, y Git por dentro

### Agregado
- **Los cinco minutos de qué hay adentro de `.git`**, un guión nuevo en el bloque 1 de la guía del
  facilitador para dar sobre la slide «El cambio de mentalidad»: los objetos y por qué un commit
  apunta al anterior, las referencias y por qué una rama es un archivo con un hash adentro, el
  index, y el recorrido de `clone`/`init` hasta el `push`. Trae cinco comandos para mostrarlo en
  vivo y una lista de preguntas que conviene esquivar.
  Reemplaza a la indicación anterior de **no** entrar en el funcionamiento interno de Git. Es un
  cambio de criterio deliberado, con su propio límite de tiempo escrito al lado.
- La slide del ejercicio 2 muestra ahora el diagrama de «El modelo completo» junto al comando, en
  chico, para poder comparar el modelo idealizado con la salida real del `git log`.

### Cambiado
- **El ejercicio de hacer fallar el quality gate deja de ser un ejercicio.** No es de Git: es una
  buena práctica que se apoya en Git. Pasa al final de la guía como extra opcional, con el mismo
  contenido, y en la clase 2 queda como demo dentro del bloque de CI/CD si el tiempo alcanza.
- Los ejercicios se renumeran de **1 a 4**: primera rama, abrir un PR, provocar un conflicto y un
  hotfix. Quedan alineados la guía de ejercicios, los dos cronogramas de la guía del facilitador
  —incluido qué recortar si vas tarde—, las slides de las dos clases y el README de `docs/clases`.
- Los diez minutos que libera el ejercicio que salió van al bloque 1, que es donde entran los cinco
  minutos de `.git`.
- La consigna del ejercicio 2 —abrir el PR y revisar el de otro— sale del cuerpo de texto
  explicativo y pasa a una caja propia. Estaba escrita entre las explicaciones del grafo y se leía
  como una nota del facilitador y no como lo que hay que hacer.

## [1.3.0] — el material, alineado con lo que el alumno ve

### Cambiado
- La guía del facilitador pasa al formato de **dos clases de dos horas**, que es como
  se dicta desde la 1.1.0. Seguía escrita para la clase única de 3 h 30.
- El prerrequisito de acceso al repositorio deja de ser *"entrá y confirmame que lo
  ves"* y pasa a ser una **prueba de push**. El repositorio es público: verlo no
  prueba nada, y el permiso de escritura es lo único que hace falta y lo único que
  no se puede resolver en el momento.

### Corregido
- El ejercicio 0 mandaba a correr `git log --oneline --graph --all | head -30` y
  después describía *"tres features que entraron, una versión publicada y un
  hotfix"*. Las primeras 30 líneas ya eran commits del propio material de la clase
  —el brand kit, las guías, los releases del curso— y el dibujo de GitFlow arrancaba
  en la línea 60 de 103. Ahora el comando lleva `--until=2026-07-30`, que acota el
  grafo al repositorio de práctica. **Es la segunda vez que pasa lo mismo** (ver la
  1.1.1): la diferencia es que antes se corrigió el texto para que describiera el
  grafo del momento, y ahora se ancló el comando, así que no vuelve a desfasarse
  cuando entre material nuevo.
- La slide 15 de la clase 1 hablaba de cuatro features y dos versiones publicadas
  (`v1.0.0` y `v1.1.0`), que no coincidía ni con la guía ni con la salida real.
  Quedó en tres features, una versión, y dos merges de release y dos de hotfix.
- Los comandos de clone y de merge de la guía de ejercicios: el clone apuntaba a un
  `<url-del-repo>` de relleno y entraba a una carpeta `catalogo-metricas` que no
  existe, y el ejercicio del conflicto mergeaba ramas locales que el alumno no
  tiene. Ahora llevan el prefijo `origin/`, que además explica por qué.
- El ejercicio 3 no decía de dónde sale el pull request. Ahora aclara que **el PR es
  de GitHub y no de git**, que el link ya viene en la salida del push, y que
  `gh pr create` es comodidad y no otra forma de trabajar.

## [1.2.1] — portada del sitio

### Agregado
- `docs/index.html`, una portada para el sitio publicado por GitHub Pages, con el
  mismo brand kit que las clases. Enlaza las dos clases y el material de apoyo.
  Antes la raíz del sitio devolvía 404 porque no había `index.html`: el enlace que
  GitHub muestra en Deployments apuntaba ahí y parecía que el deploy había fallado.
  Ahora alcanza con repartir una sola URL corta en lugar de dos largas.

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
