# Guía del facilitador

Cómo dar esta capacitación. **Dos clases de dos horas**, cada una con su descanso.

- **Clase 1 — Fundamentos y GitFlow:** bloques 1 a 3, ejercicios 1 a 3.
- **Clase 2 — Colaboración, CI/CD y BI:** repaso, bloques 4 a 6, ejercicios 4 y 5.

---

## Antes de la sesión

### Una semana antes

Mandá el correo de prerrequisitos. Tiene que ser **verificable**, no una lista de deseos:

> Para el taller necesitás dos cosas listas:
>
> 1. **Git instalado.** Abrí una terminal y escribí `git --version`. Si te devuelve un número, estás.
> 2. **Poder escribir en el repositorio.** Aceptá la invitación que te llega por mail, cloná
>    https://github.com/Taligent-SA/taligent_coe_capacitacion_git y subí una rama de prueba:
>
>    ```bash
>    git clone https://github.com/Taligent-SA/taligent_coe_capacitacion_git.git
>    cd taligent_coe_capacitacion_git
>    git checkout -b prueba/tu-nombre
>    git push -u origin prueba/tu-nombre
>    ```
>
> Si alguna de las dos falla, escribime **antes** del taller. Resolverlo en vivo nos come media hora de los demás.

**Que la verificación sea el `push`, no el "lo veo".** El repositorio es público: entrar y verlo no
prueba nada, porque un colaborador con permiso de sólo lectura también lo ve. Lo único que confirma
que va a poder trabajar es que la rama de prueba llegue al remoto.

Cuando alguien reporta que no puede pushear, chequeá en este orden:

1. **La invitación sigue sin aceptar.** Es la causa más frecuente y no se arregla refrescando.
   Se aceptan desde el mail o desde `https://github.com/Taligent-SA/taligent_coe_capacitacion_git/invitations`.
2. **Quedó como colaborador con permiso `read`.** Aceptar no alcanza; hay que subirlo a `write`.
3. **Cuenta de GitHub nueva con el mail sin verificar.** GitHub deja aceptar la invitación pero no
   deja pushear, y devuelve un `403` pelado. Se revisa en `https://github.com/settings/emails`.

**El discriminador es el mensaje del remoto.** Si aparece `remote: Permission to ... denied to ...`,
rechazó GitHub por permisos: casos 1 o 2, o credenciales cacheadas de otra cuenta. Si es un
`RPC failed; HTTP 403` **sin ninguna línea `remote:`**, no es GitHub quien rechaza: es el caso 3, o
un proxy con inspección TLS en el medio. El dominio del mail no influye en nada.

### El día anterior

**Antes de la clase 1:**

- Confirmá que cada participante hizo las dos verificaciones. El que no contestó, no las hizo.
- Corré vos `./scripts/validar_metricas.sh` para tenerlo fresco: es el ejercicio 2.

**Antes de la clase 2:**

- Recorré el ejercicio 4 (el conflicto) de punta a punta. Es el que más se rompe.
- Dejá el repo en su estado inicial: `feature/ticket-sin-internos` y `feature/ticket-redondeado` **sin mergear**.
- Repasá qué quedó flojo en la clase 1: los primeros diez minutos son para eso.

### Diez minutos antes

- Deck abierto en pantalla completa.
- Una terminal con la fuente grande — 18 pt como mínimo, y probala desde el fondo de la sala.
- El repositorio ya clonado en tu máquina, en `develop`.
- La pestaña de Actions del repo abierta en otra ventana (para la clase 2).

---

## El reparto del tiempo

Dos ventanas de 120 minutos. Los bloques no se parten entre clases: cada clase abre y cierra sola.

### Clase 1 · Fundamentos y GitFlow

| Min | Bloque | Qué pasa |
|---|---|---|
| 0–8 | **Apertura** | Agenda y confirmar que todos clonaron. |
| 8–22 | **1 · Por qué versionar** | Conversación. Todavía no se toca el teclado. |
| 22–45 | **2 · Conceptos** | Teoría corta + demo tuya |
| 45–60 | **Ejercicio 1** | Primera rama, primer commit |
| 60–70 | ☕ **Descanso** | No lo saltees, aunque vayas tarde |
| 70–95 | **3 · GitFlow** | El bloque más denso |
| 95–105 | **Ejercicio 2** | Hacer fallar el quality gate a propósito |
| 105–117 | **Ejercicio 3** | Abrir un PR y revisar el de otro |
| 117–120 | **Cierre** | Qué viene en la clase 2 |

**Si vas tarde**, sacrificá primero el **ejercicio 2** — lo recuperás en la clase 2, donde el mismo
script aparece corriendo dentro de CI. Después el 3. **Nunca recortes el bloque 3**: es el que
sostiene toda la clase 2.

### Clase 2 · Colaboración, CI/CD y BI

