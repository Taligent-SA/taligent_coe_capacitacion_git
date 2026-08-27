-- metrica: Ticket promedio
-- dueño: equipo comercial
-- descripcion: Facturación dividida por cantidad de comprobantes, por mes.

SELECT
    periodo,
    SUM(importe_neto) / COUNT(DISTINCT comprobante) AS ticket_promedio_prueba
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
