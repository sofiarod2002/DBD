-- Crear base de datos
CREATE DATABASE ejercicio5;

-- Tabla Localidad
CREATE TABLE Localidad (
    CodigoPostal INT PRIMARY KEY,
    nombreL VARCHAR(255),
    descripcion VARCHAR(255),
    habitantes INT
);

-- Tabla Arbol
CREATE TABLE Arbol (
    nroArbol INT PRIMARY KEY,
    especie VARCHAR(255),
    años INT,
    calle VARCHAR(255),
    nro INT,
    codigoPostal INT,
    FOREIGN KEY (codigoPostal) REFERENCES Localidad(CodigoPostal)
);

-- Tabla Podador
CREATE TABLE Podador (
    DNI INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    telefono VARCHAR(15),
    fnac DATE,
    codigoPostalVive INT,
    FOREIGN KEY (codigoPostalVive) REFERENCES Localidad(CodigoPostal)
);

-- Tabla Poda
CREATE TABLE Poda (
    codPoda INT PRIMARY KEY,
    fecha DATE,
    DNI INT,
    nroArbol INT,
    FOREIGN KEY (DNI) REFERENCES Podador(DNI),
    FOREIGN KEY (nroArbol) REFERENCES Arbol(nroArbol)
);
-- Agregar la restricción de clave foránea a la tabla Poda
ALTER TABLE Poda
ADD FOREIGN KEY (nroArbol) REFERENCES Arbol(nroArbol);