| Min | Bloque | Qué pasa |
|---|---|---|
| 0–10 | **Repaso** | Dónde quedamos, y que digan qué quedó flojo |
| 10–30 | **4 · Colaborar** | Commits, PRs chicos, `.gitignore` |
| 30–52 | **Ejercicio 4** | El conflicto |
| 52–62 | ☕ **Descanso** | No lo saltees, aunque vayas tarde |
| 62–85 | **5 · CI/CD** | Con el pipeline corriendo en vivo |
| 85–100 | **Ejercicio 5** | Un hotfix, con sus dos PRs |
| 100–110 | **6 · Cierre** | El puente hacia BI |
| 110–120 | **Preguntas** | Dejalos abiertos a propósito |

**Si vas tarde**, sacrificá primero el **ejercicio 5** y hacelo como demo tuya en cinco minutos;
después el margen de preguntas. **Nunca saques el ejercicio 4** — el conflicto es lo que más miedo
da y lo que hay que desactivar sí o sí.

---

## Bloque 1 · Por qué versionar

*Clase 1.*

**Objetivo:** que reconozcan el problema como propio antes de que aparezca la solución.

**Cómo abrirlo.** No arranques explicando qué es Git. Arrancá con la carpeta de archivos `_FINAL_v2_ok`. Mostrala y preguntá:

> ¿Alguno tiene una carpeta parecida a esta?

Se van a reír. Esa risa es el enganche: reconocieron el problema.

Dejá que cuenten. Alguien va a decir que perdió trabajo, que pisó el archivo de un compañero, que no supo cuál era la buena. **Esas anécdotas valen más que cualquier diapositiva.** Anotá una o dos y usalas después: "esto que contaba Marcela, de que no sabían cuál era la versión buena — eso es lo que resuelve `git log`".

**La frase que ancla el bloque:**

> Esto no es desprolijidad. Es un sistema de control de versiones hecho a mano. Funciona hasta que sos más de uno, o hasta que pasa el tiempo suficiente como para no acordarte.

**No** entres en cómo funciona Git internamente. Ni objetos, ni SHA, ni árboles. No hace falta y espanta.

---

## Bloque 2 · Conceptos

*Clase 1.*

**Objetivo:** el modelo mental. Que sepan qué es cada cosa, no cómo se escribe.

**Cómo darlo.** Las siete palabras van rápido, una por una, sin profundizar. La que sí merece tiempo es la distinción **add → commit → push**, porque es la que genera más confusión real.

**La demo.** Compartí pantalla con la terminal y hacé el ciclo completo vos, narrando en voz alta lo que hacés y por qué. Que te vean equivocarte y corregir es bueno: baja la ansiedad.

**La frase que ancla el bloque:**

> Hasta que no hacés `push`, el cambio existe sólo en tu computadora. "Ya lo commiteé" no significa que tu compañero lo tenga.

**Pregunta que siempre aparece:** *¿y si me equivoco y rompo algo?*

> Todo lo que está commiteado se recupera. Esa es justamente la idea: dejás de tener miedo a probar cosas, porque siempre podés volver.

---

## Bloque 3 · GitFlow

*Clase 1.*

**Objetivo:** que entiendan **por qué** existe cada rama. Si sólo memorizan los nombres, el bloque falló.

Es el bloque más denso. Bajá el ritmo.

**El orden importa.** Primero las dos permanentes —`main` es lo que está publicado, `develop` es lo que va a salir—, y recién después las tres temporales. Si arrancás por `feature` no tienen dónde apoyarlo.

**Para `feature`,** la pregunta que lo justifica:

> Si estás a mitad de una métrica que todavía no funciona, ¿dónde la guardás? En `develop` no, porque `develop` es lo que va a salir. Para eso está la rama.

**Para `release`,** el problema que resuelve:

> Decidiste qué sale el viernes. Pero el equipo sigue trabajando. Si todos siguen tocando lo mismo, nunca podés congelar nada. La rama de release congela lo que va a salir y deja que el resto siga.

**Para `hotfix`,** que es la más importante:

> Producción se rompió. Necesitás corregir eso y sólo eso. Pero `develop` está lleno de cosas a medio terminar que no pueden salir. Por eso el hotfix no nace de `develop`: nace de lo que ya está publicado.

**El momento clave del bloque** es la slide del error silencioso. Frená ahí y contala como historia:

> Arreglás producción, mergeás a `main`, todos contentos. Tres semanas después sale la versión siguiente, que viene de `develop`, que nunca se enteró de la corrección. Y el bug vuelve. Nadie lo detecta cuando pasa, porque no falla nada.

Y la regla para llevarse:

> Si la rama toca `main`, tiene que tocar `develop` también.

---

## Bloque 4 · Colaborar

*Clase 2.*

**Objetivo:** que entiendan que las convenciones no son burocracia.

**Sobre los mensajes de commit.** No des una lista de reglas. Dales la prueba:

