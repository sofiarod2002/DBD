-- parcial 2

-- 1
SELECT l.titulo,l.descripcion, g.nombre_genero
FROM libro l 
INNER JOIN Genero g ON (l.cod_genero = g.cod_genero)
INNER JOIN libroeditorial le ON (l.isbn = le.isbn)
INNER JOIN editorial e ON (e.codEditorial = le.codEditorial)
WHERE e.denominacion = 'Nueva Editorial'
ORDER BY l.titulo;

-- 2
SELECT s.nombre, s.apellido
FROM Socios s
WHERE s.fecha_ingreso BETWEEN '2022-09-01' AND '2022-09-31'
ORDER BY s.apellido, s.nombre;

-- 3
SELECT s.nombre, s.apellido, s.fecha_nac, COUNT(p.nro_socio) as prestramos
FROM Socio s 
INNER JOIN Prestamo p ON (p.nro_socio = s.nro_socio)
GROUP BY s.nombre, s.apellido, s.fecha_nac
HAVING COUNT(*)>5
ORDER BY s.apellido;

-- 4
SELECT s.nombre, s.apellido, s.dni
FROM Socio s 
INNER JOIN Prestamo p ON (p.nro_socio = s.nro_socio)
WHERE s.dni NOT IN (
	SELECT so.dni
	FROM Socio so 
	INNER JOIN Prestamo pr ON (pr.nro_socio = so.nro_socio)
    INNER JOIN libroeditorial le ON (pr.isbn = le.isbn)
	INNER JOIN editorial e ON (e.codEditorial = le.codEditorial)
    WHERE e.denominacion = 'Gran Editorial'
)
ORDER BY s.apellido, s.nombre;

-- 5
SELECT count(s.dni) as cantidad_socios
FROM Socios s
INNER JOIN Prestamo p ON (p.nro_socio = s.nro_socio) 
INNER JOIN Copia c ON (c.isbn = p.isbn) 
WHERE (c.estado = 'Bueno') AND s.dni IN (
	SELECT s.dni
	FROM Socios s
	INNER JOIN Prestamo p ON (p.nro_socio = s.nro_socio) 
    WHERE p.fecha > '2023-11-28'
)
GROUP BY s.dni;
