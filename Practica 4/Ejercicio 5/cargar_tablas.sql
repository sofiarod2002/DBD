USE ejercicio5;

INSERT INTO Localidad (CodigoPostal, nombreL, descripcion, habitantes) VALUES
(1000, 'La Plata', 'Capital de la provincia de Buenos Aires', 700000),
(2000, 'Salta', 'Ciudad en el norte de Argentina', 600000);

-- Insertar datos en la tabla Arbol
INSERT INTO Arbol (nroArbol, especie, años, calle, nro, codigoPostal) VALUES
(1, 'Pino', 10, 'Calle A', 123, 1000),
(2, 'Roble', 15, 'Calle B', 456, 1000),
(3, 'Eucalipto', 8, 'Calle C', 789, 2000),
(5, 'Coniferas', 8, 'Calle C', 789, 2000),
(4, 'Fresno', 12, 'Calle D', 101, 2000);

-- Insertar datos en la tabla Podador
INSERT INTO Podador (DNI, nombre, apellido, telefono, fnac, codigoPostalVive) VALUES
(11122333, 'Juan', 'Perez', '123-456-7890', '1980-05-10', 1000),
(22233444, 'Jose', 'Garcia', '987-654-3210', '1985-08-20', 2000),
(22255522, 'Luis', 'Vata', '987-654-3210', '1985-08-20', 2000),
(33344555, 'Ana', 'Gomez', '555-555-5555', '1990-02-15', 1000);

-- Insertar datos en la tabla Poda
INSERT INTO Poda (codPoda, fecha, DNI, nroArbol) VALUES
(1, '2018-06-15', 11122333, 1),
(2, '2018-07-20', 11122333, 2),
(8, '2018-07-20', 22255522, 2),
(3, '2017-03-10', 22233444, 5),
(10, '2017-03-10', 22233444, 3),
(4, '2018-03-10', 33344555, 5);