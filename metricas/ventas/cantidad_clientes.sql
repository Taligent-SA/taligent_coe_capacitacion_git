SELECT
    periodo,
    COUNT(DISTINCT cliente) AS clientes_activos
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;