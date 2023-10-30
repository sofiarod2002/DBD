-- Insertar 15 clientes en la tabla Cliente
INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
VALUES
  (1, 'Juan', 'Pérez', '123456789', '111-111-1111', 'Calle A #123'),
  (2, 'María', 'López', '234567890', '222-222-2222', 'Calle B #456'),
  (3, 'Pedro', 'González', '345678901', '333-333-3333', 'Calle C #789'),
  (4, 'Ana', 'Martínez', '456789012', '444-444-4444', 'Calle D #012'),
  (5, 'Luis', 'Hernández', '567890123', '555-555-5555', 'Calle E #345'),
  (6, 'Laura', 'Ramírez', '678901234', '666-666-6666', 'Calle F #678'),
  (7, 'Carlos', 'Torres', '789012345', '777-777-7777', 'Calle G #901'),
  (8, 'Sofía', 'Sánchez', '890123456', '888-888-8888', 'Calle H #234'),
  (9, 'Javier', 'Rodríguez', '901234567', '999-999-9999', 'Calle I #567'),
  (10, 'Marcela', 'Díaz', '012345678', '101-010-1010', 'Calle J #890'),
  (11, 'Eduardo', 'Moreno', '112233445', '111-111-1122', 'Calle K #123'),
  (12, 'Isabel', 'Fernández', '223344556', '222-222-2233', 'Calle L #234'),
  (13, 'Ricardo', 'Pardo', '334455667', '333-333-3344', 'Calle M #345'),
  (14, 'Camila', 'Suárez', '445566778', '444-444-4455', 'Calle N #456'),
  (15, 'Fernando', 'Lara', '556677889', '555-555-5566', 'Calle O #567');

-- cambie apellido del cliente 14
UPDATE Cliente
SET Apellido = 'Peralta'
WHERE idCliente = 14;

-- cambie apellido del cliente 14
UPDATE Cliente
SET dni =  45789456
WHERE idCliente = 14;
-- Insertar 15 facturas en la tabla Factura
INSERT INTO Factura (nroTicket, total, fecha, hora, idCliente)
VALUES
  (1, 100.00, '2017-01-14', '8:30:00', 1),
  (2, 150.50, '2023-01-02', '09:15:00', 2),
  (3, 75.25, '2017-01-14', '10:00:00', 3),
  (4, 200.75, '2023-01-04', '11:30:00', 4),
  (5, 50.00, '2017-01-14', '12:45:00', 5),
  (6, 175.50, '2023-01-06', '14:00:00', 6),
  (7, 90.75, '2023-01-07', '15:15:00', 7),
  (8, 300.25, '2023-01-08', '16:30:00', 8),
  (9, 125.00, '2023-01-09', '17:45:00', 9),
  (10, 250.50, '2023-01-10', '18:00:00', 10),
  (11, 110.25, '2023-01-11', '19:15:00', 11),
  (12, 90.00, '2023-01-12', '20:30:00', 12),
  (13, 160.75, '2023-01-13', '21:45:00', 13),
  (14, 185.50, '2023-01-14', '22:00:00', 14),
  (15, 220.25, '2023-01-15', '23:15:00', 15);

-- cambie informacion del cliente 15
UPDATE Factura
SET idCliente = 1
WHERE nroTicket = 15;
-- Insertar 10 productos en la tabla Producto
INSERT INTO Producto (idProducto, descripcion, precio, nombreP, stock)
VALUES
  (1, 'Producto 1', 50.00, 'ProductoA', 100),
  (2, 'Producto 2', 25.08, 'ProductoB', 200),
  (3, 'Producto 3', 150.50, 'ProductoC', 150),
  (4, 'Producto 4', 100.37, 'ProductoD', 50),
  (5, 'Producto 5', 43.88, 'ProductoE', 75),
  (6, 'Producto 6', 300.25, 'ProductoF', 25),
  (7, 'Producto 7', 110.25, 'ProductoG', 80),
  (8, 'Producto 8', 88.50, 'ProductoH', 120),
  (9, 'Producto 9', 80.25, 'ProductoI', 60),
  (10, 'Producto 10', 83.50, 'ProductoJ', 90);

-- Insertar detalles de 15 facturas en la tabla Detalle
INSERT INTO Detalle (nroTicket, idProducto, cantidad, precioUnitario)
VALUES
  (1, 1, 2, 50.00),
  (2, 3, 1, 150.50),
  (3, 2, 3, 25.08),
  (4, 4, 2, 100.37),
  (5, 1, 1, 50.00),
  (6, 5, 4, 43.88),
  (7, 3, 2, 45.38),
  (8, 6, 1, 300.25),
  (9, 2, 2, 62.50),
  (10, 1, 3, 83.50),
  (11, 7, 1, 110.25),
  (12, 5, 1, 43.88),
  (13, 9, 2, 80.25),
  (14, 4, 3, 61.83),
  (15, 8, 2, 88.50);

