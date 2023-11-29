-- Insertar datos en la tabla PERSONA
INSERT INTO PERSONA (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero) VALUES
(12345678, 'Pérez', 'Juan', '1990-01-15', 'Soltero', 'Masculino')
(22222222, 'Apellido2', 'Nombre2', '1990-03-20', 'Casado', 'Femenino')
(11111111, 'Apellido1', 'Nombre1', '1995-01-15', 'Soltero', 'Masculino')
(33333333, 'Apellido3', 'Nombre3', '1997-07-10', 'Soltero', 'Masculino');

-- Insertar datos en la tabla ALUMNO
INSERT INTO ALUMNO (DNI, Legajo, Año_Ingreso) VALUES
(12345678, '2020/09', 2020)
(22222222, '2012/02', 2012)
(11111111, '2013/01', 2013)
(33333333, '2011/03', 2011);


-- Insertar datos en la tabla PROFESOR
INSERT INTO PROFESOR (DNI, Matricula, Nro_Expediente)
VALUES (87654321, 'MAT12345', 'EXP9876');

-- Insertar datos en la tabla TITULO
INSERT INTO TITULO (Cod_Titulo, Nombre, Descripcion)
VALUES (25, 'Título 25', 'Descripción del título 25');

-- Insertar datos en la tabla TITULO_PROFESOR
INSERT INTO TITULO_PROFESOR (Cod_Titulo, DNI, Fecha)
VALUES (25, 87654321, '2020-05-10');

-- Insertar datos en la tabla CURSO
INSERT INTO CURSO (Cod_Curso, Nombre, Descripcion, Fecha_Creacion, Duracion)
VALUES (1, 'Curso 1', 'Descripción del Curso 1', '2020-01-01', 120);

-- Insertar datos en la tabla ALUMNO_CURSO
INSERT INTO ALUMNO_CURSO (DNI, Cod_Curso, Año, Desempeño, Calificacion) VALUES
(12345678, 1, 2019, 'Bueno', 9.5)
(12345678, 1, 2019, 'Bueno', 9.5),
(22222222, 2, 2019, 'Excelente', 10.0),
(11111111, 3, 2019, 'Aceptable', 7.8);;
