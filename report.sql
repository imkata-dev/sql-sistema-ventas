-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados
select *
from clientes c ;

-- 2. Mostrar todos los productos disponibles
select *
from productos p;

-- 3. Mostrar todas las ventas realizadas
select *
from ventas v;

-- 4. Mostrar solo nombre y email de clientes
select nombre, email
from clientes c;

-- 5. Mostrar solo nombre y precio de productos
select nombre, precio
from productos p ;
-- 6. Productos con precio mayor a 50000
select nombre precio
from productos p 
where precio < 50000

-- 7. Ventas realizadas el 2026-04-02
select * from ventas v 
where v.fecha = '2026-04-02'

-- 8. Productos ordenados de mayor a menor precio
select productos 
from productos
order by precio desc;


-- 9. Clientes ordenados por nombre
select nombre
from clientes c 
order by nombre ASC


-- 10. Detalles de venta con cantidad >= 2
select * from detalle_venta dv 
where cantidad >=2

-- 11. Total de clientes
SELECT COUNT(*) total_clientes
FROM clientes c;

-- 12. Total de productos
SELECT COUNT(*) total_productos
FROM productos;

-- 13. Total de ventas
select COUNT(*) total_ventas
from ventas;

-- 14. Precio promedio de productos
select AVG(precio) promedio_productos
from productos;

-- 15. Suma total de precios de productos
select  SUM(precio) precio_productos
from productos;

-- 16. Mostrar venta + nombre del cliente + fecha
select v.id_ventas, c.nombre, v.fecha;
from ventas v
join clientes c 
on v.id_venta = c.id_cliente;

-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad
select detalle_venta.id_venta, productos.nombre as nombre_producto, detalle_venta.cantidad
from detalle_venta
join productos 
on detalle_venta.id_producto = productos.id_producto;


-- 18. Mostrar nombre del cliente + id de venta + fecha
select clientes.nombre nombre_cliente, ventas.id_venta, ventas.fecha
from ventas
join clientes
where ventas.id_cliente = clientes.id_cliente;


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta
select p.nombre nombre_producto, dv.cantidad cantidad_vendida, dv.id_venta
from detalle_venta dv, productos p
where dv.id_producto = p.id_producto;


-- 20. Mostrar cuántas ventas ha realizado cada cliente
select c.nombre nombre_cliente, count(v.id_venta) total_ventas
from clientes c, ventas v
where v.id_cliente = c.id_cliente
group by c.nombre;

-- 21. Mostrar solo los clientes con más de una venta
select c.nombre nombre_cliente, count(v.id_venta) total_ventas
from clientes c, ventas v
where v.id_cliente = c.id_cliente
group by c.nombre
having count(v.id_venta) > 1;

-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta
select p.nombre nombre_producto, count(dv.id_producto) total_apariciones
from detalle_venta dv, productos p
where dv.id_producto = p.id_producto
group by p.nombre;


-- 23. Mostrar solo los productos que aparecen más de una vez
select p.nombre nombre_producto, count(dv.id_producto) total_apariciones
from detalle_venta dv, productos p
where dv.id_producto = p.id_producto
group by p.nombre
having count(dv.id_producto) > 1;

-- 24. Mostrar las ventas que tienen más de un producto asociado
select id_venta, count(id_producto) total_productos
from detalle_venta
group by id_venta
having count(id_producto) > 1;

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2
select  c.nombre nombre_cliente, sum(dv.cantidad) total_unidades
from clientes c
join ventas v ON c.id_cliente = v.id_cliente
join detalle_venta dv ON v.id_venta = dv.id_venta
group by c.nombre
having sum(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
SELECT p.nombre nombre_producto, p.precio
FROM productos p
WHERE p.nombre = 'Esto es una consulta trampa, cuidado!!';

-- Explicar por qué el resultado vacío es correcto

--el resultado es correcto debido a que la consulta no contiene una erro de sintaxis en particular, 
-- mientras que el where esta buscando algun registro en las tablas, la base de datos al no encontrar coincidencia alguna,
--la base de datos devuelve en "blanco/vacio", significa que es una respuesta valida pero que ningun dato cumple la condicion