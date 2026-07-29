# Catálogo de Métricas

Repositorio de ejemplo para la capacitación **Git, GitFlow y CI/CD para consultores de BI**.

Contiene definiciones de métricas de negocio en SQL, versionadas como código. Es deliberadamente
simple y **no** es un proyecto de Power BI ni de Qlik: la idea es que el foco quede en el flujo de
trabajo y no en la herramienta.

## Qué hay acá

```
metricas/
  ventas/      definiciones de métricas del área comercial
  finanzas/    definiciones de métricas económicas
scripts/
  validar_metricas.sh    el "quality gate": lo mismo que corre CI, pero en tu máquina
docs/
  GITFLOW.md   el modelo de ramas que usamos
  EJERCICIOS.md  la guía del taller
```

## Reglas del repositorio

1. Cada métrica es **un archivo `.sql`** con su encabezado de metadatos.
2. Nadie escribe directo en `main` ni en `develop`. Todo entra por Pull Request.
3. Un cambio que no pasa el quality gate no se mergea.

Antes de abrir un PR, corré la validación local:

```bash
./scripts/validar_metricas.sh
```

Si eso pasa, CI también va a pasar. Es el mismo script.
