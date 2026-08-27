-- metrica: Ticket promedio
-- dueño: equipo comercial
-- descripcion: Facturación dividida por cantidad de comprobantes, por mes.

SELECT
    periodo,
    SUM(importe_neto) / COUNT(DISTINCT comprobante) AS ticket_promedio
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;

-- Nota: 'importe_neto' ya viene sin IVA desde el origen.