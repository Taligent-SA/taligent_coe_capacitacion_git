-- metrica: Cantidad de clientes activos
-- dueño: tu nombre
-- descripcion: Clientes distintos con al menos una compra en el período.
select
    periodo,
    sum(cantidad_clientes) as cantidad_clientes
from
    ventas.comprobantes
where anulado = 0
group by
    periodo;
