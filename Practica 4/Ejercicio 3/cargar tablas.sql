-- Cargar datos en las tablas
INSERT INTO Ciudad (codigoCiudad, nombre) VALUES
(1, 'La Plata'),
(2, 'Berisso'),
(3, 'Córdoba'),
(4, 'Mar del Plata');

INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad) VALUES
(101, 'Club A', 1950, 1),
(102, 'Club B', 1960, 1),
(103, 'Club C', 1970, 2),
(104, 'Club D', 1980, 3),
(105, 'Club E', 1990, 3),
(106, 'Club F', 2000, 1),
(107, 'Club G', 2002, 1);

INSERT INTO Estadio (codigoEstadio, codigoClub, nombre, direccion) VALUES
(201, 101, 'Estadio A', 'Calle 1, La Plata'),
(202, 102, 'Estadio B', 'Calle 2, La Plata'),
(203, 103, 'Estadio C', 'Calle 3, Berisso');

INSERT INTO Jugador (DNI, nombre, apellido, edad, codigoCiudad) VALUES
(1001, 'Jugador1', 'Apellido1', 25, 1),
(1002, 'Jugador2', 'Apellido2', 30, 1),
(1003, 'Jugador3', 'Apellido3', 28, 2),
(1004, 'Jugador4', 'Apellido4', 32, 3),
(1005, 'Jugador5', 'Apellido5', 27, 4);

INSERT INTO ClubJugador (codigoClub, DNI, desde, hasta) VALUES
(102, 1001, '2010-01-01', '2018-12-31'),
(101, 1001, '2020-01-01', '2022-12-31'),
(101, 1002, '2021-01-01', '2022-12-31'),
(103, 1003, '2019-01-01', '2020-12-31'),
(104, 1004, '2018-01-01', '2020-12-31'),
(105, 1005, '2020-01-01', '2022-12-31');