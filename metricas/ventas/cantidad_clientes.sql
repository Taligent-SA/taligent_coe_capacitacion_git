--<<<<<<< feature/mvargas-cantidad-clientes
--=======
-- metrica: Cantidad de clientes activos
-- dueño: tu nombre
-- descripcion: Clientes distintos con al menos una compra en el período.

-->>>>>>> feature/favioterzaghi-cantidad-clientes
SELECT
    periodo,
    COUNT(DISTINCT cliente) AS clientes_activos
FROM ventas.comprobantes
WHERE anulado = 0
GROUP BY periodo;