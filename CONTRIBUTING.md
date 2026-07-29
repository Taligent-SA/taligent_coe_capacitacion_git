# Cómo contribuir

## Mensajes de commit

Formato: `tipo: qué cambió y por qué`

| Tipo | Cuándo |
|---|---|
| `feat` | una métrica nueva |
| `fix` | una corrección sobre una métrica existente |
| `docs` | documentación |
| `refactor` | reescritura sin cambio de resultado |
| `chore` | tareas de mantenimiento |

**Bien:** `fix: evitar división por cero en margen_bruto cuando no hay ventas`
**Mal:** `cambios`, `arreglos varios`, `wip`, `asdf`

La prueba: si dentro de seis meses alguien lee sólo el título del commit, ¿entiende qué pasó?

## Alcance

Un commit, una idea. Un PR, un tema. Si tu PR necesita la palabra "y" para describirse
—"agrego la métrica de margen **y** corrijo el ticket promedio"— probablemente son dos PRs.

Los PR chicos se revisan en minutos. Los PR de 40 archivos se aprueban sin leer, que es lo mismo
que no revisarlos.

## Antes de abrir el PR

1. Corré `./scripts/validar_metricas.sh`.
2. Verificá que no estás subiendo credenciales ni archivos generados.
3. Escribí en la descripción **qué** cambió y **por qué**, no cómo.