> Dentro de seis meses alguien va a estar buscando cuándo se rompió algo, leyendo sólo los títulos de los commits. ¿Le sirve el tuyo para saber si es este?

**Sobre el tamaño del PR,** la frase que más funciona:

> Un PR chico se revisa. Uno grande se aprueba sin leer. Y aprobar sin leer es peor que no revisar, porque queda constancia de que alguien lo miró.

**Sobre `.gitignore`,** el punto que hay que dejar clarísimo:

> Si subís una credencial y después la borrás, **sigue estando en el historial**. Cualquiera que clone el repo la tiene. La única salida es rotar la credencial, no borrarla.

Ahí solés ver caras de preocupación. Es la reacción correcta.

---

## Bloque 5 · CI/CD

*Clase 2.*

**Objetivo:** el concepto, no la herramienta.

**Cómo darlo.** CI y CD son dos ideas distintas y conviene separarlas de entrada: una valida, la otra promueve.

**Hacelo en vivo.** Abrí la pestaña Actions del repositorio y lanzá el workflow a mano — tiene `workflow_dispatch` justamente para esto. Que lo vean correr y ponerse en verde.

**Después rompelo.** Sacale un campo del encabezado a una métrica en vivo, pusheá, y que vean el rojo. Es mucho más efectivo que explicarlo.

**La historia real que hay que contar.** Está en la slide, y es cierta: este mismo quality gate se escribió en una Mac, daba OK, y al subirlo falló trece verificaciones en Linux porque `grep` interpreta distinto un patrón que empieza con `--`. El chequeo nunca se estaba aplicando.

> Funcionaba en la máquina de quien lo escribió y en ningún otro lado. Eso es lo que CI atrapa. Y le pasó al que está dando esta capacitación.

Esa última frase hace más por la credibilidad del concepto que veinte minutos de teoría.

**Sobre por qué el gate bloquea en vez de avisar:**

> Una advertencia que no bloquea se ignora. La primera vez con culpa, la décima ni se lee.

---

## Bloque 6 · Cierre

*Clase 2.*

**Objetivo:** conectar con su mundo y dejar la puerta abierta.

Es breve a propósito. **No** te metas en PBIP ni en fabric-cicd: eso es la capacitación siguiente, y si abrís esa puerta se te va media hora y termina siendo una charla peor sobre un tema que no preparaste.

> Todo lo que vimos hoy es el flujo. Lo que cambia en cada herramienta es sólo qué archivo se versiona. En Power BI, el formato PBIP guarda el informe como archivos de texto en vez de un binario. En Qlik, los scripts se extraen a `.qvs`. Texto es lo que Git sabe comparar. El cómo de cada una lo vemos en el próximo encuentro.

Cerrá con las cuatro cosas para llevarse y abrí a preguntas.

---

## Cuando algo se rompe

**Alguien no puede clonar.** No lo resuelvas en vivo. Que se siente con alguien que sí pudo y trabajen de a dos. Seguí con el resto.

**Alguien destrozó su repo local.** La salida universal:

```bash
git reset --hard origin/develop
```

Enseñalo como herramienta, no como emergencia: sirve para volver a un estado conocido. Aclará que descarta cambios locales.

**El conflicto del ejercicio 4 no aparece.** Es porque ya mergearon una de las dos ramas antes. `git reset --hard origin/develop` y de nuevo.

**Alguien se adelanta y termina todo.** Dale trabajo: que revise el PR de otro, o que agregue una validación nueva al quality gate.

**Vas 20 minutos tarde.** En la clase 1, sacá el ejercicio 2 y no recortes el bloque 3. En la clase 2, hacé el ejercicio 5 como demo tuya en cinco minutos y no toques el ejercicio 4.

---

## Preguntas que van a aparecer

**¿Esto sirve para archivos de Power BI?**
Con el formato PBIP sí, porque son texto. Con `.pbix` no, porque es binario: Git lo versiona pero no puede mostrarte qué cambió adentro. Es exactamente el tema de la próxima capacitación.

**¿Y si dos personas editan el mismo informe?**
Igual que hoy con el mismo archivo SQL: si tocan líneas distintas, Git lo resuelve solo. Si tocan la misma, hay conflicto y alguien decide.

**¿Hace falta usar la terminal?**
Para esta capacitación sí, porque muestra lo que está pasando. Después hay interfaces gráficas y funcionan bien. Pero cuando algo se rompe, se arregla en la terminal.

**¿Por qué tantas ramas? Parece burocrático.**
Con una persona lo es. Con cuatro, y con algo publicado que no se puede romper, es lo que evita pisarse. GitFlow es una respuesta a un problema de equipo, no de individuo.

**¿Esto no hace todo más lento?**
Al principio sí. Lo que ahorra aparece el día que hay que volver atrás, o entender qué cambió, o corregir producción sin frenar lo que está en desarrollo.
