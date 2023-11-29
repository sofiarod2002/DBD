CREATE DATABASE ejercicio7;

use ejercicio7;

-- Crear la tabla Técnico
CREATE TABLE Tecnico (
    codTec INT PRIMARY KEY,
    nombre VARCHAR(255),
    especialidad VARCHAR(255)
);

-- Crear la tabla Repuesto
CREATE TABLE Repuesto (
    codRep INT PRIMARY KEY,
    nombre VARCHAR(255),
    stock INT,
    precio DECIMAL(10, 2)
);

-- Crear la tabla Reparación
CREATE TABLE Reparacion (
    nroReparac INT PRIMARY KEY,
    codTec INT,
    precio_total DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (codTec) REFERENCES Tecnico(codTec)
);

-- Crear la tabla RepuestoReparacion
CREATE TABLE RepuestoReparacion (
    nroReparac INT,
    codRep INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    PRIMARY KEY (nroReparac, codRep),
    FOREIGN KEY (nroReparac) REFERENCES Reparacion(nroReparac),
    FOREIGN KEY (codRep) REFERENCES Repuesto(codRep)
);


