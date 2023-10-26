-- Consultas ejercicio 2
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

-- EJERCICIO 6
SELECT nombre, apellido, direccion, telefono
FROM cliente
WHERE not exists (
	SELECT * 
	FROM Agencia a
    WHERE not exists (
		SELECT *
        FROM Cliente c
        INNER JOIN Viaje v on (a.razon_social = v.razon_social)
        WHERE 
    )
    
inner join cuenta c on (pc.nroCuenta=c.nroCuenta)
 where c.nombreSucursal=s.nombreSucursal and               	        pc.codCliente=cliente.codCliente))