# El modelo de ramas

## Las dos ramas que viven para siempre

| Rama | Qué contiene | Regla |
|---|---|---|
| `main` | Lo que está **publicado y funcionando**. Cada punto de esta rama salió alguna vez a producción. | Nadie commitea acá directamente. Sólo llegan merges de `release/*` y `hotfix/*`, y cada uno lleva su tag de versión. |
| `develop` | Lo que **va a salir en la próxima versión**. Está integrado, pero todavía no publicado. | Nadie commitea acá directamente. Sólo llegan merges de `feature/*`. |

## Las tres ramas temporales

**`feature/*`** — nace de `develop`, vuelve a `develop`.
Una por cada cosa nueva. Vive mientras dura el trabajo y se borra después de mergear. Existe para
que lo que estás haciendo a medias **no le rompa el día a nadie más**.

**`release/*`** — nace de `develop`, va a `main` **y también vuelve a `develop`**.
Es la ventana de estabilización: cuando decidís qué entra en la versión, cortás esta rama y a
partir de ahí sólo se le hacen correcciones. Mientras tanto `develop` sigue recibiendo features
nuevas sin bloquear la salida. Ese es todo el punto.

**`hotfix/*`** — nace de **`main`**, va a `main` **y también vuelve a `develop`**.
Es la única que no nace de `develop`, y la razón es la clave de todo el modelo: cuando producción
se rompe, `develop` está lleno de trabajo a medio terminar que **no puede salir**. El hotfix nace
de lo que está publicado, corrige sólo eso, y sale.

## Por qué las de release y hotfix vuelven a develop

Si el hotfix sólo fuera a `main`, la corrección se perdería en la próxima versión: `develop` no la
tiene, así que al publicarla el bug vuelve. Por eso **siempre son dos merges**.

Es el error más común del modelo, y el más silencioso: nadie se entera hasta que el bug reaparece.

## El orden completo

```
main     ●─────────────────●──────────●  v1.0.0, v1.0.1
          \               /          /
release    \         ●───●          /
            \       /     \        /
develop   ●──●──●──●───────●──────●
           \  \  /               /
feature     ●──●                /
                               /
hotfix     ────────────────●──●
```
