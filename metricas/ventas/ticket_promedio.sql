-- metrica: Ticket promedio
-- dueño: equipo comercial
-- descripcion: Facturación dividida por cantidad de comprobantes, por mes.

SELECT
    periodo,
    SUM(importe_neto) / NULLIF(COUNT(DISTINCT comprobante), 0) AS ticket_promedio
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
