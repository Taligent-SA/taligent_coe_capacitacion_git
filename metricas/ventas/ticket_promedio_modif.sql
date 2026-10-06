-- metrica: Ticket promedio
-- dueño: equipo comercial
-- descripcion: Facturación dividida por cantidad de comprobantes, por mes.

SELECT
    periodo,
    SUM(importe_neto) / COUNT(DISTINCT comprobante) AS ticket_promedio
FROM ventas.comprobantes
WHERE anulado = 0
  AND periodo >= '202608' --correccion de periodo para que tome los ultimos 12 meses
GROUP BY periodo;
