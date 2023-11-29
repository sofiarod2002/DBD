-- EJERCICIO 5 PRACTICA 4 - DBD 2023

-- EJERCICIO 1
-- Listar especie, años, calle, nro. y localidad de árboles podados por el podador ‘Juan Perez’ y por el podador ‘Jose Garcia’.
SELECT a.especie, a.años, a.nro, l.nombreL
FROM arbol a 
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal) 
INNER JOIN Poda p ON (p.nroArbol = a.nro)
INNER JOIN Podador po ON (p.dni = po.dni)
WHERE (po.nombre = 'Juan' AND po.apellido = 'Perez')
	AND p.dni IN (
    SELECT pod.dni 
    FROM arbol ar
	INNER JOIN Poda poda ON (poda.nroArbol = ar.nro)
	INNER JOIN Podador pod ON (poda.dni = pod.dni)
    WHERE (pod.nombre = 'Jose' AND pod.apellido = 'Garcia')
    );

-- Ejercicio 2
-- Reportar DNI, nombre, apellido, fnac y localidad donde viven podadores que tengan podas durante 2018.
SELECT distinct(p.dni), p.nombre, p.fnac, l.nombreL
FROM Podador p 
INNER JOIN Localidad l ON (p.codigoPostalVive = l.codigoPostal)
INNER JOIN Poda po ON (p.dni = po.dni)
WHERE po.fecha BETWEEN "2018-01-01" AND "2018-12-31";

-- Ejercicio 3
-- Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca. 
SELECT a.especie, a.años, a.nro, l.nombreL
FROM arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
WHERE a.nroArbol NOT IN (
	SELECT p.nroArbol
    FROM Arbol ar
    INNER JOIN Poda p ON (p.nroArbol = ar.nroArbol)
    );

    
-- Ejercicio 4
-- Reportar especie, años,calle, nro y localidad de árboles que fueron podados durante 2017 y no fueron podados durante 2018.
SELECT a.especie, a.años, a.nro, a.calle, l.nombreL
FROM arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda p ON (p.nroArbol = a.nro)
WHERE (p.fecha BETWEEN "2017-01-01" AND "2017-12-31")
	AND a.nro NOT IN (
    SELECT a.nro
	FROM arbol ar
	INNER JOIN Poda pod ON (pod.nroArbol = ar.nro)
	WHERE (pod.fecha BETWEEN "2018-01-01" AND "2018-12-31")
    );
    -- solo tiene que salir el arbol 3
    
-- Ejercicio 5
-- Reportar DNI, nombre, apellido, fnac y localidad donde viven podadores con apellido terminado con el string ‘ata’
--  y que el podador tenga al menos una poda durante 2018. Ordenar por apellido y nombre.
SELECT p.dni, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p
INNER JOIN Localidad l ON (p.codigoPostalVive = l.codigoPostal) 
WHERE (p.apellido LIKE "%ata") AND p.dni IN (
    SELECT po.dni
	FROM Podador po
	INNER JOIN Poda pod ON (pod.dni = po.dni)
	WHERE (pod.fecha BETWEEN "2018-01-01" AND "2018-12-31")
	)
ORDER BY p.apellido, p.nombre;

-- Ejercico 6
-- Listar DNI, apellido, nombre, teléfono y fecha de nacimiento de podadores que solo podaron árboles de especie ‘Coníferas’.
SELECT p.dni, p.nombre, p.apellido, p.fnac, p.telefono
FROM Podador p
INNER JOIN Poda po ON (po.dni = p.dni)
INNER JOIN Arbol a ON (a.nro = po.nroArbol)
WHERE a.nroArbol = 5
AND p.dni NOT IN (
	SELECT pod.dni
	FROM Podador pod
	INNER JOIN Poda poda ON (poda.dni = pod.dni)
	INNER JOIN Arbol ar ON (ar.nro = poda.nroArbol)
	WHERE ar.especie != "Coniferas"
	);
    -- solo tiene que salir ana gomez
    
-- Ejercicio 7
-- Listar especie de árboles que se encuentren en la localidad de ‘La Plata’ y también en la localidad de ‘Salta’.
SELECT a.especie
FROM Arbol a
INNER JOIN Localidad l ON (l.codigoPostal = a.codigoPostal)
WHERE (l.nombreL = "La Plata") AND a.nro IN (
	SELECT ar.nro
	FROM Arbol ar
	INNER JOIN Localidad lo ON (lo.codigoPostal = ar.codigoPostal)
	WHERE (l.nombreL = "Salta")
); 

-- Ejercicio 8
-- Eliminar el podador con DNI: 22234566.
DELETE FROM Podador 
WHERE dni = "22234566";
DELETE FROM Poda
WHERE dni = "22234566";

-- Ejercicio 9
--  Reportar nombre, descripción y cantidad de habitantes de localidades que tengan menos de 100 árboles.
SELECT l.nombreL, l.descripcion, l.habitantes
FROM Localidad l 
INNER JOIN Arbol a ON (a.codigoPostal = l.codigoPostal)
GROUP BY l.nombreL, l.descripcion, l.habitantes
HAVING count(a.nro) < 100;