# Guía del facilitador

Cómo dar esta capacitación. **Dos clases de dos horas**, cada una con su descanso.

- **Clase 1 — Fundamentos y GitFlow:** bloques 1 a 3, ejercicios 1 y 2.
- **Clase 2 — Colaboración, CI/CD y BI:** repaso, bloques 4 a 6, ejercicios 3 y 4.

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
- Corré vos `./scripts/validar_metricas.sh` para tenerlo fresco: aparece al pasar en el
  ejercicio 1 y es el extra opcional del final.
- Repasá los cinco minutos de «qué hay adentro de `.git`» y dejá una terminal parada en el
  repositorio, por si lo mostrás en vivo.

**Antes de la clase 2:**

- Recorré el ejercicio 3 (el conflicto) de punta a punta. Es el que más se rompe.
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
| 8–27 | **1 · Por qué versionar** | Conversación + los cinco minutos de qué hay adentro de `.git` |
| 27–50 | **2 · Conceptos** | Teoría corta + demo tuya |
| 50–65 | **Ejercicio 1** | Primera rama, primer commit |
| 65–75 | ☕ **Descanso** | No lo saltees, aunque vayas tarde |
| 75–100 | **3 · GitFlow** | El bloque más denso |
| 100–115 | **Ejercicio 2** | Recorrer el historial, abrir un PR y revisar el de otro |
| 115–120 | **Cierre** | Qué viene en la clase 2 |

**Si vas tarde**, lo primero que se recorta es la **revisión del PR de otro**: que abran el suyo y
que la revisión quede de tarea. Lo segundo, los cinco minutos de `.git` — son un lujo, no un
cimiento. **Nunca recortes el bloque 3**: es el que sostiene toda la clase 2.

### Clase 2 · Colaboración, CI/CD y BI

| Min | Bloque | Qué pasa |
|---|---|---|
| 0–10 | **Repaso** | Dónde quedamos, y que digan qué quedó flojo |
| 10–30 | **4 · Colaborar** | Commits, PRs chicos, `.gitignore` |
| 30–52 | **Ejercicio 3** | El conflicto |
| 52–62 | ☕ **Descanso** | No lo saltees, aunque vayas tarde |
| 62–85 | **5 · CI/CD** | Con el pipeline corriendo en vivo. Si sobra tiempo, el gate fallando en vivo |
| 85–100 | **Ejercicio 4** | Un hotfix, con sus dos PRs |
| 100–110 | **6 · Cierre** | El puente hacia BI |
| 110–120 | **Preguntas** | Dejalos abiertos a propósito |

**Si vas tarde**, sacrificá primero el **ejercicio 4** y hacelo como demo tuya en cinco minutos;
después el margen de preguntas. **Nunca saques el ejercicio 3** — el conflicto es lo que más miedo
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

### Los cinco minutos de qué hay adentro de `.git`

*Va sobre la slide «El cambio de mentalidad», justo antes de las siete palabras.* La slide dice que
con Git guardás la secuencia de cambios en lugar de estados completos. Estos cinco minutos cuentan
**cómo** hace eso, concretamente. Después de esto, el vocabulario del bloque 2 deja de ser
abstracto.

**El guión son dos minutos y medio hablado.** El resto del bloque es colchón para las preguntas,
que van a salir. Si nadie pregunta nada, no lo estires: seguí con las siete palabras. Si alguien
pregunta algo que se va de tema, anotalo para el final. La regla es: ningún concepto que no se pueda
ver en pantalla con un comando.

**El guión:**

> Cuando clonan un repositorio, o cuando corren `git init` en una carpeta, no pasa gran cosa a la
> vista: aparece una carpeta oculta que se llama `.git`. Todo lo demás que ven ahí adentro son sus
> archivos de siempre, tal cual, sin tocar.
>
> Esa carpeta `.git` **es el repositorio**. Si la borran, los archivos siguen estando, pero el
> proyecto se convierte en una carpeta común y el historial desaparece. Y al revés: si se la copian
> a otra máquina, se llevan el historial entero.
>
> ¿Y qué guarda adentro? Fotos. Cada vez que hacen un commit, Git guarda una foto del proyecto en
> ese momento y le pega una etiqueta con cuatro datos: quién, cuándo, por qué —el mensaje— y cuál
> fue la foto anterior. Ese «cuál fue la anterior» es el que importa: cada commit sabe de dónde
> viene. Todas esas fotos encadenadas son el historial. No hay una lista de versiones en ningún
> lado: hay una cadena.
>
> Y las ramas, que es lo que más sorprende. Una rama no es una copia del proyecto. Es un papelito
> que dice «la última foto de esta rama es esta». Nada más. Crear una rama es escribir ese papelito.
> Por eso es instantáneo aunque el proyecto pese un giga, y por eso no hay que tenerles ningún
> miedo.
>
> Con eso, el ciclo se explica solo. Editan un archivo: por ahora tocaron su carpeta y nada más.
> Hacen `git add`: le dicen a Git cuáles de las cosas que tocaron van a entrar en la próxima foto.
> Hacen `git commit`: saca la foto y mueve el papelito de la rama. Y ojo con esto, que es lo que más
> cuesta: todo lo que pasó hasta acá pasó **en su máquina**, sin internet. Por eso Git es tan rápido
> — casi todo es local.
>
> Recién cuando hacen `git push`, Git le manda al servidor las fotos que le faltan y le pide que
> mueva su papelito. Eso es un push, y recién ahí existe para los demás.
>
> Y de todo esto quiero que se lleven una sola cosa: si algo llegó a ser un commit, la foto está
> guardada. Aunque después parezca que desapareció, se recupera. Por eso lo que decíamos hace un
> rato de perder el miedo a romper algo no es una frase de autoayuda: es cómo está construido.

**Si lo querés mostrar en vivo** —tres comandos, veinte segundos— parate en el repositorio clonado.
El orden importa: el último es el que hace ruido.

```bash
ls -a                        # ahí está .git, y nada más raro
ls .git                      # lo que guarda adentro
cat .git/refs/heads/develop  # una rama: un papelito con una dirección
```

Ver que una rama son unos pocos caracteres en un archivo desarma de golpe la idea de que ramificar
es caro. Si te preguntan qué es esa cadena rara, una respuesta de una línea que no abre puertas:
«es la dirección de esa foto, y sale del contenido mismo — si el contenido cambia, cambia la
dirección». Y seguís.

**Lo que sí conviene evitar**, aunque lo pregunten: qué es exactamente un hash, cómo se comprimen
los archivos adentro de `.git`, el staging area como concepto aparte, y todo lo que sea `git reflog`
o `git gc`. Espanta, come los cinco minutos y no lo van a usar. Si insisten: «existe, se llama
plumbing, y no lo vas a necesitar nunca para trabajar».

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

**El conflicto del ejercicio 3 no aparece.** Es porque ya mergearon una de las dos ramas antes. `git reset --hard origin/develop` y de nuevo.

**Alguien se adelanta y termina todo.** Dale trabajo: que revise el PR de otro, o que agregue una validación nueva al quality gate.

**Vas 20 minutos tarde.** En la clase 1, dejá la revisión del PR de tarea y no recortes el bloque 3. En la clase 2, hacé el ejercicio 4 como demo tuya en cinco minutos y no toques el ejercicio 3.

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
