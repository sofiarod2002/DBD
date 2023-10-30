-- Cargar tablas

-- Cargar agencia
INSERT INTO AGENCIA (razon_social, direccion, telef, email) VALUES
    ('Agencia 1', 'Calle 123', '123-456-7890', 'agencia1@example.com'),
    ('Agencia 2', 'Calle 456', '987-654-3210', 'agencia2@example.com'),
    ('Agencia 3', 'Avenida X', '111-222-3333', 'agencia3@example.com'),
    ('Agencia 4', 'Calle Y', '444-555-6666', 'agencia4@example.com'),
    ('Agencia 5', 'Avenida Z', '777-888-9999', 'agencia5@example.com'),
    ('Agencia 6', 'Calle W', '123-321-4567', 'agencia6@example.com'),
    ('Agencia 7', 'Avenida V', '999-888-7777', 'agencia7@example.com'),
    ('Agencia 8', 'Calle U', '654-321-1234', 'agencia8@example.com'),
    ('Agencia 9', 'Avenida T', '123-987-6543', 'agencia9@example.com'),
    ('Agencia 10', 'Calle S', '777-555-3333', 'agencia10@example.com');

-- Cargar ciudades
INSERT INTO CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreacion) VALUES
    (1, 'La Plata', 1852),
    (2, 'Coronel Brandsen', 1800),
    (3, 'Villa Elisa', 1900),
    (4, 'Berisso', 1871),
    (5, 'Ensenada', 1811),
    (6, 'Cityville', 2000),
    (7, 'Pueblito', 1990),
    (8, 'Otro Lugar', 2005),
    (9, 'Nueva Ciudad', 2010),
    (10, 'Ciudad Feliz', 1985);

-- Cargar clientes
INSERT INTO CLIENTE (DNI, nombre, apellido, telefono, direccion) VALUES
    ('12345678', 'Juan', 'Roma', '221-111-1111', 'Calle A'),
    ('87654321', 'María', 'Gómez', '222-222-2222', 'Calle B'),
    ('38495444', 'Pedro', 'López', '223-333-3333', 'Calle C'),
    ('78901234', 'Ana', 'Martínez', '224-444-4444', 'Calle D'),
    ('56789012', 'Luis', 'Fernández', '225-555-5555', 'Calle E'),
    ('23456789', 'Sofía', 'Pérez', '226-666-6666', 'Calle F'),
    ('45678901', 'Carlos', 'González', '227-777-7777', 'Calle G'),
    ('90123456', 'Lorena', 'Hernández', '228-888-8888', 'Calle H'),
    ('67890123', 'Federico', 'Díaz', '229-999-9999', 'Calle I'),
    ('34567890', 'Laura', 'Torres', '220-000-0000', 'Calle J');

-- Cargar viajes
INSERT INTO VIAJE (FECHA, HORA, DNI, cpOrigen, cpDestino, razon_social, descripcion) VALUES
    ('2019-01-15', '08:30:00', '12345678', 1, 2, 'Agencia 1', 'Viaje demorado a Coronel Brandsen'),
    ('2019-02-05', '10:00:00', '87654321', 2, 3, 'Agencia 2', 'Viaje a Villa Elisa'),
    ('2019-03-20', '12:45:00', '38495444', 3, 4, 'Agencia 3', 'Viaje rápido a Berisso'),
    ('2020-05-10', '14:30:00', '78901234', 4, 5, 'Agencia 4', 'Viaje tranquilo a Ensenada'),
    ('2021-11-30', '16:15:00', '56789012', 5, 6, 'Agencia 5', 'Viaje a Cityville'),
    ('2019-12-25', '18:00:00', '23456789', 6, 7, 'Agencia 6', 'Viaje navideño a Pueblito'),
    ('2020-04-12', '20:00:00', '45678901', 7, 8, 'Agencia 7', 'Viaje sorpresa a Otro Lugar'),
    ('2019-07-07', '22:00:00', '90123456', 8, 9, 'Agencia 8', 'Viaje especial a Nueva Ciudad'),
    ('2022-09-01', '01:00:00', '67890123', 9, 10, 'Agencia 9', 'Viaje nocturno a Ciudad Feliz'),
    ('2018-08-08', '03:00:00', '34567890', 10, 1, 'Agencia 10', 'Viaje a La Plata');

-- agrego viajes para probar ejercicio 9
INSERT INTO VIAJE (FECHA, HORA, DNI, cpOrigen, cpDestino, razon_social, descripcion) VALUES
    ('2020-01-15', '20:30:00', '12345678', 1, 2, 'Agencia 2', 'Viaje sin problemas'),
    ('2019-03-15', '09:30:00', '12345678', 1, 2, 'Agencia 5', 'Viaje demorado a Cordoba'),
    ('2015-01-15', '08:40:00', '12345678', 1, 2, 'Agencia 6', 'Viaje a la costa atlantica');
-- cambie destino del cliente 14
UPDATE viaje
SET cpDestino =  2
WHERE dni = '38495444';

UPDATE viaje
SET dni = '38495444'
WHERE fecha = '2018-08-08';