# Guía del taller

Cuatro ejercicios. Cada uno tarda entre diez y veinte minutos y deja algo aprendido que el
siguiente usa. No hace falta saber SQL: los archivos son texto, y lo que se practica es el flujo.

Cada ejercicio arranca con una nota que dice en qué momento de la clase cae, para que puedas
ubicarte. El detalle de cada bloque está en la [guía del facilitador](GUIA_FACILITADOR.md).

---

## 0 · Preparación

> **Clase 1** · apertura, antes del bloque 1.

```bash
git clone https://github.com/Taligent-SA/taligent_coe_capacitacion_git.git
cd taligent_coe_capacitacion_git
git checkout develop
```

Mirá dónde estás parado y qué pasó antes:

```bash
git log --oneline --graph --all --until=2026-07-30
```

Eso que ves es el historial del repositorio: tres features que entraron, una versión
publicada y un hotfix que salió a corregir producción. **Ese dibujo es GitFlow.**

El corte por fecha no es caprichoso: hasta el 30 de julio está el repositorio de práctica, que es
lo que nos interesa mirar. Lo que vino después son los commits del material de esta capacitación
—slides, guías, releases del curso— y para este ejercicio son ruido. Sacale el `--until` cuando
quieras ver todo.

---

## 1 · Tu primera rama y tu primer commit

> **Clase 1** · va al final del bloque 2, *Los conceptos de Git*. Slide 9.

Vas a agregar una métrica nueva.

```bash
git checkout develop
git checkout -b feature/tu-nombre-cantidad-clientes
```

Creá el archivo `metricas/ventas/cantidad_clientes.sql` con este contenido:

```sql
-- metrica: Cantidad de clientes activos
-- dueño: tu nombre
-- descripcion: Clientes distintos con al menos una compra en el período.

SELECT
    periodo,
    COUNT(DISTINCT cliente) AS clientes_activos
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
```

Antes de commitear, corré el quality gate — es un script del repositorio que revisa que la métrica
tenga encabezado completo y que no se te haya colado una credencial. Al final de esta guía está
explicado en detalle; por ahora alcanza con correrlo y ver que pasa:

```bash
./scripts/validar_metricas.sh
```

Después:

```bash
git add metricas/ventas/cantidad_clientes.sql
git commit -m "feat: agregar métrica de cantidad de clientes activos"
git push -u origin feature/tu-nombre-cantidad-clientes
```

**Para pensar:** ¿por qué `git add` de un archivo puntual y no `git add .`? Porque `add .` sube
todo lo que haya en la carpeta, incluido lo que no querías. Es la forma más común de subir una
credencial sin darse cuenta.

---

## 2 · Abrir un Pull Request y revisar el de otro

> **Clase 1** · va al final del bloque 3, *GitFlow*. Slide 15. Es el último de la clase 1.

Abrí el PR desde la web del repositorio: base `develop`, comparar con tu rama.

Cuando pusheaste la rama, el remoto te contestó con el link ya armado — `Create a pull request for
'tu-rama' on GitHub by visiting: …`. Alcanza con abrirlo. Si esa salida ya no está a la vista, la URL
se arma sola con el patrón `.../compare/develop...tu-rama?expand=1`.

**El pull request no es de git, es de GitHub.** No existe ningún `git pull-request`: git sabe de
ramas, commits y remotos, y el PR —con su revisión, sus comentarios y su botón de merge— es una capa
que agrega la plataforma encima. Por eso se abre desde la web. Quien tenga instalado el cliente de
GitHub puede hacer lo mismo sin salir de la terminal con `gh pr create --base develop`, pero es
comodidad, no otra forma de trabajar.

En la descripción, escribí **qué** cambió y **por qué**. No "agregué un archivo".

Después, **buscá el PR de otro participante y revisalo**. Mirá el diff y dejá al menos un
comentario: una duda, una sugerencia de nombre, lo que sea. La revisión no es un trámite — es el
único momento en que alguien que no sos vos mira el cambio antes de que exista para todos.

---

## 3 · Provocar un conflicto y resolverlo

> **Clase 2** · va al final del bloque 4, *Colaborar sin pisarse*.

En el repositorio hay dos ramas que tocan **la misma línea** del mismo archivo:

- `feature/ticket-sin-internos` — excluye clientes internos
- `feature/ticket-redondeado` — limita el período a partir de 2026

Las dos viven en el remoto y no en tu clon, así que se nombran con el prefijo `origin/`.

Ambas son cambios razonables. Ninguna está mal. Pero Git no puede decidir cuál gana.

```bash
git checkout develop
git merge origin/feature/ticket-sin-internos     # entra sin problemas
git merge origin/feature/ticket-redondeado       # ✗ CONFLICTO
```

Abrí `metricas/ventas/ticket_promedio.sql`. Vas a ver algo así:

```
<<<<<<< HEAD
  AND tipo_cliente <> 'interno'
=======
  AND periodo >= '202601'
>>>>>>> origin/feature/ticket-redondeado
```

Arriba lo que ya estaba, abajo lo que viene entrando. **Resolver un conflicto es decidir**: en
este caso las dos condiciones son compatibles, así que la respuesta correcta es dejar las dos y
borrar las marcas. Después:

```bash
git add metricas/ventas/ticket_promedio.sql
git commit
```

**Lo importante:** un conflicto no es un error ni algo que hiciste mal. Es Git avisándote que dos
personas tomaron decisiones distintas sobre lo mismo y que **la decisión es humana**.

Para volver al estado inicial y que otro pueda hacer el ejercicio:
`git reset --hard origin/develop`

---

## 4 · Un hotfix

> **Clase 2** · va al final del bloque 5, *CI/CD*.

Producción tiene un bug y `develop` está lleno de cosas a medio terminar que no pueden salir.

```bash
git checkout main          # ← ojo: de main, no de develop
git checkout -b hotfix/1.0.2-tu-nombre
```

Corregí lo que quieras en una métrica, commiteá, y **abrí dos PRs**: uno hacia `main` y otro hacia
`develop`.

**Para pensar:** ¿qué pasa si te olvidás del segundo? El bug vuelve en la próxima versión, porque
`develop` nunca se enteró de la corrección. Es el error más común del modelo y el más difícil de
detectar: no falla nada hasta que reaparece.

---

## Extra · El quality gate (opcional)

Esto no es Git. Es una buena práctica que se apoya en Git, y por eso va al final: si el tiempo
alcanza lo hacemos, y si no, alcanza con saber que el script existe y qué hace.

En `scripts/validar_metricas.sh` hay un **quality gate**: un script que revisa que cada métrica
tenga encabezado con nombre, dueño y descripción, y que no se cuele nada que parezca una
credencial. Se corre a mano antes de commitear:

```bash
./scripts/validar_metricas.sh
```

Probalo al revés, que es donde se entiende. Sacale la línea `-- dueño:` a tu archivo y corrélo:
falla, y te dice exactamente qué le falta. Ahora probá algo peor: agregá al final una línea con
`-- password = miclave123` y corrélo de nuevo.

**Lo que importa es dónde corre también:** ese mismo script se ejecuta solo en CI cuando abrís el
Pull Request. Si falla en tu máquina, falla allá, y el merge queda bloqueado. Esa es toda la idea
de CI, y es el tema de la clase 2.

Volvé a dejar el archivo como estaba antes de seguir.
