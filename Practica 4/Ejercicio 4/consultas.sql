-- Consultas Ejercicio 4

-- Ejercicio 1
SELECT p.nombre, p.apellido, a.dni
FROM alumno a
NATURAL JOIN persona p
WHERE año_ingreso < 2014;

-- Ejercicio 2
SELECT p.dni, p.matricula, pe.apellido, p.nombre
FROM profesor p
INNER JOIN persona pe ON (p.dni = pe.dni)
INNER JOIN profesor-curso pc ON (p.dni = pc.dni)
NATURAL JOIN CURSO c
WHERE (c.duracion > 100)
ORDER BY p.dni;

-- Ejercicio 3
SELECT a.dni, p.apellido, p.nombre, p.genero, p.fecha_nacimiento
FROM alumno a
INNER JOIN persona pe ON (p.dni = a.dni)
INNER JOIN alumno-curso pc ON (p.dni = pc.dni)
NATURAL JOIN CURSO c
WHERE (c.nombre = "Diseño de Base de Datos")
AND p.dni IN (
  SELECT a.dni
  FROM alumno a
  INNER JOIN persona pe ON (p.dni = a.dni)
  INNER JOIN alumno-curso pc ON (p.dni = pc.dni)
  WHERE pc.año=2019
);

-- Ejercicio 4
SELECT a.dni, p.nombre, p.apellido, ac.calificacion
FROM alumno a
INNER JOIN persona pe ON (p.dni = a.dni)
INNER JOIN alumno-curso pc ON (p.dni = pc.dni)
NATURAL JOIN CURSO c
WHERE ac.calificacion > 9
AND c.cod_curso IN (
  SELECT cu.cod_curso
  FROM curso cu
  INNER JOIN profesor-curso pc ON (cu.cod_curso = pc.cod_curso)
  INNER JOIN profesor p ON (p.dni = pc.dni)
  INNER JOIN persona pe ON (p.dni = pe.dni)
  WHERE pe.nombre = "Juan" AND pe.apellido = "Garcia"
)
ORDER BY apellido;

-- Ejercicio 5
SELECT COUNT(p.dni), p.apellido, p.nombre, pr.matricula
FROM persona p
INNER JOIN profesor pr ON (pr.dni = p.dni)
INNER JOIN titulo-profesor tl ON (tl.dni = pr.dni)
GROUP BY COUNT(p.dni), p.apellido, p.nombre, pr.matricula
HAVING COUNT(*) > 3
ORDER BY p.apellido, p.nombre

-- Ejercicio 6
SELECT p.dni, p.nombre, p.apellido, SUM(c.duracion) as cantidad_horas, AVG(c.duracion) as promedio_horas
FROM profesor pr
INNER JOIN persona pe ON (p.dni = pe.dni)
NATURAL JOIN CURSO c
INNER JOIN profesor-curso pc ON (cu.cod_curso = pc.cod_curso)
GROUP BY p.dni, p.nombre, p.apellido, SUM(c.duracion) as cantidad_horas, AVG(cantidad_horas)

-- Ejercicio 7

-- Ejercicio 8
SELECT a.dni, a.legajo, p.nombre, p.apellido, ac.calificacion
FROM alumno a
INNER JOIN persona pe ON (p.dni = a.dni)
INNER JOIN alumno-curso pc ON (p.dni = pc.dni)
NATURAL JOIN CURSO c
WHERE (c.nombre LIKE '%BD%' AMD c.año = 2018)
AND a.dni NOT IN (
  SELECT a.dni
  FROM alumno a
  INNER JOIN alumno-curso pc ON (a.dni = pc.dni)
  NATURAL JOIN CURSO c
  WHERE (c.nombre LIKE '%BD%' AMD c.año = 2019)
);

-- Ejercicio 9
INSERT INTO PERSONA (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
VALUES ("40801956", "Gomez", "Lucas", "13/01/2002", "Soltero", "Masculino")
INSERT INTO profesor (dni, matricula, nro_expediente) VALUES
("40801956", "145", "2")
INSERT INTO titulo-profesor (cod_titulo, dni,fecha) VALUES
("25","40801956", "14/06/2020");

-- Ejercicio 10
UPDATE Persona p
SET p.estado_civil = 'Divorciado'
WHERE EXISTS (
    SELECT a.dni
    FROM alumno a
    WHERE a.DNI = p.DNI AND a.legajo = '2020/09'
);

-- Ejercicio 11
DELETE FROM alumno a WHERE a.dni = "30568989"
DELETE FROM persona a WHERE a.dni = "30568989"
DELETE FROM alumno-curso a WHERE a.dni = "30568989"
