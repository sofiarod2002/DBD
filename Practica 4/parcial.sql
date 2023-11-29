-- Parcial

-- 2 
SELECT *
FROM Paciente p
WHERE not exists (
	Select * 
    FROM Especialista e
    where not exists (
    SELECT *
    FROM turno t
    WHERE t.matricula = e.matricula AND p.dni = t.dni
    )
);

-- 3
SELECT p.dni, p.nombre, p.apellido
FROM Paciente p 
INNER JOIN Turno t ON (t.dni = p.dni)
WHERE YEAR(t.fecha)=2021 -- fecha between '2021-01-01' AND '2021-12-31'
AND p.dni NOT IN (
	SELECT pa.dni
	FROM Paciente pa  
	INNER JOIN Turno tu ON (tu.dni = pa.dni)
	WHERE YEAR(t.fecha)=2019 
);

-- 4
SELECT p.dni, p.nombre, p.apellido
FROM Paciente p 
INNER JOIN Turno t ON (t.dni = p.dni)
WHERE t.nombre = 'OSDE'
AND p.dni IN (
	SELECT pa.dni
	FROM Paciente pa  
	INNER JOIN Turno tu ON (tu.dni = pa.dni)
	WHERE tu.nombre = 'IOMA'
);

-- 5
SELECT e.nombre, COUNT(t.matriucla) as cantidad_turnos
FROM Especialista e 
INNER JOIN Turno t ON (t.matricula = e.matricula)
WHERE YEAR(t.fecha)=2022
GROUP BY e.nombre,e.matricula;

-- 6
SELECT p.dni, p.nombre, p.apellido
FROM Paciente p
INNER JOIN Turno t ON (p.dni = t.dni)
WHERE YEAR(t.fecha)=2020
GROUP BY p.dni, p.nombre, p.apellido
HAVING count(t.fecha)>5
