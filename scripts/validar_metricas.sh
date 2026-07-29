#!/usr/bin/env bash
# Quality gate del catálogo de métricas.
# Es exactamente lo que corre CI. Si esto pasa en tu máquina, pasa allá.
set -uo pipefail

errores=0
fallo() { echo "  ✗ $1"; errores=$((errores+1)); }
ok()    { echo "  ✓ $1"; }

echo "1. Nombres de archivo en snake_case"
for f in $(find metricas -name '*.sql' 2>/dev/null); do
  base=$(basename "$f" .sql)
  if ! [[ "$base" =~ ^[a-z0-9_]+$ ]]; then
    fallo "$f — el nombre debe ser minúsculas, números y guión bajo"
  fi
done
[ $errores -eq 0 ] && ok "todos los nombres son válidos"

echo "2. Encabezado de metadatos obligatorio"
prev=$errores
for f in $(find metricas -name '*.sql' 2>/dev/null); do
  for campo in "-- metrica:" "-- dueño:" "-- descripcion:"; do
    grep -q "$campo" "$f" || fallo "$f — falta el campo '$campo'"
  done
done
[ $errores -eq $prev ] && ok "todas las métricas tienen encabezado completo"

echo "3. Sin credenciales embebidas"
prev=$errores
patrones='password[[:space:]]*=|passwd[[:space:]]*=|api[_-]?key[[:space:]]*=|secret[[:space:]]*='
for f in $(find metricas scripts -type f 2>/dev/null); do
  if grep -Eiq "$patrones" "$f"; then
    fallo "$f — parece contener una credencial embebida"
  fi
done
[ $errores -eq $prev ] && ok "no se detectaron credenciales"

echo "4. Sin archivos generados versionados"
prev=$errores
for f in $(git ls-files 2>/dev/null | grep -Ei '\.(csv|xlsx|qvd|pbix)$'); do
  fallo "$f — es un artefacto generado, no debería estar versionado"
done
[ $errores -eq $prev ] && ok "no hay artefactos versionados"

echo
if [ $errores -gt 0 ]; then
  echo "QUALITY GATE: FALLA — $errores problema(s). El merge queda bloqueado."
  exit 1
fi
echo "QUALITY GATE: OK"
