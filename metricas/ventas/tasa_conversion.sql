-- metrica: Tasa de conversión
-- dueño: equipo comercial
-- descripcion: Porcentaje de oportunidades que terminan en venta.

-- TODO: falta definir con comercial si una oportunidad reabierta cuenta una vez o dos.
SELECT
    periodo,
    COUNT(*) FILTER (WHERE estado = 'ganada') * 100.0 / COUNT(*) AS tasa_conversion
FROM ventas.oportunidades
GROUP BY periodo;
