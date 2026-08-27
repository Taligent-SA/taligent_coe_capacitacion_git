-- metrica: Facturación mensual
-- dueño: equipo comercial
-- descripcion: Suma de la facturación neta por mes y unidad de negocio.
-- hotfix: agrego comentarios del campo calculado
SELECT
    periodo,
    unidad_negocio,
    SUM(importe_neto) AS facturacion --Renombro el campo calculado
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo, unidad_negocio;

-- Nota: 'importe_neto' ya viene sin IVA desde el origen.
