-- Crear la base de datos
CREATE DATABASE ejercicio3;
USE ejercicio3;
-- Crear la tabla Ciudad
CREATE TABLE Ciudad (
    codigoCiudad INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Club
CREATE TABLE Club (
    codigoClub INT PRIMARY KEY,
    nombre VARCHAR(255),
    anioFundacion INT,
    codigoCiudad INT,
    FOREIGN KEY (codigoCiudad) REFERENCES Ciudad(codigoCiudad)
);

-- Crear la tabla Estadio
CREATE TABLE Estadio (
    codigoEstadio INT PRIMARY KEY,
    codigoClub INT,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    FOREIGN KEY (codigoClub) REFERENCES Club(codigoClub)
);

-- Crear la tabla Jugador
CREATE TABLE Jugador (
    DNI INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    edad INT,
    codigoCiudad INT,
    FOREIGN KEY (codigoCiudad) REFERENCES Ciudad(codigoCiudad)
);

-- Crear la tabla ClubJugador
CREATE TABLE ClubJugador (
    codigoClub INT,
    DNI INT,
    desde DATE,
    hasta DATE,
    PRIMARY KEY (codigoClub, DNI),
    FOREIGN KEY (codigoClub) REFERENCES Club(codigoClub),
    FOREIGN KEY (DNI) REFERENCES Jugador(DNI)
);