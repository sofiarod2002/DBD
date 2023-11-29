-- Ejercicio 6
-- DBD 2023

-- Ejercicio 1
-- Listar todos los repuestos, informando el nombre, stock y precio. Ordenar el resultado por precio
SELECT nombre, stock, precio
FROM Repuesto
ORDER BY precio;

-- Ejercicio 2
-- Listar nombre, stock, precio de repuesto que participaron en reparaciones durante 2019 y además no participaron en reparaciones del técnico ‘José Gonzalez’.
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r 
INNER JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
INNER JOIN Reparacion rep ON (rep.nroReparacion = rr.nroReparacion)
WHERE (YEAR(rep.fecha)=2019) AND rep.nroReparacion NOT IN (
	SELECT re.nroReparacion
    FROM Reparacion re
    INNER JOIN Tecnico t ON (t.codTec = re.codTec)
    WHERE t.nombre = 'Jose Gonsalez'
);

-- Ejercicio 3
-- Listar el nombre, especialidad de técnicos que no participaron en ninguna reparación. Ordenar por nombre ascendentemente.
SELECT t.nombre, t.especialidad
FROM Tecnico t
WHERE t.codTec NOT IN (
	SELECT te.codTec
    FROM Tecnico te
    INNER JOIN Reparacion r ON (r.codTec = te.codTec)
)
ORDER BY t.nombre;

-- Ejercicio 4
-- Listar el nombre, especialidad de técnicos solo participaron en reparaciones durante 2018.
SELECT t.nombre, t.especialidad
FROM Tecnico t
INNER JOIN Reparacion r ON (t.codTec = r.codTec) 
WHERE YEAR(re.fecha)=2018 AND t.codTec NOT IN (
	SELECT te.codTec
	FROM Tecnico te
	INNER JOIN Reparacion re ON (te.codTec = re.codTec) 
	WHERE YEAR(re.fecha)!=2018
);

/* Ejercicio 5
Listar para cada repuesto nombre, stock y cantidad de técnicos distintos que lo utilizaron.
Si un repuesto no participó en alguna reparación igual debe aparecer en dicho listado. */
SELECT r.nombre, r.stock, COUNT(distinct rep.codTec) AS tecnicos
FROM Repuesto r
LEFT JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
INNER JOIN Reparacion rep ON (rep.nroReparacion = rr.nroReparacion)
GROUP BY r.nombre,r.stock;

/* Ejercicio 6 
Listar nombre y especialidad del técnico con mayor cantidad de reparaciones
realizadas y el técnico con menor cantidad de reparaciones. */
SELECT t.nombre, t.especialidad 
FROM Tecnico t
INNER JOIN Reparacion r ON (r.codTec = t.codTec)
GROUP BY t.nombre, t.especialidad
HAVING COUNT(*) >=ALL(
    SELECT COUNT(*)
    FROM Reparacion repa
    GROUP BY repa.codTec
)
UNION
	SELECT te.nombre, te.especialidad
	FROM Tecnico te
	INNER JOIN Reparacion re ON (re.codTec = te.codTec)
	GROUP BY te.nombre, te.especialidad
	HAVING COUNT(*) <=ALL(
		SELECT COUNT(*)
		FROM Reparacion repa
		GROUP BY repa.codTec
);

/*Ejercicio 7
Listar nombre, stock y precio de todos los repuestos con stock mayor a 0 y que
dicho repuesto no haya estado en reparaciones con precio_total superior a 10000. */
SELECT r.nombre, r.precio, r.stock
FROM Repuesto r 
WHERE (r.stock > 0) AND r.codRep NOT IN (
	SELECT re.codRep
    FROM repuesto re
    INNER JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
    INNER JOIN Repacaion rep ON (rep.codRep = rr.codRep)
    WHERE rep.precio_total < 10000
);

/* Ejercicio 8
Proyectar precio, fecha y precio total de aquellas reparaciones donde se utilizó algún
repuesto con precio en el momento de la reparación mayor a $1000 y menor a
$5000. */
SELECT r.precio, re.fecha, re.precio_total
FROM Repuesto r
INNER JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
WHERE rr.precio BETWEEN 1000 and 5000;

/*Ejercicio 9
Listar nombre, stock y precio de repuestos que hayan sido utilizados en todas las
reparaciones*/
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r 
WHERE NOT exists(
    SELECT rr.codRep
    FROM RepuestoReparacion rr
    WHERE NOT EXISTS(
        SELECT r2.codRep
        FROM Repuesto r2, RepuestoReparacion rr2
        WHERE (r2.codRep = rr2.codRep) AND (r2.codRep = r.codRep)
    )
);

/* Ejercicio 10
Listar fecha, técnico y precio total de aquellas reparaciones que necesitaron al menos 10 repuestos distintos */
SELECT r.fecha, r.codTec, r.precio_total
FROM Reparacion r 
INNER JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
GROUP BY r.fecha, r.codTec, r.precio_total
HAVING COUNT(distinct rr.codRep) >= 10