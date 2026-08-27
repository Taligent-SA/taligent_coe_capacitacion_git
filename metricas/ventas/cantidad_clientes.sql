-- metrica: Cantidad de clientes activos
-- dueño: Elias Rimbau
-- descripcion: Clientes distintos con al menos una compra en el período.

SELECT
    periodo,
    COUNT(DISTINCT cliente) AS clientes_activos
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;
