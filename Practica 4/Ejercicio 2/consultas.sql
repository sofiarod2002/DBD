USE ejercicio2;

-- Ejercicio 1
SELECT DISTINCT razon_social, direccion, telef -- consultar pq hay que usar el distinct
FROM agencia
NATURAL JOIN viaje v 
NATURAL JOIN ciudad c  
WHERE (v.cpOrigen = 1 AND v.cpDestino = 2)
ORDER BY razon_social, telef;

-- EJERCICIO 2
SELECT fecha, hora, dni, nombre, apellido, cpOrigen, cpDestino
FROM viaje v 
NATURAL JOIN cliente c
WHERE YEAR(v.fecha)=2019 AND (v.descripcion LIKE '%demorado%');

-- EJERCICIO 3
SELECT razon_social, telef, direccion, email
FROM viaje v 
NATURAL JOIN agencia a
WHERE YEAR(v.fecha)=2019 OR (a.email LIKE '%@jmail.com');

-- EJERCICIO 4 preguntar si esta bien
SELECT nombre, apellido, dni
FROM cliente c
NATURAL JOIN viaje v
WHERE (v.cpDestino = 2) AND 
	NOT c.dni IN (
	SELECT dni
	FROM cliente 
	NATURAL JOIN viaje vi
	WHERE (vi.cpDestino != 2) 
);

-- EJERCICIO 5
SELECT count(*) as cantidad, razon_social
FROM VIAJE v
WHERE (v.razon_social = 'Taxi Y' AND cpDestino = 3)
GROUP BY razon_social;

-- EJERCICIO 6 consultar si esta bien
SELECT nombre, apellido, direccion, telefono
FROM cliente
WHERE not exists (
	SELECT a.razon_social
	FROM Agencia a
    WHERE not exists (
		SELECT v.razon_social
        FROM viaje v
		WHERE (V.DNI = C.DNI AND v.razon_social = a.razon_social)
    )
);

-- EJERCICIO 7
UPDATE cliente
SET telefono = '221 4400897'
WHERE dni = '38495444';

-- EJERCICIO 8 
-- preguntar por enunciado mayor a que?

-- EJERCICIO 9
SELECT nombre, apellido, direccion, telefono, count(dni) as cant
FROM cliente c
NATURAL JOIN viaje v
GROUP BY nombre, apellido, direccion, telefono
HAVING cant >= 10;

-- EJERCICIO 10
DELETE FROM CLIENTE 
WHERE dni = '40325692'