-- Consultas
-- EJERCICIO 1
SELECT apellido, dni
FROM Cliente
WHERE (apellido LIKE 'Pe%')
ORDER BY dni; 

-- EJERCICIO 2
SELECT nombre, apellido, dni, telefono, direccion
FROM Cliente c NATURAL JOIN Factura f 
WHERE YEAR(f.fecha) = 2017
AND c.idCliente NOT IN ( -- esto podria ser un except, creo que no cambia mucho
    SELECT c.idCliente
    FROM Cliente c NATURAL JOIN Factura f 
    WHERE YEAR(f.fecha) != 2017
);

-- Ejercicio 3
SELECT nombre, descripcion, stock, precio
FROM Detalle 
NATURAL JOIN Producto p
NATURAL JOIN Cliente c 
NATURAL JOIN Factura 
WHERE (c.dni = '45789456')
AND p.idProducto NOT IN (
    SELECT idProducto
	FROM Detalle
	NATURAL JOIN Producto  
	NATURAL JOIN Cliente cl 
    NATURAL JOIN Factura
    WHERE (cl.apellido = 'Garcia')
);

-- Ejercicio 4
SELECT nombreP, descripcion, stock, precio
FROM Detalle 
NATURAL JOIN Producto p
WHERE p.idProducto NOT IN (
    SELECT idProducto
	FROM Detalle
	NATURAL JOIN Producto  
	NATURAL JOIN Cliente cl 
    NATURAL JOIN Factura
    WHERE (telefono LIKE '221%')
)
ORDER BY nombreP;

-- Ejercicio 5
SELECT nombreP, descripcion, precio, COUNT(*)
FROM producto 
NATURAL JOIN detalle
GROUP BY idProducto;

-- Ejercicio 6
SELECT nombre, apellido, dni, telefono, direccion
FROM Cliente c
NATURAL JOIN detalle
NATURAL JOIN producto p
NATURAL JOIN factura
WHERE (nombreP = 'prod1' AND nombreP = 'prod2') -- aca hace falta aclarar p.nombreP ?
AND c.idCliente NOT IN (
SELECT idCliente
FROM Cliente cl
NATURAL JOIN detalle
NATURAL JOIN producto pr 
NATURAL JOIN factura
WHERE (pr.nombreP = 'prod3')
);

-- Ejercicio 7
SELECT nroTicket, total, fecha, hora, dni
FROM factura f
NATURAL JOIN detalle
NATURAL JOIN producto p
NATURAL JOIN cliente
WHERE p.nombreP = 'prod38' or YEAR(f.fecha)=2019;

-- Ejercicio 8
INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
VALUES (16, 'Jorge Luis', 'Castor', '40578999', '221-4400789', '11 2587 entre 500 y 501');

-- Ejercicio 9
SELECT nroTicket, total, fecha, hora
FROM factura
NATURAL JOIN cliente c
NATURAL JOIN detalle
NATURAL JOIN producto p
WHERE (c.nombre = 'Jorge' AND c.apellido = 'Perez' ) AND (p.nombreP != 'Z');

-- Ejercicio 10
SELECT dni, apellido, nombre, SUM(cantidad*preciounitario) AS total
FROM cliente
NATURAL JOIN factura
NATURAL JOIN detalle
GROUP BY idCliente
HAVING total > 1000000;