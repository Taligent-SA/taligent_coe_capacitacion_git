-- metrica: Margen bruto
-- dueño: equipo de finanzas
-- descripcion: Porcentaje de margen sobre la facturación del período.

SELECT
    periodo,
    (SUM(importe_neto) - SUM(costo)) / SUM(importe_neto) * 100 AS margen_bruto_pct
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
