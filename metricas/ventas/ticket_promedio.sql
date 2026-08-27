-- metrica: Ticket promedio
-- dueño: equipo comercial
-- descripcion: Facturación dividida por cantidad de comprobantes, por mes.

-- bug editado hot fix

SELECT

    periodo,
    SUM(importe_neto) / COUNT(DISTINCT comprobante) AS ticket_promedio
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
