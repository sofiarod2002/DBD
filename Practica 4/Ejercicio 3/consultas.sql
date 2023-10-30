-- Practica 4 Ejercicio 3- DBD 2023
-- CONSULTAS
use ejercicio3;

-- Ejercicio 1
SELECT c.nombre, c.anioFundacion 
FROM club c
JOIN ciudad ci on ci.codigoCiudad = c.codigoCiudad
WHERE ci.nombre = 'La Plata' 
AND c.codigoClub NOT IN (
	SELECT e.codigoClub
    FROM estadio e 
);

-- EJERCICIO 2
SELECT cl.nombre
FROM Club cl
WHERE cl.codigoClub NOT IN (
    SELECT DISTINCT cj.codigoClub
    FROM ClubJugador cj
    NATURAL JOIN Jugador j
    JOIN Ciudad ciu ON j.codigoCiudad = ciu.codigoCiudad
    WHERE ciu.nombre = 'Berisso'
);

-- EJERCICIO 3 
SELECT j.dni, j.apellido, j.nombre
FROM jugador j 
JOIN clubjugador cj ON (cj.DNI = j.DNI)
JOIN club cl ON (cl.codigoClub = cj.codigoClub)
WHERE (cl.codigoClub = 101);

-- EJERCICIO 4
SELECT j.dni, j.nombre, j.apellido
FROM jugador j 
WHERE (j.edad > 29) 
AND j.dni IN(
	SELECT ju.dni
	FROM jugador ju 
	JOIN clubjugador cj ON (cj.DNI = ju.DNI)
	JOIN club cl ON (cl.codigoClub = cj.codigoClub)
	JOIN ciudad ci on ci.codigoCiudad = cl.codigoCiudad 
	WHERE (ci.nombre = 'Cordoba')
);	

-- EJERCICIO 5
SELECT ROUND(AVG(j.edad), 2) as promedio, c.nombre
FROM jugador j 
JOIN clubjugador cj ON j.dni = cj.dni
JOIN club c ON cj.codigoClub = c.codigoClub
GROUP BY c.nombre;

-- EJERCICIO 6
SELECT j.nombre, j.apellido, j.edad, COUNT(cj.dni) as cantidadClubes
FROM jugador j
NATURAL JOIN clubjugador cj
GROUP BY cj.dni;

-- EJERCICIO 7
SELECT c.nombre, j.dni
FROM club c
JOIN clubjugador cj ON c.codigoClub = cj.codigoClub
JOIN jugador j ON cj.dni = j.dni
WHERE j.dni NOT IN (
	SELECT j.dni
	FROM club c
	JOIN clubjugador cj ON c.codigoClub = cj.codigoClub
	JOIN jugador j ON cj.dni = j.dni
    JOIN ciudad ci on ci.codigoCiudad = j.codigoCiudad
    WHERE ci.nombre = 'Mar del Plata'
);

-- EJERCICIO 8
-- es con division tengo que pensarlo
-- EJERCICIO 9
INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad) VALUES
(1234, 'Estrella de Berisso', 1921, 'Beriso'); -- como hago aca para poner berisso, pongo el codigo directamente?