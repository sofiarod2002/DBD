use ejercicio7;
-- Insertar datos en la tabla Tecnico
INSERT INTO Tecnico (codTec, nombre, especialidad) VALUES
(1, 'Juan Perez', 'Electrónica'),
(2, 'Ana Rodriguez', 'Mecánica'),
(3, 'Carlos Gomez', 'Informática');

-- Insertar datos en la tabla Repuesto
INSERT INTO Repuesto (codRep, nombre, stock, precio) VALUES
(101, 'Batería', 50, 100.00),
(102, 'Filtro de aceite', 30, 12.50),
(103, 'Memoria RAM', 100, 50.00);

-- Insertar datos en la tabla Reparacion
INSERT INTO Reparacion (nroReparac, codTec, precio_total, fecha) VALUES
(1001, 1, 120.00, '2023-01-15'),
(1002, 2, 35.00, '2023-02-20'),
(1003, 2, 200.00, '2023-03-10'),
(1004, 3, 200.00, '2023-03-10'),
(1005, 3, 200.00, '2023-03-10'),
(1006, 3, 200.00, '2023-03-10');

-- Insertar datos en la tabla RepuestoReparacion
INSERT INTO RepuestoReparacion (nroReparac, codRep, cantidad, precio) VALUES
(1001, 101, 2, 200.00),
(1001, 102, 1, 12.50),
(1002, 103, 2, 100.00),
(1003, 101, 4, 400.00);
